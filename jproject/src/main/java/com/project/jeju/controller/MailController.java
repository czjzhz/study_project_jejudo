package com.project.jeju.controller;

import java.util.Random;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {

	@RequestMapping("/mailsend.do")
	public String send(Model model) {

		Random random = new Random();
		int a = random.nextInt(100);

		// Mail Server 설정 
		String charSet = "utf-8";
		String hostSMTP = "smtp.google.com";
		String hostSMTPid = "jejufriend2021@google.com";
		String hostSMTPpwd = "happyday2021"; // 비밀번호

		// 보내는 사람 EMail, 제목, 내용 
		String fromEmail = "jejufriend2021@gmail.com";
		String fromName = "JEJU FRIEND";
		String subject = "제주동행 플랫폼 인증메일입니다.";

		// 받는 사람 E-Mail 주소 
		String mail = "";

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg("<p align = 'center'>JEJU FRIEND에 오신것을 환영합니다.</p><br>" + "<div align='center'> 인증번호 : " + a
					+ "</div>");
			email.send();
		} catch (Exception e) {
			System.out.println(e);
		}
		model.addAttribute("result", "good\n 등록된 E-Mail 확인");

		return "result";
	}
}
