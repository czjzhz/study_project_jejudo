package com.project.jeju.controller;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.jeju.model.CalendarBean;
import com.project.jeju.service.CalendarService;

import scala.util.parsing.json.JSON;
import scala.util.parsing.json.JSONObject;

@Controller
public class CalendarController {

	
	@Autowired 
	private CalendarService calendarservice;
	
	@RequestMapping("calendargo.do")
	public String calendargo() {
		return "calendar/calendar";
	}
		
//	public CalendarBean calendar(@ModelAttribute  List<Map> alldata) {
//	public CalendarBean calendar(HttpServletRequest request) {
//	public CalendarBean calendar(Map alldata) {
//	public CalendarBean calendar(CalendarBean alldata) {
	@RequestMapping("calendar.do")
	@ResponseBody
	public CalendarBean calendar(String alldata) {
		System.out.println("성공");	
		System.out.println(alldata);	
		
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			List<Map<String, Object>> map = mapper.readValue(alldata, List.class);
		//	HashMap<String, String> map = mapper.readValue(alldata, HashMap.class);
//			Map<String, String> map = mapper.readValue(alldata, Map.class);
			System.out.println(map);
			System.out.println("변환성공");
			for (int i=0; i<map.size(); i++) {
				System.out.println(map.get(i));
				
				int result = calendarservice.insert(map.get(i));
				if(result == 1)	System.out.println("데이터 입력 성공");			
			}
//			System.out.println(map.get(title));
//			System.out.println(map.get("allday"));
//			System.out.println(map.get("start"));
//			System.out.println(map.get("end"));
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		CalendarBean cal = new CalendarBean();
		return cal;
	}
		
	
}
