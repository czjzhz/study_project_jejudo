package com.project.jeju.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.jeju.model.AdminAdBean;
import com.project.jeju.model.AdminBean;
import com.project.jeju.model.AdminMemberBean;
import com.project.jeju.model.AdminNoticeBean;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	// 로그인 & 로그아
	/* 로그인 인증 체크 */
	public AdminBean userCheck(String id) throws Exception {
		return sst.selectOne("adminid.logincheck", id);
	}
	
	// 회원관리 
	/* 전체 회원정보 수 가져오기 */
	public int getMemberTotal(AdminMemberBean adminmember) {
		return sst.selectOne("admember.getMemberTotal", adminmember);
	}
	/* 회원정보 리스트 가져오기 */ 
	public List<AdminMemberBean> MemberList(AdminMemberBean adminmember) {
		return sst.selectList("admember.MemberList", adminmember);
	}
	/* 회원상태 바꾸기 1>3 */
	public int StateChange1(String id) throws Exception {
		return sst.update("admember.StateChange1", id);
	}
	/* 회원상태 바꾸기 3>1 */
	public int StateChange3(String id) throws Exception {
		return sst.update("admember.StateChange3", id);
	}
	
	// 공지관리 
	/* 전체 공지 수 가져오기 */
	public int getNoticeTotal(AdminNoticeBean adminnotice) {
		return sst.selectOne("adnotice.getNoticeTotal", adminnotice);
	}
	/* 공지 리스트 가져오기 */ 
	public List<AdminNoticeBean> NoticeList(AdminNoticeBean adminnotice) {
		return sst.selectList("adnotice.NoticeList", adminnotice);
	}
	/* 공지상태 바꾸기 0>1 */
	public int nhideChange0(int nno) throws Exception {
		return sst.update("adnotice.nhideChange0", nno);
	}
	/* 공지상태 바꾸기 1>0 */
	public int nhideChange1(int nno) throws Exception {
		return sst.update("adnotice.nhideChange1", nno);
	}
	/* 공지 작성 */
	public int NoticeAdd(AdminNoticeBean adminnotice) {
		return sst.insert("adnotice.NoticeAdd", adminnotice);
	}
	/* 공지 수정 가져오기 */
	public AdminNoticeBean NoticeUpdateSelect(int nno) {
		return sst.selectOne("adnotice.NoticeUpdateSelect", nno);
	}
	/* 공지 수정 완료 */
	public int NoticeUpdate(AdminNoticeBean adminnotice) {
		return sst.update("adnotice.NoticeUpdate", adminnotice);
	}
	/* 공지 삭제 */
	public int NoticeDelete(AdminNoticeBean adminnotice) {
		return sst.delete("adnotice.NoticeDelete", adminnotice);
	}

	// 광고관리
	/* 광고 수 가져오기 */
	public int getAdTotal(AdminAdBean adminad) {
		return sst.selectOne("adad.getAdTotal", adminad);
	}
	/* 광고 리스트 가져오기 */
	public List<AdminAdBean> AdList(AdminAdBean adminad) {
		return sst.selectList("adad.AdList", adminad);
	}
	/* 광고 작성 */
	public int AdAdd(AdminAdBean adminad) {
		return sst.insert("adad.AdAdd", adminad);
	}
	/* 광고 수정 가져오기 */
	public AdminAdBean AdUpdateSelect(int adno) {
		return sst.selectOne("adad.AdUpdateSelect", adno);
	}
	/* 광고 수정 완료 */
	public int AdUpdate(AdminAdBean adminad) {
		return sst.update("adad.AdUpdate", adminad);
	}
	/* 광고 삭제 */
	public int AdDelete(AdminAdBean adminad) {
		return sst.delete("adad.AdDelete", adminad);
	}
}
