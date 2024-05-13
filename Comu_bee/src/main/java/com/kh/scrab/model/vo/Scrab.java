package com.kh.scrab.model.vo;

public class Scrab {
	private String userId;
	private int boardNo;
	private String boardName;
	private int contentsId;
	
	
	public Scrab(String userId, int boardNo, int contentsId, String boardName) {
		super();
		this.userId = userId;
		this.boardNo = boardNo;
		this.contentsId = contentsId;
		this.boardName = boardName;
	}
	public Scrab(String userId, int boardNo, String boardName) {
		super();
		this.userId = userId;
		this.boardNo = boardNo;
		this.boardName = boardName;
	}


	public String getUserId() {
		return userId;
	}
	


	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
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
		return "Scrab [userId=" + userId + ", boardNo=" + boardNo + ", boardName=" + boardName + "]";
	}


	
	
	
	
	
	
	
	
	
}

