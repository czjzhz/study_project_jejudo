package com.project.jeju.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jeju.model.BoardQnaBean;
import com.project.jeju.service.BoardQnaService;
import com.project.jeju.service.PagingPgm;


@Controller
public class BoardQnaController {

	@Autowired
	private BoardQnaService bqs;

	@RequestMapping("/qboardlist.do")					// QnA 목록, 검색 목록
	public String list(String pageNum, BoardQnaBean boardqna, Model model) {
		final int rowPerPage = 10;						// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);	// 현재페이지
		
		int total = bqs.getTotal(boardqna); 			// 검색
		System.out.println("total:"+total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		boardqna.setStartRow(startRow);
		boardqna.setEndRow(endRow);
		
		int no = total - startRow + 1;					// 화면 출력 번호
		List<BoardQnaBean> qboardlist = bqs.list(boardqna);
		System.out.println("qboardlist:"+qboardlist);
		
		model.addAttribute("qboardlist", qboardlist);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		
		// 검색
		model.addAttribute("search", boardqna.getSearch());
		model.addAttribute("keyword", boardqna.getKeyword());
		
		return "boardqna/boardqnalist";
	}
}
