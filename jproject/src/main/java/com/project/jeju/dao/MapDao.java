package com.project.jeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.jeju.model.MapBean;

@Repository
public class MapDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	/* 지도 쓰기 */
	public int MapAdd(MapBean mapb) {
		return sst.insert("mapns.MapAdd", mapb);
	}
	/* 전체 지도 수 가져오기 */
	public int getMapTotal(MapBean mapb) {
		return sst.selectOne("mapns.getMapTotal", mapb);
	}
	/* 지도 리스트 가져오기 */ 
	public List<MapBean> MapList(MapBean mapb) {
		return sst.selectList("mapns.MapList", mapb);
	}
	/* 지도 수정 리스트 가져오기 */ 
	public List<MapBean> MapUpdateList(int ano) {
		return sst.selectList("mapns.MapUpdateList", ano);
	}
	/* 지도 수정 후 옛데이터 삭제 */
	public int MapDelete(int ano) {
		return sst.delete("mapns.MapDelete", ano);
	}
}
