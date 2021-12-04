//package com.project.jeju.controller;
//
//import java.io.PrintWriter;
//import java.util.Random;
//
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.commons.mail.HtmlEmail;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.project.jeju.model.MemberBean;
//import com.project.jeju.service.MemberService;
//
//
//
//
//@Controller
//public class MailController {
//	@Autowired
//	private MemberService ms;
//
//	// 비밀번호 찾기 
//	@RequestMapping(value = "/PwdFindok.do", method = RequestMethod.POST)
//		public String pfindok(@ModelAttribute MemberBean pm, HttpServletResponse response, Model model) throws Exception {
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//
//			MemberBean mb = ms.findpwd(pm);
//
//			if (mb == null) {// 값이 없는 경우
//
//				return "member/pwdResult";
//
//			} else {
//
//			}		
//			
//		// Mail Server 설정 
//		String charSet = "utf-8";
//		String hostSMTP = "smtp.naver.com";
//		String hostSMTPid = "czjzhz1111@naver.com";
//		String hostSMTPpwd = "choongang1969"; // 비밀번호
//
//		// 보내는 사람 EMail, 제목, 내용 
//		String fromEmail = "czjzhz1111@naver.com";
//		String fromName = "JEJU FRIEND";
//		String subject = "제주동행 플랫폼 인증메일입니다.";
//
//		// 받는 사람 E-Mail 주소 
//		String mail = mb.getEmail();
//
//		try {
//			HtmlEmail email = new HtmlEmail();
//			email.setDebug(true);
//			email.setCharset(charSet);
//			email.setSSL(true);
//			email.setHostName(hostSMTP);
//			email.setSmtpPort(587);
//
//			email.setAuthentication(hostSMTPid, hostSMTPpwd);
//			email.setTLS(true);
//			email.addTo(mail, charSet);
//			email.setFrom(fromEmail, fromName, charSet);
//			email.setSubject(subject);
//			email.setHtmlMsg("<p align = 'center'>JEJU FRIEND에 오신것을 환영합니다.</p><br>" 
//							+ "<div align='center'> 인증번호 : " + //a +
//					mb.getPasswd() +  "</div>");
//			email.send();
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//		model.addAttribute("pwdok", "good!\n 등록된 E-Mail 확인");
//
//		return "member/memberLogin";
//	}
//}	





//		// Mail Server 설정 
//		String charSet = "utf-8";
//		String hostSMTP = "smtp.naver.com";
//		String hostSMTPid = "czjzhz1111@naver.com";
//		String hostSMTPpwd = "choongang1969"; // 비밀번호 
//
//		// 보내는 사람 EMail, 제목, 내용 
//		String fromEmail = "czjzhz1111@naver.com";
//		String fromName = "JEJU FRIEND";
//		String subject = "제주동행 플랫폼 인증메일입니다.";
//
//		// 받는 사람 E-Mail 주소 
//		String mail = "";
//
//		try {
//			HtmlEmail email = new HtmlEmail();
//			email.setDebug(true);
//			email.setCharset(charSet);
//			email.setSSL(true);
//			email.setHostName(hostSMTP);
//			email.setSmtpPort(587);
//
//			email.setAuthentication(hostSMTPid, hostSMTPpwd);
//			email.setTLS(true);
//			email.addTo(mail, charSet);
//			email.setFrom(fromEmail, fromName, charSet);
//			email.setSubject(subject);
//			email.setHtmlMsg("<p align = 'center'>JEJU FRIEND에 오신것을 환영합니다.</p><br>" + "<div align='center'> 인증번호 : " + a
//					+ "</div>");
//			email.send();
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//		model.addAttribute("result", "good!\n 등록된 E-Mail 확인");
//
//		return "result";
//	}
