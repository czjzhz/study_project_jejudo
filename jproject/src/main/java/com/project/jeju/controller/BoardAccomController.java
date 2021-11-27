package com.project.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.jeju.service.BoardAccomService;

@Controller
public class BoardAccomController {

	@Autowired
	private BoardAccomService bas;
}
