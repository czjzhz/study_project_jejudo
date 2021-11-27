package com.project.jeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.jeju.model.BoardQnaReplyBean;

@Repository
public class BoardQanReplyDao {

	@Autowired 
	private SqlSessionTemplate sst;

	public List<BoardQnaReplyBean> list(int qno) {
		return sst.selectList("bqrns.list", qno);
	}

	public int insert(BoardQnaReplyBean qr) {
		return sst.insert("bqrns.insert", qr);
	}

	public void update(BoardQnaReplyBean qr) {
		sst.update("bqrns.update", qr);
	}

	public void delete(int qrno) {
		sst.delete("bqrns.delete", qrno);
	}
}
