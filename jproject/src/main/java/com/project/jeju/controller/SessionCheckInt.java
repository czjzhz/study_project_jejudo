package com.project.jeju.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionCheckInt extends HandlerInterceptorAdapter {

	// preHandle(request,response,handler) 메소드
	// 1. Controller에서 요청(*.do)를 받기 전, preHandle()이 호출되어 가로채는 역할
	// 2. 로그인 하지 않아도(세션 없는 상태) 요청시 로그인 폼으로 이동하게 해주는 역할

	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if (id == null || id.equals("")) {
			response.sendRedirect("memberLogin.do"); // 세션 없을시, 로그인폼으로 돌아감
			return false;
		}
		return true;
	}

}
