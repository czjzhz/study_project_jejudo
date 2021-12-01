package com.project.jeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.BoardQnaDao;
import com.project.jeju.model.BoardQnaBean;

@Service
public class BoardQnaService {

	@Autowired
	private BoardQnaDao bqdao;

	public List<BoardQnaBean> list(BoardQnaBean boardqna) {
		return bqdao.list(boardqna);
	}

	public int getTotal(BoardQnaBean boardqna) {
		return bqdao.getTotel(boardqna);
	}


}
