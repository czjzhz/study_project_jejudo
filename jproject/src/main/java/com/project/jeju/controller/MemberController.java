package com.project.jeju.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.util.StringTokenizer;
import java.util.UUID;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.jeju.model.MemberBean;
import com.project.jeju.service.MemberService;


@Controller
public class MemberController {

//	// 로그 기록 처리 (메소드 관리)
//private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService ms;

	
	// 로그인 폼 뷰
	@RequestMapping("/MemberLogin.do")
	public String mlogin() {

		return "member/memberLogin";
		// member폴더의 memberLogin.jsp 뷰 페이지 실행
	}

	// 회원가입 폼 뷰1 (회원약관)
	@RequestMapping("/Agreement.do")
	public String agree() {

		return "member/agreement";
		// member 폴더의 agreement.jsp 뷰 페이지 실행
	}

	// 회원가입 폼 뷰2 (회원약관 -> 회원가입 폼)
	@RequestMapping("/MemberJoin.do")
	public String mjoin() {

		return "member/memberJoin";
		// member 폴더의 memberJoin.jsp 뷰 페이지 실행
	}

	 // 로그인 실행 (인증)
	@RequestMapping("MemberLoginok.do")
	public String mloginok(@RequestParam("id") String id,
						   @RequestParam("passwd") String passwd,
						   HttpSession session,	
						   Model model) throws Exception {
		int result = 0;
		MemberBean mb = ms.userCheck(id);
		 
		if (mb == null) { 		// 등록되지 않은 회원일 떄
			
			result = 1;
			model.addAttribute("result", result);
			
			return "member/loginResult";
		
		} else {				// 등록된 회원일 때
			if (mb.getPasswd().equals(passwd)) {// 비번이 같을 때
				session.setAttribute("id", id);
				
				String name = mb.getName();
				String profile = mb.getProfile();

				model.addAttribute("name", name);
				model.addAttribute("profile", profile);

				return "member/main";
				
			} else { // 비번이 다를때
				result = 2;
				model.addAttribute("result", result);
				
				return "member/loginResult";				
			}
		}


	}
		
		
//	// ID중복검사 ajax함수로 처리부분
	@RequestMapping(value = "/Memberidcheck.do", method = RequestMethod.POST)
	public String memberIdc(String mid, Model model) throws Exception {
		System.out.println("id:" + mid);
		
		int result = ms.checkMemberId(mid);
		model.addAttribute("result", result);
		
		return "member/idcResult";
		
	}
	
	// 닉네임 중복검사 ajax함수로 처리부분
	@RequestMapping(value = "/Membernickcheck.do", method = RequestMethod.POST)
	public String memberNic(String nickname, Model model) throws Exception {
		System.out.println("nickname:"+nickname);
		
		int result = ms.checkMemberNick(nickname);
		model.addAttribute("result", result);
		
		return "member/idcResult";
		
	}
	

	
	/* 회원 가입 저장(fileupload) */
	@RequestMapping(value = "/MemberJoinok.do", method = RequestMethod.POST)
	public String mjoinok(@RequestParam("profilepic") MultipartFile mf, 
								 MemberBean mb,
								 HttpServletRequest request,
								 Model model) throws Exception {

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize(); 	// 첨부파일의 크기 (단위:Byte) 

		String path = request.getRealPath("upload"); // webapp - upload (사진 경로)
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename); // filename="Koala.jpg"
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int presult=0;
		
		String file[] = new String[2];
//		file = filename.split(".");
//		System.out.println(file.length);
//		System.out.println("file0="+file[0]);
//		System.out.println("file1="+file[1]);
		
		String newfilename = "";
	
	if(filename != ""){	 // 첨부파일이 전송된 경우	
		
		// 파일 중복문제 해결
		String extension = filename.substring(filename.lastIndexOf("."), filename.length());
		System.out.println("extension:"+extension);
		
		UUID uuid = UUID.randomUUID();
		
		newfilename = uuid.toString() + extension;
		System.out.println("newfilename:"+newfilename);		
		
		StringTokenizer st = new StringTokenizer(filename, ".");
		file[0] = st.nextToken();		// 파일명		Koala
		file[1] = st.nextToken();		// 확장자	    jpg
		
		if(size > 200000){				// 200KB
			presult=1;
			model.addAttribute("presult", presult);
			
			return "member/uploadResult";
			
		}else if(!file[1].equals("jpg") &&
				 !file[1].equals("gif") &&
				 !file[1].equals("png") ){
			
			presult=2;
			model.addAttribute("presult", presult);
			
			return "member/uploadResult";
		}
	}	

		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + newfilename));

		}

		String phone1 = request.getParameter("phone1").trim();
		String phone2 = request.getParameter("phone2").trim();
		String phone3 = request.getParameter("phone3").trim();
		String phone = phone1 + "-" + phone2 + "-" + phone3;

		String mailid = request.getParameter("mailid").trim();
		String maildomain = request.getParameter("maildomain").trim();
		String email = mailid + "@" + maildomain;

		mb.setPhone(phone);
		mb.setEmail(email);
		mb.setProfile(newfilename); // 중복된 파일  이름 바꿔서  저장

		int result = ms.insertMember(mb);
		model.addAttribute("result", result);
		
		return "member/popup";
	}	
	
	
	// 로그아웃
		@RequestMapping("MemberLogout.do")
		public String logout(HttpSession session) {
			session.invalidate();
//			logger.info("bye logout success");
			return "redirect:/";			
//			return "member/memberLogout";
		}	
		
		
		
}
