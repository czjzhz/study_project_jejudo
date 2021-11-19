package com.project.jeju.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jeju.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;

	// 로그인 폼 뷰
	@RequestMapping("/memberLogin.do")
	public String memberLogin() {
		
		return "member/memberLogin";
		// member폴더의 memberLogin.jsp 뷰 페이지 실행
		
//		memberLogin_ok.do
		
		
	}
}
