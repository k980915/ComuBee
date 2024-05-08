package com.kh.user.model.vo;

public class AdminHits {

	private String yeatSelect; // YRARSELECT VARCHAR2(20 BYTE)
	private String monthSelect; // MONTHSELECT VARCHAR2(20 BYTE)
	private int hits; // HITS NUMBER
	private int toDayHits; // TODAYHITS NUMBER

	public AdminHits() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminHits(String yeatSelect, String monthSelect, int hits, int toDayHits) {
		super();
		this.yeatSelect = yeatSelect;
		this.monthSelect = monthSelect;
		this.hits = hits;
		this.toDayHits = toDayHits;
	}
	

	public AdminHits(String monthSelect, int hits) {
		super();
		this.monthSelect = monthSelect;
		this.hits = hits;
	}

	public AdminHits(String yeatSelect, String monthSelect) {
		super();
		this.yeatSelect = yeatSelect;
		this.monthSelect = monthSelect;
	}

	public String getYeatSelect() {
		return yeatSelect;
	}

	public void setYeatSelect(String yeatSelect) {
		this.yeatSelect = yeatSelect;
	}

	public String getMonthSelect() {
		return monthSelect;
	}

	public void setMonthSelect(String monthSelect) {
		this.monthSelect = monthSelect;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getToDayHits() {
		return toDayHits;
	}

	public void setToDayHits(int toDayHits) {
		this.toDayHits = toDayHits;
	}

	@Override
	public String toString() {
		return "AdminHits [yeatSelect=" + yeatSelect + ", monthSelect=" + monthSelect + ", hits=" + hits
				+ ", toDayHits=" + toDayHits + "]";
	}

}
