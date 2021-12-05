package com.project.jeju.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.jeju.model.AdminAdBean;
import com.project.jeju.model.AdminBean;
import com.project.jeju.model.AdminMemberBean;
import com.project.jeju.model.AdminNoticeBean;
import com.project.jeju.model.AdminQnaBean;
import com.project.jeju.model.AdminQnaReplyBean;
import com.project.jeju.model.AdminReviewBean;
import com.project.jeju.model.AdminReviewReplyBean;
import com.project.jeju.service.AdminService;
import com.project.jeju.service.PagingPgm;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminservice;
	
	// 로그인 & 로그아웃
	/* 로그인 폼 이동 */
	@RequestMapping(value = "/admin_login.do")
	public String admin_login() {
		return "admin/adminLogin";
	}

	/* 로그인 인증 */
	@RequestMapping(value = "/admin_login_action.do", method = RequestMethod.POST)
	public String admin_login_action(@RequestParam("id") String id,@RequestParam("passwd") String passwd, 
									HttpSession session, Model model) throws Exception {
		int result=0;		
		AdminBean m = adminservice.userCheck(id);

		if(m == null) {
			result = 1;
			model.addAttribute("result", result);
			return "admin/loginResult";
		}else {
			if(m.getAdminpasswd().equals(passwd)){
				session.setAttribute("id", id);
				return "redirect:admin_member.do";
			}else {
				result = 2;
				model.addAttribute("result", result);
				return "admin/loginResult";
			}
		}
	}
	
	/* 로그아웃 */
	@RequestMapping(value = "/admin_logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "admin/adminLogout";
	}
	
	// 회원관리
	/* 회원관리 리스트 */
	@RequestMapping(value = "/admin_member.do")
	public String admin_member(String pageNum, AdminMemberBean adminmember, 
							HttpSession session, Model model) throws Exception {
		
		final int rowPerPage = 10;						// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);	// 현재페이지
		
		int total = adminservice.getMemberTotal(adminmember); // 검색
		System.out.println("total:"+total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		adminmember.setStartRow(startRow);
		adminmember.setEndRow(endRow);
		
		int no = total - startRow + 1;					// 화면 출력 번호
		List<AdminMemberBean> memberlist = adminservice.Memberlist(adminmember);
		System.out.println("memberlist:"+memberlist);
		
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		
		// 검색
		model.addAttribute("search", adminmember.getSearch());
		model.addAttribute("keyword", adminmember.getKeyword());
		System.out.println("search : "+adminmember.getSearch());
		System.out.println("keyword : "+adminmember.getKeyword());
		
		
		return "admin/adminmember";
	}
	
	/* 회원정지 및 해제 */
	@RequestMapping(value = "/admin_member_stop.do")
	public String admin_member_stop (@RequestParam String id, @RequestParam String pageNum, @RequestParam int state, 
									HttpSession session, Model model) throws Exception {
		System.out.println("state : "+state);
		int result = 0;
		if (state == 1) {
			result = adminservice.StateChange1(id);
		}else{
			result = adminservice.StateChange3(id);			
		}
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		
		return "admin/adminmemberstop";
	}

	// 공지관리
	/* 공지 리스트 */
	@RequestMapping(value = "/admin_notice.do")
	public String admin_notice(String pageNum, AdminNoticeBean adminnotice, 
							HttpSession session, Model model) throws Exception {
		
		final int rowPerPage = 10;						// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);	// 현재페이지
		
		int total = adminservice.getNoticeTotal(adminnotice); // 검색
		System.out.println("total:"+total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		adminnotice.setStartRow(startRow);
		adminnotice.setEndRow(endRow);
		
		int no = total - startRow + 1;					// 화면 출력 번호
		List<AdminNoticeBean> noticelist = adminservice.Noticelist(adminnotice);
		
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		
		return "admin/adminNoticeList";
	}
	
	/* 공지 블라인드 설정 및 해제 */
	@RequestMapping(value = "/admin_notice_blind.do")
	public String admin_notice_blind (@RequestParam int nno, @RequestParam String pageNum, @RequestParam int nhide, 
									HttpSession session, Model model) throws Exception {
		int result = 0;
		if (nhide == 0) {
			result = adminservice.nhideChange0(nno);
		}else{
			result = adminservice.nhideChange1(nno);			
		}
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		
		return "admin/adminNoticeBlind";
	}

	/* 공지 글쓰기 양식 */
	@RequestMapping(value = "/admin_notice_add.do")
	public String admin_notice_add (HttpSession session, Model model) throws Exception {
		return "admin/adminNoticeAdd";
	}
	
	/* 공지 글쓰기 완료 */
	@RequestMapping(value = "/admin_notice_add_action.do")
	public String admin_notice_add_action (AdminNoticeBean adminnotice, 
										HttpSession session, Model model) throws Exception {
		int result = 0;
		result = adminservice.NoticeAdd(adminnotice);
		model.addAttribute("result", result);
		
		return "admin/adminNoticeAddAction";
	}

	/* 공지 글수정 양식 */
	@RequestMapping(value = "/admin_notice_update.do")
	public String admin_notice_update (@RequestParam int nno, @RequestParam String pageNum, 
										HttpSession session, Model model) {
		
		AdminNoticeBean list = adminservice.NoticeUpdateSelect(nno);
		
		model.addAttribute("list", list);
		model.addAttribute("nno", nno);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminNoticeUpdate";
	}

	/* 공지 글수정 완료 */
	@RequestMapping(value = "/admin_notice_update_action.do")
	public String admin_notice_update_action (@RequestParam int nno, AdminNoticeBean adminnotice, 
			HttpSession session, Model model) throws Exception {
		
		int result = 0;
		result = adminservice.NoticeUpdate(adminnotice);
		
		System.out.println("nno : "+nno);
		System.out.println("result : "+result);
		model.addAttribute("result", result);
		
		return "admin/adminNoticeAddAction";
	}
	
	/* 공지 글 삭제 */
	@RequestMapping(value = "/admin_notice_delete.do")
	public String admin_notice_delete (@RequestParam int nno, AdminNoticeBean adminnotice, 
			HttpSession session, Model model) throws Exception {

		int result = 0;
		result = adminservice.NoticeDelete(adminnotice);
		
		System.out.println("nno : "+nno);
		System.out.println("result : "+result);
		model.addAttribute("result", result);
		
		return "admin/adminNoticeDelete";
	}

	// 광고관리
	/* 광고 리스트 */
	@RequestMapping(value = "/admin_ad.do")
	public String admin_ad(String pageNum, AdminAdBean adminad, 
							HttpSession session, Model model) throws Exception {
		
		final int rowPerPage = 10;						// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);	// 현재페이지
		
		int total = adminservice.getAdTotal(adminad); // 검색
		System.out.println("total:"+total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		adminad.setStartRow(startRow);
		adminad.setEndRow(endRow);
		
		int no = total - startRow + 1;					// 화면 출력 번호
		List<AdminAdBean> adlist = adminservice.Adlist(adminad);
		
		model.addAttribute("adlist", adlist);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		
		return "admin/adminAdList";
	}

	/* 광고 글쓰기 양식 */
	@RequestMapping(value = "/admin_ad_add.do")
	public String admin_ad_add (HttpSession session, Model model) throws Exception {
		return "admin/adminAdAdd";
	}
	
	/* 광고 글쓰기 완료 */
	@RequestMapping(value = "/admin_ad_add_action.do")
	public String admin_ad_add_action (AdminAdBean adminad, 
										HttpSession session, Model model) throws Exception {
		int result = 0;
		result = adminservice.AdAdd(adminad);
		model.addAttribute("result", result);
		
		return "admin/adminAdAddAction";
	}

	/* 광고 글수정 양식 */
	@RequestMapping(value = "/admin_ad_update.do")
	public String admin_ad_update (@RequestParam int adno, @RequestParam String pageNum, 
										HttpSession session, Model model) {
		
		AdminAdBean list = adminservice.AdUpdateSelect(adno);
		
		model.addAttribute("list", list);
		model.addAttribute("adno", adno);
		model.addAttribute("pageNum", pageNum);
		return "admin/adminAdUpdate";
	}

	/* 광고 글수정 완료 */
	@RequestMapping(value = "/admin_ad_update_action.do")
	public String admin_ad_update_action (@RequestParam int adno, AdminAdBean adminad, 
			HttpSession session, Model model) throws Exception {
		
		int result = 0;
		result = adminservice.AdUpdate(adminad);
		
		System.out.println("adno : "+adno);
		System.out.println("result : "+result);
		model.addAttribute("result", result);
		
		return "admin/adminAdAddAction";
	}
	
	/* 광고 글 삭제 */
	@RequestMapping(value = "/admin_ad_delete.do")
	public String admin_ad_delete (@RequestParam int adno, AdminAdBean adminad, 
			HttpSession session, Model model) throws Exception {

		int result = 0;
		result = adminservice.AdDelete(adminad);
		
		System.out.println("adno : "+adno);
		System.out.println("result : "+result);
		model.addAttribute("result", result);
		
		return "admin/adminAdDelete";
	}

	/* 광고 사진 업로드 */
    @RequestMapping(value="/admin_image.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,HttpServletResponse response, 
    		    MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception{
    	System.out.println("admin_image.do : Start");
    	// 랜덤 문자 생성
    	UUID uid = UUID.randomUUID();
    	
    	OutputStream out = null;
    	PrintWriter printWriter = null;
    	
    	//인코딩
    	response.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
    	
    	try{
    		//파일 이름 가져오기
    		String fileName = upload.getOriginalFilename();
    		byte[] bytes = upload.getBytes();
    		
    		//이미지 경로 생성
    		String path = "/Users/parkdavie/Desktop" + "ckImage/";	// 이미지 경로 설정(폴더 자동 생성)
    		String ckUploadPath = path + uid + "_" + fileName;
    		File folder = new File(path);
    		System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
    		//해당 디렉토리 확인
    		if(!folder.exists()){
    			try{
    				folder.mkdirs(); // 폴더 생성
    		}catch(Exception e){
    			e.getStackTrace();
    		}
    	}
    	
    	out = new FileOutputStream(new File(ckUploadPath));
    	out.write(bytes);
    	out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
    	
    	String callback = request.getParameter("CKEditorFuncNum");
    	printWriter = response.getWriter();
    	String fileUrl = "admin_image_get.do?uid=" + uid + "&fileName=" + fileName; // 작성화면
    	
    	// 업로드시 메시지 출력
    	printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
    	printWriter.flush();
    	
    	}catch(IOException e){
    		e.printStackTrace();
    	} finally {
    		try {
    		if(out != null) { out.close(); }
    		if(printWriter != null) { printWriter.close(); }
    	} catch(IOException e) { e.printStackTrace(); }
    	}
    	return;
    }
    
    /* 광고 사진 가져오기 */
    @RequestMapping(value="/admin_image_get.do")
    public void ckSubmit(@RequestParam(value="uid") String uid
    		, @RequestParam(value="fileName") String fileName
    		, HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
    	
    	System.out.println("admin_image_get.do : Start");
    	//서버에 저장된 이미지 경로
    	String path = "/Users/parkdavie/Desktop" + "ckImage/";	// 저장된 이미지 경로
    	System.out.println("path:"+path);
    	String sDirPath = path + uid + "_" + fileName;
    	
    	File imgFile = new File(sDirPath);
    	
    	//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
    	if(imgFile.isFile()){
    		byte[] buf = new byte[1024];
    		int readByte = 0;
    		int length = 0;
    		byte[] imgBuf = null;
    		
    		FileInputStream fileInputStream = null;
    		ByteArrayOutputStream outputStream = null;
    		ServletOutputStream out = null;
    		
    		try{
    			fileInputStream = new FileInputStream(imgFile);
    			outputStream = new ByteArrayOutputStream();
    			out = response.getOutputStream();
    			
    			while((readByte = fileInputStream.read(buf)) != -1){
    				outputStream.write(buf, 0, readByte); 
    			}
    			
    			imgBuf = outputStream.toByteArray();
    			length = imgBuf.length;
    			out.write(imgBuf, 0, length);
    			out.flush();
    			
    		}catch(IOException e){
    			e.printStackTrace();
    		}finally {
    			outputStream.close();
    			fileInputStream.close();
    			out.close();
    			}
    		}
    }

    // QnA 관리
    /* qna 리스트 가져오기 */
    @RequestMapping(value = "/admin_qna.do")
	public String admin_qna(String pageNum, AdminQnaBean adminqna, 
							HttpSession session, Model model) throws Exception {
		
		final int rowPerPage = 10;						// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);	// 현재페이지
		
		int total = adminservice.getQnaTotal(adminqna); // 검색
		System.out.println("total:"+total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		adminqna.setStartRow(startRow);
		adminqna.setEndRow(endRow);
		
		int no = total - startRow + 1;					// 화면 출력 번호
		List<AdminQnaBean> qnalist = adminservice.Qnalist(adminqna);
		
		model.addAttribute("qnalist", qnalist);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		
		return "admin/adminQnaList";
	} 
    /* qna 상세페이지 */
    @RequestMapping(value = "/admin_qna_view.do")
	public String admin_qna_view(String pageNum, int qno, AdminQnaBean adminqna, AdminQnaReplyBean adminqnar,
							HttpSession session, Model model) throws Exception {
    	
    	List<AdminQnaBean> qnaview = adminservice.Qnaview(qno);
    	List<AdminQnaReplyBean> rpview = adminservice.Rpview(qno);
    	
    	model.addAttribute("qnaview", qnaview);
    	model.addAttribute("rpview", rpview);
    	model.addAttribute("pageNum", pageNum);
    	return "admin/adminQnaView";
    }
    
    // 리뷰 관리
    /* 리뷰 리스트 가져오기 */
    @RequestMapping(value = "/admin_review.do")
    public String admin_review(String pageNum, AdminReviewBean adminrv, 
    		HttpSession session, Model model) throws Exception {
    	
    	final int rowPerPage = 10;						// 화면에 출력할 데이터 갯수
    	if (pageNum == null || pageNum.equals("")) {
    		pageNum = "1";
    	}
    	int currentPage = Integer.parseInt(pageNum);	// 현재페이지
    	
    	int total = adminservice.getReviewTotal(adminrv); // 검색
    	System.out.println("total:"+total);
    	
    	int startRow = (currentPage - 1) * rowPerPage + 1;
    	int endRow = startRow + rowPerPage - 1;
    	
    	PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
    	adminrv.setStartRow(startRow);
    	adminrv.setEndRow(endRow);
    	
    	int no = total - startRow + 1;					// 화면 출력 번호
    	List<AdminReviewBean> reviewlist = adminservice.ReviewList(adminrv);
    	
    	model.addAttribute("reviewlist", reviewlist);
    	model.addAttribute("no", no);
    	model.addAttribute("pp", pp);
    	
    	return "admin/adminReviewList";
    } 
    /* 리뷰 상세페이지 */
    @RequestMapping(value = "/admin_review_view.do")
    public String admin_review_view(String pageNum, int rno, AdminReviewBean adminrv, AdminReviewReplyBean adminrvrp,
    		HttpSession session, Model model) throws Exception {
    	
    	List<AdminReviewBean> reviewview = adminservice.Reviewview(rno);
    	List<AdminReviewReplyBean> rpview = adminservice.ReviewRpview(rno);
    	
    	model.addAttribute("reviewview", reviewview);
    	model.addAttribute("rpview", rpview);
    	model.addAttribute("pageNum", pageNum);
    	return "admin/adminReviewView";
    }
		
}