package com.project.jeju.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.jeju.model.MemberBean;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;


	// 아이디 중복 체크 
//	@Transactional
	public int checkMemberId(String id) throws Exception {
// 		getSession();
			int re = -1; // 사용 가능한 ID
			MemberBean mb = sqlSession.selectOne("id_check", id);
			if (mb != null)
			re = 1; // 중복id
			return re;
	}
	
	// 이메일 중복 검사
		public int check_email(String email) throws Exception{
			return sqlSession.selectOne("email_check", email);
		

//	// 회원가입
//	@Transactional
//	public int MemberJoin(MemberBean mb) throws Exception{
//		return sqlSession.insert("member.memberJoin", memberjoin);
//	}
	
//	// 비밀번호 검색
////	@Transactional
//	public MemberBean findpwd(MemberBean pm) throws Exception {
////		getSession();
//		return sqlSession.selectOne("pwdFnd", pm);
//	}
//	
//	// 로그인 인증 체크 
////	@Transactional
//	public MemberBean userCheck(String id) throws Exception {
////		getSession();
//		return sqlSession.selectOne("loginCheck", id);

	}

}