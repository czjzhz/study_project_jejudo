package com.project.jeju.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jeju.service.BoardReviewService;
import com.project.jeju.model.BoardQnaBean;
import com.project.jeju.model.BoardQnaReplyBean;
import com.project.jeju.model.BoardReviewBean;
import com.project.jeju.model.BoardReviewReplyBean;
import com.project.jeju.service.BoardReviewReplyService;

@Controller
public class BoardReviewReplyController {

	@Autowired
	private BoardReviewReplyService brrs;
	@Autowired
	private BoardReviewService brs;
	
	// 댓글 목록
		@RequestMapping("boardreviewreply.do")
		public String rrlist(int rno, Model model) {
			
			BoardReviewBean boardreview = brs.select(rno);
			List<BoardReviewReplyBean> rrlist = brrs.list(rno);
			
			model.addAttribute("rrlist",rrlist);
			model.addAttribute("boardreview", boardreview);
			return "boardreview/boardreviewreply";
		}
		
		// 댓글 입력
		@RequestMapping("rrinsert.do")
		public String rrinsert(BoardReviewReplyBean rr, Model model) {
			int result = brrs.insert(rr);
			return "redirect:boardreviewreply.do?rno=" + rr.getRno();
		}
		
		// 댓글 수정
		@RequestMapping("rrupdate.do")
		public String rrupdate(BoardReviewReplyBean rr, Model model) {
			brrs.update(rr);
			return "redirect:boardreviewreply.do?rno=" + rr.getRno();
		}
		
		// 댓글 삭제
		@RequestMapping("rrdelete.do")
		public String rrdelete(BoardReviewReplyBean rr, Model model) {
			brrs.delete(rr.getRrno());
			return "redirect:boardreviewreply.do?rno=" + rr.getRno();
		}
	
	
}
