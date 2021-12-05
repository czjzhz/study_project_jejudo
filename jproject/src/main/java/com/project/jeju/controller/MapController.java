package com.project.jeju.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.jeju.model.MapBean;
import com.project.jeju.service.MapService;
import com.project.jeju.service.PagingPgm;

@Controller
public class MapController {
	
	@Autowired
	private MapService maps;
	
	/* 지도 목록 */
	@RequestMapping(value = "/map_list.do")
	public String map_view(String pageNum, MapBean mapb, HttpSession session, Model model) throws Exception {
		
		final int rowPerPage = 10;						// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);	// 현재페이지
		
		int total = maps.getMapTotal(mapb); // 검색
		System.out.println("total:"+total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		mapb.setStartRow(startRow);
		mapb.setEndRow(endRow);
		
		int no = total - startRow + 1;					// 화면 출력 번호
		List<MapBean> maplist = maps.MapList(mapb);
		
		model.addAttribute("maplist", maplist);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		
		return "map/mapList";
	}
	
	/* 지도 쓰기 */
	@RequestMapping(value = "/map_add.do")
	public String map_add() {
		return "map/mapAdd";
	}
	/* 지도 쓰기 완료 */
	@RequestMapping(value = "/map_add_action.do")
	public String map_add_action(HttpServletRequest request, MapBean mapb, @RequestParam int ano, @RequestParam int mloc, Model model) {
		
		System.out.println("map_add_action.do");
		
		String[] memo = request.getParameterValues("memo"); 
		String[] lat = request.getParameterValues("lat"); 
		String[] lng = request.getParameterValues("lng");
		
		int result=1;
		int cal=1;
		for (int i=0; i<mloc; i++) {
			mapb.setMmemo(memo[i]);
			mapb.setMlat(lat[i]);
			mapb.setMlng(lng[i]);
			mapb.setMapno(i+1);
			System.out.println(i+" memo : "+mapb.getMmemo());
			System.out.println(i+" lat : "+mapb.getMlat());
			System.out.println(i+" lng : "+mapb.getMlng());
			cal = maps.MapAdd(mapb);
			result = (cal+result)/2;
			System.out.println(i+" result :"+result);
		}
		model.addAttribute("result", result);
		
		return "map/mapAction";
	}
	/* 지도 수정 */
	@RequestMapping(value = "/map_update.do")
	public String map_update(@RequestParam int ano, @RequestParam int mloc, @RequestParam String pageNum, MapBean mapb, Model model) {

		System.out.println("map_update.do");
		List<MapBean> maplist = maps.MapUpdateList(ano);
		System.out.println(maplist);
		
		model.addAttribute("ano", ano);
		model.addAttribute("mloc", mloc);
		model.addAttribute("maplist", maplist);
		model.addAttribute("pageNum", pageNum);
		
		return "map/mapUpdate";
	}
	/* 지도 수정 완료 */
	@RequestMapping(value = "/map_update_action.do")
	public String map_update_action(HttpServletRequest request, MapBean mapb, @RequestParam int ano, @RequestParam int mloc, Model model) {
		
		System.out.println("map_update_action.do");

		int result=1;
		int cal=1;
		cal = maps.MapDelete(ano);
		result = (cal+result)/2;
		System.out.println(" old delete result :"+result);

		String[] memo = request.getParameterValues("memo"); 
		String[] lat = request.getParameterValues("lat"); 
		String[] lng = request.getParameterValues("lng");
		
		for (int i=0; i<mloc; i++) {
			mapb.setMmemo(memo[i]);
			mapb.setMlat(lat[i]);
			mapb.setMlng(lng[i]);
			mapb.setMapno(i+1);
			System.out.println(i+" memo : "+mapb.getMmemo());
			System.out.println(i+" lat : "+mapb.getMlat());
			System.out.println(i+" lng : "+mapb.getMlng());
			cal = maps.MapAdd(mapb);
			result = (cal+result)/2;
			System.out.println(i+" new add result :"+result);
		}
		model.addAttribute("result", result);
		
		return "map/mapAction";
	}
	
	/* 지도 상세페이지 */
	@RequestMapping(value = "/map_view.do")
	public String map_view(@RequestParam int ano, @RequestParam int mloc, @RequestParam String pageNum, MapBean mapb, Model model) {

		System.out.println("map_view.do");
		List<MapBean> maplist = maps.MapUpdateList(ano);
		System.out.println(maplist);
		
		model.addAttribute("ano", ano);
		model.addAttribute("mloc", mloc);
		model.addAttribute("maplist", maplist);
		model.addAttribute("pageNum", pageNum);
		
		return "map/mapView";
	}
}
