package com.project.jeju.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardQanReplyDao {

	@Autowired 
	private SqlSessionTemplate sst;
}
