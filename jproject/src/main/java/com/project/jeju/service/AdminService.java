package com.project.jeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.AdminDao;
import com.project.jeju.model.AdminAdBean;
import com.project.jeju.model.AdminBean;
import com.project.jeju.model.AdminMemberBean;
import com.project.jeju.model.AdminNoticeBean;
import com.project.jeju.model.AdminQnaBean;
import com.project.jeju.model.AdminQnaReplyBean;
import com.project.jeju.model.AdminReviewBean;
import com.project.jeju.model.AdminReviewReplyBean;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao AdminDao;
	
	// 로그인 & 로그아웃  
	/* 로그인 인증 체크 */
	public AdminBean userCheck(String id) throws Exception{
		return AdminDao.userCheck(id);	
	}
	
	// 회원관리 
	/* 전체 회원정보 수 가져오기 */
	public int getMemberTotal(AdminMemberBean adminmember) {
		return AdminDao.getMemberTotal(adminmember);
	}
	/* 회원정보 리스트 가져오기 */
	public List<AdminMemberBean> Memberlist(AdminMemberBean adminmember) {
		return AdminDao.MemberList(adminmember);
	} 
	/* 회원상태 바꾸기 1>3 */
	public int StateChange1(String id) throws Exception {
		return AdminDao.StateChange1(id);
	}
	/* 회원상태 바꾸기 3>1 */
	public int StateChange3(String id) throws Exception {
		return AdminDao.StateChange3(id);
	}
	
	// 공지관리 
	/*  공지 수 가져오기 */
	public int getNoticeTotal(AdminNoticeBean adminnotice) {
		return AdminDao.getNoticeTotal(adminnotice);
	}
	/* 공지 리스트 가져오기 */
	public List<AdminNoticeBean> Noticelist(AdminNoticeBean adminnotice) {
		return AdminDao.NoticeList(adminnotice);
	} 
	/* 공지상태 바꾸기 0>1 */
	public int nhideChange0(int nno) throws Exception {
		return AdminDao.nhideChange0(nno);
	}
	/* 공지상태 바꾸기 1>0 */
	public int nhideChange1(int nno) throws Exception {
		return AdminDao.nhideChange1(nno);
	}
	/* 공지 쓰기 */
	public int NoticeAdd(AdminNoticeBean adminnotice) {
		return AdminDao.NoticeAdd(adminnotice);
	}
	/* 공지 수정 가져오기 */
	public AdminNoticeBean NoticeUpdateSelect(int nno) {
		return AdminDao.NoticeUpdateSelect(nno);
	}
	/* 공지 수정 완료 */
	public int NoticeUpdate(AdminNoticeBean adminnotice) {
		return AdminDao.NoticeUpdate(adminnotice);
	}
	/* 공지 삭제 */
	public int NoticeDelete(AdminNoticeBean adminnotice) {
		return AdminDao.NoticeDelete(adminnotice);
	}
	
	// 광고관리
	/* 광고 수 가져오기 */
	public int getAdTotal(AdminAdBean adminad) {
		return AdminDao.getAdTotal(adminad);
	}
	/* 광고 리스트 가져오기 */
	public List<AdminAdBean> Adlist(AdminAdBean adminad) {
		return AdminDao.AdList(adminad);
	} 
	/* 광고 쓰기 */
	public int AdAdd(AdminAdBean adminad) {
		return AdminDao.AdAdd(adminad);
	}
	/* 광고 수정 가져오기 */
	public AdminAdBean AdUpdateSelect(int adno) {
		return AdminDao.AdUpdateSelect(adno);
	}
	/* 광고 수정 완료 */
	public int AdUpdate(AdminAdBean adminad) {
		return AdminDao.AdUpdate(adminad);
	}
	/* 광고 삭제 */
	public int AdDelete(AdminAdBean adminad) {
		return AdminDao.AdDelete(adminad);
	}
	
	// QnA 관리
	/* QnA 수 가져오기 */
	public int getQnaTotal(AdminQnaBean adminqna) {
		return AdminDao.getQnaTotal(adminqna);
	}
	/* QnA 리스트 가져오기 */
	public List<AdminQnaBean> Qnalist(AdminQnaBean adminqna) {
		return AdminDao.QnaList(adminqna);
	} 
	/* QnA 본문 상세페이지 가져오기 */
	public List<AdminQnaBean> Qnaview(int qno) {
		return AdminDao.QnaView(qno);
	} 
	/* QnA 댓글 상세페이지 가져오기 */
	public List<AdminQnaReplyBean> Rpview(int qno) {
		return AdminDao.RpView(qno);
	} 
	/* QnA 블라인드 Y>N */
	public int qnaChangetN(int qno) throws Exception {
		return AdminDao.qnaChangetN(qno);
	}
	/* QnA 블라인드 N>Y */
	public int qnaChangeY(int qno) throws Exception {
		return AdminDao.qnaChangeY(qno);
	}
	/* QnA 본문 삭제 */
	public int QnaDelete(int qno) throws Exception {
		return AdminDao.QnaDelete(qno);
	}
	/* QnA 댓글 삭제 */
	public int QnaRpDelete(int qrno) throws Exception {
		return AdminDao.QnaRpDelete(qrno);
	}

	// 리뷰 관리
	/* 리뷰 수 가져오기 */
	public int getReviewTotal(AdminReviewBean adminrv) {
		return AdminDao.getReviewTotal(adminrv);
	}
	/* 리뷰 리스트 가져오기 */
	public List<AdminReviewBean> ReviewList(AdminReviewBean adminrv) {
		return AdminDao.ReviewList(adminrv);
	} 
	/* 리뷰 본문 상세페이지 가져오기 */
	public List<AdminReviewBean> Reviewview(int rno) {
		return AdminDao.Reviewview(rno);
	} 
	/* 리뷰 댓글 상세페이지 가져오기 */
	public List<AdminReviewReplyBean> ReviewRpview(int rno) {
		return AdminDao.ReviewRpview(rno);
	} 
	/* 리뷰 블라인드 Y>N */
	public int reviewChangetN(int rno) throws Exception {
		return AdminDao.reviewChangetN(rno);
	}
	/* 리뷰 블라인드 N>Y */
	public int reviewChangeY(int rno) throws Exception {
		return AdminDao.reviewChangeY(rno);
	}
	/* 리뷰 본문 삭제 */
	public int ReviewDelete(int rno) throws Exception {
		return AdminDao.ReviewDelete(rno);
	}
	/* 리뷰 댓글 삭제 */
	public int ReviewRpDelete(int rrno) throws Exception {
		return AdminDao.ReviewRpDelete(rrno);
	}
}
