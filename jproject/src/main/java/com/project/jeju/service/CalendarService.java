package com.project.jeju.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.CalendarDao;

@Service
public class CalendarService {

	@Autowired(required = false)
	private CalendarDao calendardao;

	public int insert(Map map) {
		return calendardao.insert(map);
	} 
	
}
