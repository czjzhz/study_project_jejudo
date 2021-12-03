package com.project.jeju.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jeju.dao.MessageDao;
import com.project.jeju.model.MemberBean;
import com.project.jeju.model.MessageBean;


@Service
public class MessageService {
	
	@Autowired MessageDao dao;

	public int getScount(MemberBean mb) {
		// TODO Auto-generated method stub
		return dao.getScount(mb);
	}
	
	public int getRcount(MemberBean mb) {
		// TODO Auto-generated method stub
		return dao.getRcount(mb);
	}

	public List<MessageBean> getRcvlist(Map m) {
		// TODO Auto-generated method stub
		return dao.getRcvList(m);
	}

	public List<MessageBean> getSendlist(Map m) {
		// TODO Auto-generated method stub
		return dao.getSendList(m);
	}

	public int insert(MessageBean message) {
		// TODO Auto-generated method stub
		return dao.insert(message);
	}

	public MessageBean getSendmessage(int mno) {
		// TODO Auto-generated method stub
		return dao.getSendmessage(mno);
	}
	
	public MessageBean getRcvmessage(int mno) {
		// TODO Auto-generated method stub
		return dao.getRcvmessage(mno);
	}

	public MessageBean getMessagereply(int mno) {
		// TODO Auto-generated method stub
		return dao.getMessagereply(mno);
	}

	public int insertreply(MessageBean message) {
		// TODO Auto-generated method stub
		return dao.insertreply(message);
	}

	public int delete(int mno) {
		// TODO Auto-generated method stub
		return dao.delete(mno);
	}

	

	


	
}
