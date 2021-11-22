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

	public int insert(BoardQnaBean boardqna) {
		return bqdao.insert(boardqna);
	}

	public BoardQnaBean select(int qno) {
		return bqdao.select(qno);
	}

	public void selectUpdate(int qno) {
		bqdao.selectUpudate(qno);
	}

	public int update(BoardQnaBean boardqna) {
		return bqdao.update(boardqna);
	}

	public int delete(int qno) {
		return bqdao.delete(qno);
	}


}
