package com.project.jeju.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.UUID;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.jeju.model.BoardQnaBean;
import com.project.jeju.model.MemberBean;
import com.project.jeju.service.MemberService;

@Controller
public class MemberController {

//	// 로그 기록 처리 (메소드 관리)
//private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService ms;

	
	/*---------------------------------------------------
	 * 회원정보
	 * -------------------------------------------------*/

	// 로그인 폼 뷰
	@RequestMapping("/MemberLogin.do")
	public String mlogin() {

		return "member/memberLogin";
		// member폴더의 memberLogin.jsp 뷰 페이지 실행
	}

	// 비밀번호 찾기 폼 뷰
	@RequestMapping(value = "/PwdFind.do")
	public String pfind() {
		return "member/pwdFind";
		// member 폴더의 pwdFind.jsp 뷰 페이지 실행
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
	public String mloginok(@RequestParam("id") String id, @RequestParam("passwd") String passwd, HttpSession session,
			Model model) throws Exception {
		int result = 0;
		MemberBean mb = ms.userCheck(id);
		
		if (mb == null) { // 등록되지 않은 회원일 떄

			result = 1;
			model.addAttribute("result", result);

			return "member/loginResult";

		} else { // 등록된 회원일 때
			if (mb.getPasswd().equals(passwd)) {// 비번이 같을 때
				session.setAttribute("mb", mb); // 닉네임을 사용예정이라 id값이 아닌 닉네임 포함된 dto로 받아옴

				String name = mb.getName();
				String profile = mb.getProfile();

				model.addAttribute("name", name);
				model.addAttribute("profile", profile);

				return "home";

			} else { // 비번이 다를때
				result = 2;
				model.addAttribute("result", result);

				return "member/loginResult";
			}
		}

	}

	// ID 중복검사 ajax함수로 처리부분
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
		System.out.println("nickname:" + nickname);

		int result = ms.checkMemberNick(nickname);
		System.out.println("result:" + result);
		
		model.addAttribute("result", result);

		return "member/nickcResult";

	}

	// 아이디 중복검사
	@RequestMapping(value = "/Membernamecheck.do", method = RequestMethod.POST)
	public String memberNam(String name, Model model) throws Exception {
		System.out.println("name:" + name);

		int result = ms.checkMemberName(name);
		model.addAttribute("result", result);

		return "member/idcResult";
	}

	/* 회원 가입 저장(fileupload) */
	@RequestMapping(value = "/MemberJoinok.do", method = RequestMethod.POST)
	public String mjoinok(@RequestParam("profilepic") MultipartFile mf, MemberBean mb, HttpServletRequest request,
			Model model) throws Exception {

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize(); // 첨부파일의 크기 (단위:Byte)

		String path = request.getRealPath("upload"); // webapp - upload (사진 경로)
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename); // filename="Koala.jpg"
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int presult = 0;

		String file[] = new String[2];
//		file = filename.split(".");
//		System.out.println(file.length);
//		System.out.println("file0="+file[0]);
//		System.out.println("file1="+file[1]);

		String newfilename = "";

