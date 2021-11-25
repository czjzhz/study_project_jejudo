package com.project.jeju.model;

import java.util.Date;

public class BoardQnaReplyBean {

	private int qrno;
	private String qrcont;
	private String qrnickname;
	private Date qrreg;
	private Date qrupdate;
	private int qno;
	
	public int getQrno() {
		return qrno;
	}
	public void setQrno(int qrno) {
		this.qrno = qrno;
	}
	public String getQrcont() {
		return qrcont;
	}
	public void setQrcont(String qrcont) {
		this.qrcont = qrcont;
	}
	public String getQrnickname() {
		return qrnickname;
	}
	public void setQrnickname(String qrnickname) {
		this.qrnickname = qrnickname;
	}
	public Date getQrreg() {
		return qrreg;
	}
	public void setQrreg(Date qrreg) {
		this.qrreg = qrreg;
	}
	public Date getQrupdate() {
		return qrupdate;
	}
	public void setQrupdate(Date qrupdate) {
		this.qrupdate = qrupdate;
	}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	
}
