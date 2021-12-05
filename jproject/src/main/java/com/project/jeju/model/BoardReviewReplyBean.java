package com.project.jeju.model;

import java.util.Date;

public class BoardReviewReplyBean {
	
	private int rrno;
	private String rrcont;
	private String rrnickname;
	private Date rrreg;
	private Date rrupdate;
	private int rno;
	
	public int getRrno() {
		return rrno;
	}
	public void setRrno(int rrno) {
		this.rrno = rrno;
	}
	public String getRrcont() {
		return rrcont;
	}
	public void setRrcont(String rrcont) {
		this.rrcont = rrcont;
	}
	public String getRrnickname() {
		return rrnickname;
	}
	public void setRrnickname(String rrnickname) {
		this.rrnickname = rrnickname;
	}
	public Date getRrreg() {
		return rrreg;
	}
	public void setRrreg(Date rrreg) {
		this.rrreg = rrreg;
	}
	public Date getRrupdate() {
		return rrupdate;
	}
	public void setRrupdate(Date rrupdate) {
		this.rrupdate = rrupdate;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	
}
