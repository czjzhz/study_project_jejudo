package com.project.jeju.controller;

import java.io.File;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.jeju.model.BoardQnaBean;
import com.project.jeju.model.BoardReviewBean;
import com.project.jeju.service.BoardReviewService;
import com.project.jeju.service.PagingPgm;

@Controller
public class BoardReviewController {

	@Autowired
	private BoardReviewService brs;
	
	// 리스트
	@RequestMapping("rboardlist.do")
	public String list(String pageNum, BoardReviewBean boardreview, Model model) {
		final int rowPerPage = 10;						// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);	// 현재페이지
		
		int total = brs.getTotal(boardreview); 			// 검색
		System.out.println("total:"+total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		boardreview.setStartRow(startRow);
		boardreview.setEndRow(endRow);
		
		int no = total - startRow + 1;					// 화면 출력 번호
		List<BoardReviewBean> rboardlist = brs.list(boardreview);
		System.out.println("rboardlist:"+rboardlist);
		
		model.addAttribute("rboardlist", rboardlist);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		
		// 검색
		model.addAttribute("search", boardreview.getSearch());
		model.addAttribute("keyword", boardreview.getKeyword());
		
		return "boardreview/boardreviewlist";
	}
	
	// 작성폼 이동
	@RequestMapping("rboardinsertForm.do")				// QnA 글작성 폼이동
	public String insertForm(String pageNum, Model model) {
		model.addAttribute("pageNum", pageNum);
		return "/boardreview/boardreviewinsertform";
	}

	// 인서트
	@RequestMapping("rboardinsert.do")					// QnA 글작성
	public String insert(@RequestParam("boardreviewfile") MultipartFile mf,
							BoardReviewBean boardreview,
							HttpServletRequest request,
							HttpSession session,
							Model model,
							String pageNum) throws Exception {
		System.out.println("upload in");
		String rip = request.getRemoteAddr();

		
		String filename = mf.getOriginalFilename();
				
		int size = (int) mf.getSize();
		
		String path = request.getRealPath("upload");
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		
		int rresult=0;
		
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
				rresult=1;
				model.addAttribute("rresult", rresult);
			
				return "boardreview/ruploadResult";
			
			}else if(!file[1].equals("jpg") &&
					 !file[1].equals("gif") &&
					 !file[1].equals("png") ){
				
				rresult=2;
				model.addAttribute("rresult", rresult);
				
				return "boardreview/ruploadResult";
			}
		}

		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + newfilename));

		}
		
		boardreview.setRip(rip);
		boardreview.setRfile(newfilename);
		int result = brs.insert(boardreview);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result",result);
			
		return "boardreview/boardreviewinsert";
	}
	
	// 상세페이지
	@RequestMapping("rboardview.do")					// 리뷰 상세페이지
	public String view(int rno, String pageNum, Model model, HttpSession session) {
		brs.selectUpdate(rno);							// 리뷰 조회수 증가
		BoardReviewBean boardreview= brs.select(rno);
		model.addAttribute("boardreview", boardreview);
		model.addAttribute("pageNum", pageNum);
		return "boardreview/boardreviewview";
	}
		
	//파일다운
	@RequestMapping("rfiledown.do")
	public String download(HttpSession session) {
		return "boardreview/filedown";
	}
	
	@RequestMapping("rboardupdateform.do")						// 수정폼
	public String updateform(int rno, String pageNum, Model model, HttpSession session) throws Exception{
		
		BoardReviewBean boardreview = brs.select(rno);
		model.addAttribute("boardreview", boardreview);
		model.addAttribute("pageNum", pageNum);
		
		return "boardreview/boardreviewupdateform";
	}
	
	@RequestMapping("rboardupdate.do")
	public String update(@RequestParam("boardreviewfile") MultipartFile mf,
							BoardReviewBean boardreview,
							String pageNum,
							HttpServletRequest request,
							HttpSession session,
							Model model) throws Exception {
		
		int rno = boardreview.getRno();	
		
		BoardReviewBean boardreviewupdate = brs.select(rno);
		
		String rip = request.getRemoteAddr();
		
		String filename = mf.getOriginalFilename();
				
		int size = (int) mf.getSize();
		
		String path = request.getRealPath("upload");
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		
		int rresult=0;
		
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
				rresult=1;
				model.addAttribute("rresult", rresult);
			
				return "boardreview/ruploadResult";
			
			}else if(!file[1].equals("jpg") &&
					 !file[1].equals("gif") &&
					 !file[1].equals("png") ){
				
				rresult=2;
				model.addAttribute("rresult", rresult);
				
				return "boardreview/ruploadResult";
			}
		}

		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + newfilename));

		}
	//	String id = (String) session.getAttribute("id");
		
		if (size > 0 ) {	// 첨부파일 수정
			boardreview.setRfile(newfilename);
		}else {				// 첨부파일 미수정
			boardreview.setRfile(boardreviewupdate.getRfile());
		}
		boardreview.setRip(rip);

		int result = brs.update(boardreview);
		
		model.addAttribute("rno", rno);
		model.addAttribute("result",result);
		model.addAttribute("boardreview",boardreview);
		model.addAttribute("pageNum",pageNum);
		
		return "boardreview/boardreviewupdate";				
	}
	
	@RequestMapping("rboarddelete.do")
	public String delete(int rno, String pageNum, Model model, HttpServletRequest request, HttpSession session) {
		int result = brs.delete(rno);
		
		model.addAttribute("result",result);
		model.addAttribute("pageNum",pageNum);
		
		return "boardreview/boardreviewdelete";
	}
	
}
