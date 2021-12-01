package com.project.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.jeju.service.BoardQnaService;
import com.project.jeju.service.BoardQnaReplyService;

@Controller
public class BoardQnaReplyController {

	@Autowired
	private BoardQnaReplyService bqrs;
	@Autowired
	private BoardQnaService bqs;
	
}
