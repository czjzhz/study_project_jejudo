package com.project.jeju.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Project_Dao {

	@Autowired
	private SqlSession session;
}
