package com.project.jeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.jeju.model.BoardQnaBean;

@Repository
public class BoardQnaDao {

	@Autowired 
	private SqlSessionTemplate sst;

	public List<BoardQnaBean> list(BoardQnaBean boardqna) {
		return sst.selectList("bqns.list", boardqna);
	}

	public int getTotel(BoardQnaBean boardqna) {
		return sst.selectOne("bqns.getTotal", boardqna);
	}
	
	
}
