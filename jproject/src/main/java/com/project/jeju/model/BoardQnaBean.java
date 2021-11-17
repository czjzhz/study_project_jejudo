package com.project.jeju.model;

import java.util.Date;

public class BoardQnaBean {

	private int qno;
	private String qsub;
	private String qcont;
	private Date qreg;
	private String qdel;
	private String qfile;
	private int qreadcount;
	
	// page
	private int startRow;
	private int endRow;

	// 검색
	private String search;
	private String keyword;
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getQsub() {
		return qsub;
	}
	public void setQsub(String qsub) {
		this.qsub = qsub;
	}
	public String getQcont() {
		return qcont;
	}
	public void setQcont(String qcont) {
		this.qcont = qcont;
	}
	public Date getQreg() {
		return qreg;
	}
	public void setQreg(Date qreg) {
		this.qreg = qreg;
	}
	public String getQdel() {
		return qdel;
	}
	public void setQdel(String qdel) {
		this.qdel = qdel;
	}
	public String getQfile() {
		return qfile;
	}
	public void setQfile(String qfile) {
		this.qfile = qfile;
	}
	public int getQreadcount() {
		return qreadcount;
	}
	public void setQreadcount(int qreadcount) {
		this.qreadcount = qreadcount;
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
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
