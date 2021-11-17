package com.project.jeju.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardReviewReplyDao {

	@Autowired 
	private SqlSessionTemplate sst;
}
