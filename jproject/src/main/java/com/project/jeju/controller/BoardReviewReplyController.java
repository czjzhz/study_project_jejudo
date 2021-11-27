package com.project.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.jeju.service.BoardReviewService;
import com.project.jeju.service.BoardReviewReplyService;

@Controller
public class BoardReviewReplyController {

	@Autowired
	private BoardReviewReplyService brrs;
	@Autowired
	private BoardReviewService brs;
	
}
