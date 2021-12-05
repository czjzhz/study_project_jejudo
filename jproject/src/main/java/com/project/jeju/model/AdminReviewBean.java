package com.project.jeju.model;

import java.util.Date;

public class AdminReviewBean {
	
	private int rno;
	private String rsub;
	private String rcont;
	private Date rreg;
	private String rdel;
	private String id;
	private String rfile;
	private int rreadcount;
	private String nickname;
	private String rip;

	// page
	private int startRow;
	private int endRow;

	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRsub() {
		return rsub;
	}
	public void setRsub(String rsub) {
		this.rsub = rsub;
	}
	public String getRcont() {
		return rcont;
	}
	public void setRcont(String rcont) {
		this.rcont = rcont;
	}
	public Date getRreg() {
		return rreg;
	}
	public void setRreg(Date rreg) {
		this.rreg = rreg;
	}
	public String getRdel() {
		return rdel;
	}
	public void setRdel(String rdel) {
		this.rdel = rdel;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRfile() {
		return rfile;
	}
	public void setRfile(String rfile) {
		this.rfile = rfile;
	}
	public int getRreadcount() {
		return rreadcount;
	}
	public void setRreadcount(int rreadcount) {
		this.rreadcount = rreadcount;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRip() {
		return rip;
	}
	public void setRip(String rip) {
		this.rip = rip;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	
}
