package com.project.jeju.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.MemberDao;
import com.project.jeju.model.BoardQnaBean;
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

		public int checkMemberName(String name) throws Exception {
			return md.checkMemberName(name);
		}
		
		public int insertMember(MemberBean mb) throws Exception {
			return md.insertMember(mb);
		}

		public MemberBean userCheck(String id) throws Exception {
			return md.userCheck(id);
		}
		
		public MemberBean findpwd(MemberBean mb)throws Exception {
			return md.findpwd(mb);
		}

		public int updateMember(MemberBean mb) throws Exception{
			return md.updateMember(mb); 
		}
		
		public int updateNickMember(MemberBean mb) throws Exception{
			return md.updateNickMember(mb);
		}

		public List<BoardQnaBean> getTrip(String id) {
			return md.getTrip(id);
		}

		public void deleteMember(MemberBean mb) throws Exception{
			md.deleteMember(mb);
		}
	

		
}