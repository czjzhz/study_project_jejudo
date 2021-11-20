package com.project.jeju.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.jeju.model.BoardQnaBean;
import com.project.jeju.model.MemberBean;
import com.project.jeju.service.BoardQnaService;
import com.project.jeju.service.PagingPgm;


@Controller
public class BoardQnaController {

	@Autowired
	private BoardQnaService bqs;

	@RequestMapping("/qboardlist.do")					// QnA 목록, 검색 목록
	public String list(String pageNum, BoardQnaBean boardqna, Model model) {
		final int rowPerPage = 10;						// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);	// 현재페이지
		
		int total = bqs.getTotal(boardqna); 			// 검색
		System.out.println("total:"+total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		boardqna.setStartRow(startRow);
		boardqna.setEndRow(endRow);
		
		int no = total - startRow + 1;					// 화면 출력 번호
		List<BoardQnaBean> qboardlist = bqs.list(boardqna);
		System.out.println("qboardlist:"+qboardlist);
		
		model.addAttribute("qboardlist", qboardlist);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		
		// 검색
		model.addAttribute("search", boardqna.getSearch());
		model.addAttribute("keyword", boardqna.getKeyword());
		
		return "boardqna/boardqnalist";
	}
	
	@RequestMapping("qboardinsertForm.do")				// QnA 글작성 폼이동
	public String insertForm(String pageNum, Model model) {
		model.addAttribute("pageNum", pageNum);
		return "/boardqna/boardqnainsertform";
	}
	
	@RequestMapping("qboardinsert.do")					// QnA 글작성
	public String insert(@RequestParam("boardqnafile") MultipartFile mf,
							BoardQnaBean boardqna, 
							HttpServletRequest request,
//							MultipartHttpServletRequest multirequset,
							Model model	) throws Exception {
		System.out.println("upload in");
//		int qno = boardqna.getQno();	
		String qip = request.getRemoteAddr();
		
		String filename = mf.getOriginalFilename();
				
		int size = (int) mf.getSize();
		
		String path = request.getRealPath("upload");
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		
		int qresult=0;
		
		String file[] = new String[2];
		
		String newfilename = "";
		
		if(filename != "") {
			
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());		
			System.out.println("extension:"+extension);

			UUID uuid = UUID.randomUUID();
			System.out.println("uuid:"+uuid);
			
			newfilename = uuid.toString() + extension;
			System.out.println("newfilename:"+newfilename);
			
			StringTokenizer st = new StringTokenizer(newfilename, ".");
			file[0] = st.nextToken();		
			file[1] = st.nextToken();		// 확장자	
			
			if(size > 200000){
				qresult=1;
				model.addAttribute("qresult", qresult);
			
				return "boardqna/quploadResult";
			
			}else if(!file[1].equals("jpg") &&
					 !file[1].equals("gif") &&
					 !file[1].equals("png") ){
				
				qresult=2;
				model.addAttribute("qresult", qresult);
				
				return "boardqna/quploadResult";
			}
		}

		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + newfilename));

		}
		
//		boardqna.setId(id);
//		boardqna.setNickname(nickname);
		boardqna.setQip(qip);
		boardqna.setQfile(newfilename);
		int result = bqs.insert(boardqna);
		model.addAttribute("result",result);
			
		return "boardqna/boardqnainsert";
	}
	
	@RequestMapping("qboardview.do")					// QnA 상세페이지
	public String view(int qno, String pageNum, Model model) {
		bqs.selectUpdate(qno);							// QnA 조회수 증가
		BoardQnaBean boardqna = bqs.select(qno);
		model.addAttribute("boardqna", boardqna);
		model.addAttribute("pageNum", pageNum);
		return "boardqna/boardqnaview";
	}
		
	@RequestMapping("qboardupdate.do")						// 수정폼
	public String updateform(int qno, String pageNum, Model model, HttpSession session) throws Exception{
//		String id = (String) session.getAttribute("id");
				
//		MemberBean editm = memberService.userCheck(id);		
		System.out.println("update in");
		BoardQnaBean boardqna = bqs.select(qno);
		model.addAttribute("boardqna", boardqna);
		model.addAttribute("pageNum", pageNum);
		
		return "boardqna/boardqnaupdateform";
	}
	
}
