package com.project.jeju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.BoardAccomDao;

@Service
public class BoardAccomService {

	@Autowired
	private BoardAccomDao badao;
}
