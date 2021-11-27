package com.project.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.jeju.service.Project_Service;

@Controller
public class Project_Controller {

	@Autowired
	private Project_Service proservice;
}