		if (filename != "") { // 첨부파일이 전송된 경우

			// 파일 중복문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			System.out.println("extension:" + extension);

			UUID uuid = UUID.randomUUID();

			newfilename = uuid.toString() + extension;
			System.out.println("newfilename:" + newfilename);

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken(); // 파일명 Koala
			file[1] = st.nextToken(); // 확장자 jpg

			if (size > 200000) { // 200KB
				presult = 1;
				model.addAttribute("presult", presult);

				return "member/uploadResult";

			} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

				presult = 2;
				model.addAttribute("presult", presult);

				return "member/uploadResult";
			}
		}

		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + newfilename));

		}
		System.out.println("첨부파일 저장");

		String phone1 = request.getParameter("phone1").trim();
		String phone2 = request.getParameter("phone2").trim();
		String phone3 = request.getParameter("phone3").trim();
		String phone = phone1 + "-" + phone2 + "-" + phone3;

		String mailid = request.getParameter("mailid").trim();
		String maildomain = request.getParameter("maildomain").trim();
		String email = mailid + "@" + maildomain;

		mb.setPhone(phone);
		mb.setEmail(email);
		mb.setProfile(newfilename); // 중복된 파일 이름 바꿔서 저장

		int result = ms.insertMember(mb);
		model.addAttribute("result", result);
		return "member/popup";
	}

	// 회원정보 (마이페이지)
	@RequestMapping("Mypage.do")
	public String mypage(HttpSession session, MemberBean mb, Model model) throws Exception{
		
		MemberBean member = (MemberBean) session.getAttribute("mb");
		
		MemberBean edit = ms.userCheck(member.getId());
		
		List<BoardQnaBean> myqna = ms.getQna(member.getId());
		System.out.println("myqna:"+myqna);
		
		model.addAttribute("edit", edit);
		model.addAttribute("myqna", myqna);
		
		return "member/mypage";
	}
	
	// 회원정보 수정 폼 (프로필 변경)
	@RequestMapping(value = "/MemberUpdate.do")
	public String memberUpdate(HttpSession session, MemberBean mb, Model model) throws Exception {

		MemberBean m = (MemberBean) session.getAttribute("mb");
		MemberBean edit = ms.userCheck(m.getId());

		String phone = edit.getPhone();
		StringTokenizer st1 = new StringTokenizer(phone, "-");
		// java.util 패키지의 StringTokenizer 클래스는 첫번째 전달인자를
		// 두번째 -를 기준으로 문자열을 파싱해준다.
		String phone1 = st1.nextToken(); // 첫번째 전화번호 저장
		String phone2 = st1.nextToken(); // 두번째 전화번호 저장
		String phone3 = st1.nextToken(); // 세번째 전화번호 저장

		String email = edit.getEmail();
		StringTokenizer st2 = new StringTokenizer(email, "@");
		// java.util 패키지의 StringTokenizer 클래스는 첫번째 전달인자를
		// 두번째 @를 기준으로 문자열을 파싱해준다.
		String emailid = st2.nextToken();		// 이메일 저장
		String maildomain = st2.nextToken();  // 메일주소 저장

		model.addAttribute("edit", edit);
		model.addAttribute("phone1", phone1);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		model.addAttribute("emailid", emailid);
		model.addAttribute("maildomain", maildomain);

		return "member/memberUpdate";
	}
	
	// 회원정보 수정 저장 (프로필 변경 저장)
	@RequestMapping(value = "/MemberUpdateok.do", method = RequestMethod.POST)
	public String memberUpdateok(@RequestParam("profilepic") MultipartFile mf, MemberBean mb, HttpServletRequest request,
			Model model) throws Exception {

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize(); // 첨부파일의 크기 (단위:Byte)

		String path = request.getRealPath("upload"); // webapp - upload (사진 경로)
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename); // filename="Koala.jpg"
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int presult = 0;

		String file[] = new String[2];
