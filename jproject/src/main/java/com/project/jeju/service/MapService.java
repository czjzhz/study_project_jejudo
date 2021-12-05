package com.project.jeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.MapDao;
import com.project.jeju.model.MapBean;

@Service
public class MapService {
	
	@Autowired
	private MapDao MapDao;
	
	/* 지도 쓰기 */
	public int MapAdd(MapBean mapb) {
		return MapDao.MapAdd(mapb);
	}
	/* 전체 지도 수 가져오기 */
	public int getMapTotal(MapBean mapb) {
		return MapDao.getMapTotal(mapb);
	}
	/* 지도 리스트 가져오기 */
	public List<MapBean> MapList(MapBean mapb) {
		return MapDao.MapList(mapb);
	}
	/* 지도 수정 리스트 가져오기 */
	public List<MapBean> MapUpdateList(int ano) {
		return MapDao.MapUpdateList(ano);
	}
	/* 지도 수정 후 옛데이터 삭제 */
	public int MapDelete(int ano) {
		return MapDao.MapDelete(ano);
	}
}
	