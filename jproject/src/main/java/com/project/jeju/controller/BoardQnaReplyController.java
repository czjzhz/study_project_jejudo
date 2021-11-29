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
	@RequestMapping("boardqnareply.do")
	public String qrlist(int qno, Model model) {
		BoardQnaBean boardqna = bqs.select(qno);
		List<BoardQnaReplyBean> qrlist = bqrs.list(qno);
		System.out.println("qrlist:"+qrlist);
		
		model.addAttribute("qrlist",qrlist);
		model.addAttribute("boardqna", boardqna);
		return "boardqna/boardqnareply";
	}
	
	// 댓글 입력
	@RequestMapping("qrinsert.do")
	public String qrinsert(BoardQnaReplyBean qr, Model model) {
		System.out.println("reply in");
		int result = bqrs.insert(qr);
		System.out.println("result:" + result);
		return "redirect:boardqnareply.do?qno=" + qr.getQno();
//		return "redirect:boardqnareply/qno/" + qr.getQno();
	}
	
	// 댓글 수정
	@RequestMapping("qrupdate.do")
	public String qrupdate(BoardQnaReplyBean qr, Model model) {
		System.out.println("123");
		bqrs.update(qr);
		return "redirect:boardqnareply.do?qno=" + qr.getQno();
//		return "redirect:boardqnareply/qno/" + qr.getQno();
	}
	
	// 댓글 삭제
	@RequestMapping("qrdelete.do")
	public String qrdelete(BoardQnaReplyBean qr, Model model) {
		bqrs.delete(qr.getQrno());
		return "redirect:boardqnareply.do?qno=" + qr.getQno();
//		return "redirect:boardqnareply/qno/" + qr.getQno();
	}
	
}
