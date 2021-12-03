package com.project.jeju.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.jeju.model.MemberBean;
import com.project.jeju.model.MessageBean;
import com.project.jeju.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	MessageService service;

	// 보낸 쪽지함
	@RequestMapping("sendlist.do")
	public String sendlist(HttpServletRequest request, HttpSession session, Model model) {

		MemberBean mb = (MemberBean) session.getAttribute("mb");

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 보낸 쪽지 데이터 갯수
		int listcount = service.getScount(mb);
		System.out.println("listcount:" + listcount);

		Map m = new HashMap();
		m.put("nickname", mb.getNickname());
		m.put("page", page);

		List<MessageBean> sendlist = service.getSendlist(m);
		System.out.println("sendlist:" + sendlist);

		// 보낸 쪽지함 총 페이지
		int pageCount = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10 * limit + 1);
		int endPage = startPage + 10 - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("sendlist", sendlist);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return "message/messagesendlist";
	}

	// 받은 쪽지함
	@RequestMapping("rcvlist.do")
	public String rcvlist(HttpServletRequest request, HttpSession session, Model model) {

		MemberBean mb = (MemberBean) session.getAttribute("mb");

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 받은 쪽지 데이터 갯수
		int listcount = service.getRcount(mb);
		System.out.println("listcount:" + listcount);

		Map m = new HashMap();
		m.put("nickname", mb.getNickname());
		m.put("page", page);

		List<MessageBean> rcvlist = service.getRcvlist(m);
		System.out.println("rcvlist:" + rcvlist);

		// 받은 쪽지함 총 페이지
		int pageCount = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10 * limit + 1);
		int endPage = startPage + 10 - 1;

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("rcvlist", rcvlist);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return "message/messagercvlist";
	}

	// 쪽지 작성 폼
	@RequestMapping("messageform.do")
	public String messageform(String nickname, HttpSession session, Model model) {
		
		model.addAttribute("nickname", nickname);
		
//		MemberBean member = (MemberBean) session.getAttribute("mb");
//		System.out.println("nick:" + member.getNickname());
				
		return "message/messageform";
	}

	// 쪽지 작성
	@RequestMapping("messagesend.do")
	public String messagesend(MessageBean message, Model model,
							  HttpServletRequest request, HttpSession session) {
		System.out.println("sender:" + message.getSendid());
		System.out.println("receiver:" + message.getRcvid());
		

		int result = service.insert(message);
		System.out.println("result:" + result);

		model.addAttribute("result", result);

		return "message/messagesend";
	}
	
	// 쪽지 작성 폼 닫기
	@RequestMapping("messageclose.do")
	public String close() {
		return "message/close";
	}

	// 쪽지 답장 작성 폼
	@RequestMapping("messagereplyform.do")
	public String messagereply(@RequestParam String sendid, @RequestParam String rcvid, MessageBean message, Model model, HttpSession session) {
		
		model.addAttribute("sendid", sendid);
		model.addAttribute("rcvid", rcvid);
		
		return "message/messagereplyform";
	}

	// 쪽지 답장 작성
	@RequestMapping("messagereply.do")
	public String messagereply(HttpServletRequest request, MessageBean message, Model model) {
		System.out.println("sender:" + message.getSendid());
		System.out.println("receiver:" + message.getRcvid());
		
		int result = service.insertreply(message);
		System.out.println("result:" + result);
		
		model.addAttribute("result", result);
		
		return "message/messagereply";
	}

	// 보낸 쪽지 상세 페이지
	@RequestMapping("messagesendview.do")
	public String messageview(int mno, Model model) {

		MessageBean message = service.getSendmessage(mno);

		model.addAttribute("message", message);

		return "message/messagesendview";
	}
	
	// 보낸 쪽지 상세 페이지
	@RequestMapping("messagercvview.do")
	public String messagercvview(int mno, Model model) {
		
		MessageBean message = service.getRcvmessage(mno);
		
		model.addAttribute("message", message);
		
		return "message/messagercvview";
	}
	
	// 쪽지 삭제
	@RequestMapping("messagedelete.do")
	public String messagedelete(int mno, String page, Model model, HttpServletRequest request, HttpSession session) {
		
		int result = service.delete(mno);
		
		model.addAttribute("result", result);
		model.addAttribute("page", page);
		
		return "message/deleteresult";
	}
	
}
