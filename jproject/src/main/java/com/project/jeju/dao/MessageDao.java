package com.project.jeju.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.jeju.model.MemberBean;
import com.project.jeju.model.MessageBean;

@Repository
public class MessageDao {
	
	@Autowired 
	private SqlSession session;

	public int getScount(MemberBean mb) {
		// TODO Auto-generated method stub
		return session.selectOne("scount", mb);
	}
	
	public int getRcount(MemberBean mb) {
		// TODO Auto-generated method stub
		return session.selectOne("rcount", mb);
	}

	public List<MessageBean> getRcvList(Map m) {
		// TODO Auto-generated method stub
		return session.selectList("rcvlist", m);
	}

	public List<MessageBean> getSendList(Map m) {
		// TODO Auto-generated method stub
		return session.selectList("sendlist", m);
	}

	public int insert(MessageBean message) {
		// TODO Auto-generated method stub
		return session.insert("messagens.insert", message);
	}

	public MessageBean getSendmessage(int mno) {
		// TODO Auto-generated method stub
		return session.selectOne("messagesendview", mno);
	}
	
	public MessageBean getRcvmessage(int mno) {
		// TODO Auto-generated method stub
		return session.selectOne("messagercvview", mno);
	}

	public MessageBean getMessagereply(int mno) {
		// TODO Auto-generated method stub
		return session.selectOne("messagereply", mno);
	}

	public int insertreply(MessageBean message) {
		// TODO Auto-generated method stub
		return session.insert("messagens.insertreply", message);
	}

	public int delete(int mno) {
		// TODO Auto-generated method stub
		return session.delete("messagens.delete", mno);
	}
	
	
	
	

}
