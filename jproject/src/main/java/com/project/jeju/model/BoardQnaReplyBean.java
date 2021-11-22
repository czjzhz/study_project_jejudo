package com.project.jeju.model;

import java.util.Date;

public class BoardQnaReplyBean {

	private int qrno;
	private String qrcont;
	private String qrid;
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
	public String getQrid() {
		return qrid;
	}
	public void setQrid(String qrid) {
		this.qrid = qrid;
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
