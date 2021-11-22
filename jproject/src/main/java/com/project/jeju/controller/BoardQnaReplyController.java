package com.project.jeju.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jeju.model.BoardQnaBean;
import com.project.jeju.model.BoardQnaReplyBean;
import com.project.jeju.service.BoardQnaReplyService;
import com.project.jeju.service.BoardQnaService;

@Controller
public class BoardQnaReplyController {

	@Autowired
	private BoardQnaReplyService bqrs;
	@Autowired
	private BoardQnaService bqs;
	
	// 댓글 목록
	@RequestMapping("qrlist.do/qno{qno}")
	public String qrlist(@PathVariable int qno, Model model) {
		BoardQnaBean boardqna = bqs.select(qno);
		List<BoardQnaReplyBean> qrlist = bqrs.list(qno);
		
		model.addAttribute("qrlist",qrlist);
		model.addAttribute("boardqna", boardqna);
		return "boardqnareply";
	}
	
	// 댓글 입력
	@RequestMapping("qrinsert.do")
	public String qrinsert(BoardQnaReplyBean qr, Model model) {
		bqrs.insert(qr);
		return "boardqnareply/qno/" + qr.getQno();
//		return "redirect:boardqnareply/qno/" + qr.getQno();
	}
	
	// 댓글 수정
	@RequestMapping("qrupdate.do")
	public String qrupdate(BoardQnaReplyBean qr, Model model) {
		bqrs.update(qr);
		return "boardqnareply/qno/" + qr.getQno();
//		return "redirect:boardqnareply/qno/" + qr.getQno();
	}
	
	// 댓글 삭제
	@RequestMapping("qrdelete.do")
	public String qrdelete(BoardQnaReplyBean qr, Model model) {
		bqrs.delete(qr);
		return "boardqnareply/qno/" + qr.getQno();
//		return "redirect:boardqnareply/qno/" + qr.getQno();
	}
	
}
