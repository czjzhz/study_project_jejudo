package com.project.jeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.BoardQanReplyDao;
import com.project.jeju.model.BoardQnaReplyBean;

@Service
public class BoardQnaReplyService {

	@Autowired
	private BoardQanReplyDao bqrdao;

	public List<BoardQnaReplyBean> list(int qno) {
		return bqrdao.list(qno);
	}

	public void insert(BoardQnaReplyBean qr) {
		bqrdao.insert(qr);
	}

	public void update(BoardQnaReplyBean qr) {
		bqrdao.update(qr);
	}

	public void delete(int qrno) {
		bqrdao.delete(qrno);
	}
}
