package com.project.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.jeju.service.BoardReviewService;

@Controller
public class BoardReviewController {

	@Autowired
	private BoardReviewService brs;
}
