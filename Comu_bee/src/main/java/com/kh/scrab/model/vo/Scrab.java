package com.kh.scrab.model.vo;

public class Scrab {
	private String userId;
	private int boardNo;
	private int contentsId;
	
	
	public Scrab(String userId, int boardNo, int contentsId) {
		super();
		this.userId = userId;
		this.boardNo = boardNo;
		this.contentsId = contentsId;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getContentsId() {
		return contentsId;
	}


	public void setContentsId(int contentsId) {
		this.contentsId = contentsId;
	}


	@Override
	public String toString() {
		return "Scrab [userId=" + userId + ", boardNo=" + boardNo + ", contentsId=" + contentsId + "]";
	}
	
	
	
	
	
	
}

