package com.project.jeju.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	}
	
//	// ID중복검사 ajax함수로 처리부분
//	@RequestMapping(value = "/memberIdc.do", method = RequestMethod.POST)
//	public String memberIdc(@RequestParam("mid") String id, Model model) throws Exception {
//		System.out.println("id:"+id);
//		
//		int result = MemberService.checkMemberId(id);
//		model.addAttribute("result", result);
//
//		return "member/idcResult";
		
	
	// 회원가입 폼 뷰
	@RequestMapping(value = "/memberJoin.do")
	public String memberJoin() {
		return "member/memberJoin";
		// member 폴더의 memberJoin.jsp 뷰 페이지 실행
	}
	
}
