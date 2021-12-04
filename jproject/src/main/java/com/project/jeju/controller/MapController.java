package com.project.jeju.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.jeju.service.MapService;

@Controller
public class MapController {
	
	@Autowired
	private MapService maps;

//	** 지도 DTO **
//	private int mapno;
//	private int ano;
//	private String maplatlng;
//	private String mapmemo;
	
	/* 지도 보기 */
	@RequestMapping(value = "/map_view.do")
	public String map_view() {
		return "map/mapView";
	}
	/* 지도 쓰기 */
	@RequestMapping(value = "/map_add.do")
	public String map_add() {
		return "map/mapAdd";
	}
	/* 지도 수정 */
	@RequestMapping(value = "/map_update.do")
	public String map_update() {
		return "map/mapUpdate";
	}
	/* 지도 쓰기,수정 완료 */
	@RequestMapping(value = "/map_action.do")
	public String map_action(HttpServletRequest request, Model model) {
		
		Enumeration Params = request.getParameterNames();
		while(Params.hasMoreElements()) {
			String name = (String) Params.nextElement();
			System.out.println(name+" : "+request.getParameter(name));
		}
		
		return "map/mapAction";
	}
//	public String map_action(HttpServletRequest request, Model model) {
//
//		Enumeration Params = request.getParameterNames();
//		while(Params.hasMoreElements()) {
//			String name = (String) Params.nextElement();
//			System.out.println(name+" : "+request.getParameter(name));
//		}
//		
//		return "map/mapAction";
//	}
	/* 지도 삭제 */
	@RequestMapping(value = "/map_delete.do")
	public String map_delete() {
		return "map/mapDelete";
	}
}
