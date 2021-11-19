package com.project.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jeju.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;

	@RequestMapping("/memberLogin.do")
	public String memberLogin() {
		return "member/memberLogin";
		// member폴더의 memberLogin.jsp 뷰 페이지 실행
	}
}
