package com.project.jeju.model;

import java.sql.Date;

public class AdminAdBean {

	private int adno;
	private String adsubject;
	private String adcontent;
	private Date addate;
	
	// page
	private int startRow;
	private int endRow;
	
	public int getAdno() {
		return adno;
	}
	public void setAdno(int adno) {
		this.adno = adno;
	}
	public String getAdsubject() {
		return adsubject;
	}
	public void setAdsubject(String adsubject) {
		this.adsubject = adsubject;
	}
	public String getAdcontent() {
		return adcontent;
	}
	public void setAdcontent(String adcontent) {
		this.adcontent = adcontent;
	}
	public Date getAddate() {
		return addate;
	}
	public void setAddate(Date addate) {
		this.addate = addate;
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
