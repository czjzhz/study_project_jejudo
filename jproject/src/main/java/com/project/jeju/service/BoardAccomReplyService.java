package com.project.jeju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.BoardAccomReplyDao;

@Service
public class BoardAccomReplyService {

	@Autowired
	private BoardAccomReplyDao bardao;
}