//		file = filename.split(".");
//		System.out.println(file.length);
//		System.out.println("file0="+file[0]);
//		System.out.println("file1="+file[1]);

		String newfilename = "";

		if (filename != "") { // 첨부파일이 전송된 경우

			// 파일 중복문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			System.out.println("extension:" + extension);

			UUID uuid = UUID.randomUUID();

			newfilename = uuid.toString() + extension;
			System.out.println("newfilename:" + newfilename);

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken(); // 파일명 Koala
			file[1] = st.nextToken(); // 확장자 jpg

			if (size > 200000) { // 200KB
				presult = 1;
				model.addAttribute("presult", presult);

				return "member/uploadResult";

			} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

				presult = 2;
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
		
		
		MemberBean edit = ms.userCheck(mb.getId());	
		System.out.println("db이미지:"+edit.getProfile());
		
		if (size > 0) {								// 첨부파일을 수정한 경우
			mb.setProfile(newfilename);				// 중복된 파일 이름 바꿔서 저장
		}else {										// 첨부파일을 수정하지 않은 경우       주석값 수정필요
			mb.setProfile(edit.getProfile()); 		// DB에 저장된 프로필을 불러옴	
		}

		mb.setPhone(phone);
		mb.setEmail(email);

		int result = ms.updateMember(mb);   
		model.addAttribute("result", result);

		return "member/popupUpdate";
	}	
	
	
	// 로그아웃
	@RequestMapping("MemberLogout.do")
	public String logout(HttpSession session) {
		session.invalidate();
//			logger.info("bye logout success");
//			return "redirect:/";			
		return "member/memberLogout";
	}

	
	// 회원 탈퇴 폼
	@RequestMapping(value = "/MemberDel.do")
	public String memberdel(HttpSession session, MemberBean mb, Model model) throws Exception {
		System.out.println("memberdel in");
		
		MemberBean me = (MemberBean) session.getAttribute("mb");
		MemberBean del = ms.userCheck(me.getId());
		System.out.println("del:"+del);
		
//		model.addAttribute("id", id);
//		model.addAttribute("name", mb.getName());
		model.addAttribute("del", del);

		return "member/memberDel";
	}

	// 회원 탈퇴 저장 (탈퇴 완료) 
	@RequestMapping(value = "/MemberDelok.do", method = RequestMethod.POST)
	public String memberdelok(MemberBean mb, HttpSession session, Model model) throws Exception {

//		MemberBean mb = (MemberBean) session.getAttribute("mb");
//
//		if (!mb.getPasswd().equals(pass)) {
//
//			return "member/deleteResult";
//			
//		} else {				// 비번이 같은 경우
//			
//			String up = session.getServletContext().getRealPath("upload");
//	//		String filename = filename.getprofile();
//			System.out.println("up:"+up);
//			
//			// 디비에 저장된 기존 이진파일명을 가져옴
////			if (filename != null) {// 기존 이진파일이 존재하면
////				File delFile = new File(up +"/"+filename);
////				delFile.delete();// 기존 이진파일을 삭제
////			}
//			MemberBean delm = new MemberBean();
////			delm.setId(id);
////			delm.setDelcont(delcont);

			ms.deleteMember(mb);	// 삭제 메서드 호출

			session.invalidate();	// 세션만료
			
			model.addAttribute("result", "1");

			return "member/popupDelete";
		}
	
	//
	//
	//
	//
	//
	

	
	// 회원 닉네임 수정 폼 (마이페이지)
	@RequestMapping(value = "/MemberUpdatenick.do")
	public String memberupdatenick(HttpSession session, Model model) throws Exception {
		System.out.println("닉네임 수정폼");
//		MemberBean m = (MemberBean) session.getAttribute("mb");
//		MemberBean edit = ms.userCheck(m.getId());
//		System.out.println("닉네임 수정체크2");
//		
//		model.addAttribute("edit", edit);		
		
		return "member/memberUpdatenick";
	}
	
	// 회원닉네임 수정 저장 (마이페이지)
	@RequestMapping(value = "/MemberUpdatenickok.do", method = RequestMethod.POST)
	public String memberupdatenickok(HttpServletRequest request, MemberBean mb, Model model) throws Exception {

		int result = ms.updateNickMember(mb);   
		model.addAttribute("result", result);

		return "member/popupUpdaten";
	}	
		
	// 회원 비밀번호 수정 폼 (마이페이지)
	@RequestMapping(value = "/MemberUpdatepass.do")
	public String memberupdatepass(HttpSession session, MemberBean mb, Model model) throws Exception {
//		System.out.println("비밀번호 수정체크1");
//		MemberBean m = (MemberBean) session.getAttribute("mb");
//		MemberBean edit = ms.userCheck(m.getId());
//		System.out.println("비밀번호 수정체크2");
		return "member/memberUpdatepass";
	}
	
	// 회원 비밀번호 수정 저장 (마이페이지)
	@RequestMapping(value = "/MemberUpdatepassok.do", method = RequestMethod.POST)
	public String memberupdatepassok(HttpServletRequest request, MemberBean mb, Model model) throws Exception {
//		System.out.println("비밀번호 업데이트");

		int result = ms.updatePassMember(mb);   
		model.addAttribute("result", result);

		return "member/popupUpdatep";
	}	
	
	
	
	
    }	


	// 회원 비밀번호 변경 폼
	// 회원 비밀번호 변경



