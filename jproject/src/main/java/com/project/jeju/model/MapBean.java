package com.project.jeju.model;

public class MapBean {
	
	private int ano;
	private int mapno;
	private int mloc;
	private String mmemo;
	private String mlat;
	private String mlng;
	
	// page
	private int startRow;
	private int endRow;
	
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getMapno() {
		return mapno;
	}
	public void setMapno(int mapno) {
		this.mapno = mapno;
	}
	public int getMloc() {
		return mloc;
	}
	public void setMloc(int mloc) {
		this.mloc = mloc;
	}
	public String getMmemo() {
		return mmemo;
	}
	public void setMmemo(String mmemo) {
		this.mmemo = mmemo;
	}
	public String getMlat() {
		return mlat;
	}
	public void setMlat(String mlat) {
		this.mlat = mlat;
	}
	public String getMlng() {
		return mlng;
	}
	public void setMlng(String mlng) {
		this.mlng = mlng;
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
