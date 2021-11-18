package com.project.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jeju.service.MemberService;

	@Controller public class MemberController {

		@Autowired
		private MemberService memberService;
	
	@RequestMapping("/member_login.do")
	public String member_login() {
		return "member/member_login";
		// member 폴더의 member_login.jsp 뷰 페이지 실행
	}
}
