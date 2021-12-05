package com.project.jeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.jeju.model.BoardReviewBean;

@Repository
public class BoardReviewDao {

	@Autowired 
	private SqlSessionTemplate sst;

	public List<BoardReviewBean> list(BoardReviewBean boardreview) {
		return sst.selectList("brns.list", boardreview);
	}

	public int getTotal(BoardReviewBean boardreview) {
		return sst.selectOne("brns.getTotal", boardreview);
	}

	public int insert(BoardReviewBean boardreview) {
		return sst.insert("brns.insert", boardreview);
	}

	public void selectUpdate(int rno) {
		sst.update("brns.selectUpdate", rno);
	}

	public BoardReviewBean select(int rno) {
		return sst.selectOne("brns.select", rno);
	}
	
	public int update(BoardReviewBean boardreview) {
		return sst.update("brns.update", boardreview);
	}

	public int delete(int rno) {
		return sst.delete("brns.delete", rno);
	}
	
}
