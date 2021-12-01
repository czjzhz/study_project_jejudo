package com.project.jeju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.BoardQanReplyDao;

@Service
public class BoardQnaReplyService {

	@Autowired
	private BoardQanReplyDao bqrdao;
}
