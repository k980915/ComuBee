package com.kh.contents.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo;
	private String userId;
	private String atNo;
	private String category;
	private int contentsId;
	private String title;
	private String boardContent;
	private Date createDate;
	private Date updateDate;
	private String status;
	private int boardLike;
	private int hate;
	private int count;
	
	
	public Board() {
		super();
	}
	public Board(int boardNo, String userId, String atNo, String category, int contentsId, String title,
			String boardContent, Date createDate, Date updateDate, String status, int boardLike, int hate, int count) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.atNo = atNo;
		this.category = category;
		this.contentsId = contentsId;
		this.title = title;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.status = status;
		this.boardLike = boardLike;
		this.hate = hate;
		this.count=count;
	}
	
	
	public Board(int boardNo, String userId, int contentsId, String boardContent, Date createDate, String status,
			int boardLike, int hate) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.contentsId = contentsId;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.status = status;
		this.boardLike = boardLike;
		this.hate = hate;
	}
	public Board(String userId, int contentsId, String boardContent, Date createDate, String status, int boardLike,
			int hate) {
		super();
		this.userId = userId;
		this.contentsId = contentsId;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.status = status;
		this.boardLike = boardLike;
		this.hate = hate;
	}
	public Board(int boardNo, String userId, String category, String title, Date createDate, int boardLike, int count) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.category = category;
		this.title = title;
		this.createDate = createDate;
		this.boardLike = boardLike;
		this.count = count;
	}
	
	
	
	public Board(int boardNo, String userId, String atNo, String category, int contentsId, String title,
			String boardContent, Date createDate, Date updateDate, int boardLike, int hate, int count) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.atNo = atNo;
		this.category = category;
		this.contentsId = contentsId;
		this.title = title;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.boardLike = boardLike;
		this.hate = hate;
		this.count = count;
	}
	
	public Board(int boardNo, String title) {
		super();
		this.boardNo = boardNo;
		this.title = title;
	}
	public Board(int boardNo, String title, int boardLike) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.boardLike=boardLike;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAtNo() {
		return atNo;
	}
	public void setAtNo(String atNo) {
		this.atNo = atNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getContentsId() {
		return contentsId;
	}
	public void setContentsId(int contentsId) {
		this.contentsId = contentsId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getBoardLike() {
		return boardLike;
	}
	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}
	public int getHate() {
		return hate;
	}
	public void setHate(int hate) {
		this.hate = hate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", userId=" + userId + ", atNo=" + atNo + ", category=" + category
				+ ", contentsId=" + contentsId + ", title=" + title + ", boardContent=" + boardContent + ", createDate="
				+ createDate + ", updateDate=" + updateDate + ", status=" + status + ", boardLike=" + boardLike
				+ ", hate=" + hate + ", count=" + count + "]";
	}
	
	
	
	

}
