package com.project.jeju.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.MemberDao;
import com.project.jeju.model.MemberBean;

@Service 
public class MemberService {
	
		@Autowired
		private MemberDao md;
		
		public int checkMemberId(String id) throws Exception{
			return md.checkMemberId(id);
		}
		
		public int checkMemberNick(String nickname) throws Exception{
			return md.checkMemberNick(nickname);
		}

		public int insertMember(MemberBean mb) throws Exception {
			return md.insertMember(mb);
		}

		public MemberBean userCheck(String id) throws Exception {
			return md.userCheck(id);
		}
		
		
		
//		public void insertMember(MemberBean mb) throws Exception {
//			MemberDao.insertMember(mb);
//		}
		

}