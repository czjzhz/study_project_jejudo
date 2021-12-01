package com.project.jeju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.MapDao;

@Service
public class MapService {
	
	@Autowired
	private MapDao MapDao;
	
}
	