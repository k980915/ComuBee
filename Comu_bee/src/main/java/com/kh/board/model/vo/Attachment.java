package com.kh.board.model.vo;

import java.sql.Date;

public class Attachment {
	private int atNo;
	private int categoryNo;
	private int boardNo;
	private String originName;
	private String changeName;
	private String atFilePath;
	private Date atUploadDate;
	private String status;
	
	
	public Attachment() {
		super();
	}
	public Attachment(int atNo, int categoryNo, int boardNo, String originName, String changeName, String atFilePath,
			Date atUploadDate, String status) {
		super();
		this.atNo = atNo;
		this.categoryNo = categoryNo;
		this.boardNo = boardNo;
		this.originName = originName;
		this.changeName = changeName;
		this.atFilePath = atFilePath;
		this.atUploadDate = atUploadDate;
		this.status = status;
	}
	
	
	
	public Attachment(int atNo, int categoryNo, int boardNo, String originName, String changeName, String atFilePath,
			Date atUploadDate) {
		super();
		this.atNo = atNo;
		this.categoryNo = categoryNo;
		this.boardNo = boardNo;
		this.originName = originName;
		this.changeName = changeName;
		this.atFilePath = atFilePath;
		this.atUploadDate = atUploadDate;
	}
	public int getAtNo() {
		return atNo;
	}
	public void setAtNo(int atNo) {
		this.atNo = atNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getAtFilePath() {
		return atFilePath;
	}
	public void setAtFilePath(String atFilePath) {
		this.atFilePath = atFilePath;
	}
	public Date getAtUploadDate() {
		return atUploadDate;
	}
	public void setAtUploadDate(Date atUploadDate) {
		this.atUploadDate = atUploadDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	@Override
	public String toString() {
		return "Attachment [atNo=" + atNo + ", categoryNo=" + categoryNo + ", boardNo=" + boardNo + ", originName="
				+ originName + ", changeName=" + changeName + ", atFilePath=" + atFilePath + ", atUploadDate="
				+ atUploadDate + ", status=" + status + "]";
	}

	
	
}
