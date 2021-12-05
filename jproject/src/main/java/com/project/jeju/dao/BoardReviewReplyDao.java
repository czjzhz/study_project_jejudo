package com.project.jeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.jeju.model.BoardReviewReplyBean;

@Repository
public class BoardReviewReplyDao {

	@Autowired 
	private SqlSessionTemplate sst;

	public List<BoardReviewReplyBean> list(int rno) {
		return sst.selectList("brrns.list", rno);
	}

	public int insert(BoardReviewReplyBean rr) {
		return sst.insert("brrns.insert", rr);
	}

	public void update(BoardReviewReplyBean rr) {
		sst.update("brrns.update", rr);
	}

	public void delete(int rrno) {
		sst.delete("brrns.delete", rrno);
	}
}
