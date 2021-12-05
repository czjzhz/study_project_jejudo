package com.project.jeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.BoardReviewDao;
import com.project.jeju.model.BoardReviewBean;

@Service
public class BoardReviewService {

	@Autowired
	private BoardReviewDao brdao;

	public List<BoardReviewBean> list(BoardReviewBean boardreview) {
		return brdao.list(boardreview);
	}

	public int getTotal(BoardReviewBean boardreview) {
		return brdao.getTotal(boardreview);
	}

	public int insert(BoardReviewBean boardreview) {
		return brdao.insert(boardreview);
	}

	public void selectUpdate(int rno) {
		brdao.selectUpdate(rno);
	}

	public BoardReviewBean select(int rno) {
		return brdao.select(rno);
	}
	
	public int update(BoardReviewBean boardreview) {
		return brdao.update(boardreview);
	}

	public int delete(int rno) {
		return brdao.delete(rno);
	}
	
}
