package com.project.jeju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.Project_Dao;

@Service
public class Project_Service {

	@Autowired
	private Project_Dao prodao;
}
