package com.project.jeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.BoardReviewReplyDao;
import com.project.jeju.model.BoardReviewReplyBean;

@Service
public class BoardReviewReplyService {

	@Autowired
	private BoardReviewReplyDao brrdao;

	public List<BoardReviewReplyBean> list(int rno) {
		return brrdao.list(rno);
	}

	public int insert(BoardReviewReplyBean rr) {
		return brrdao.insert(rr);
	}

	public void update(BoardReviewReplyBean rr) {
		brrdao.update(rr);
	}

	public void delete(int rrno) {
		brrdao.delete(rrno);
	}
}
