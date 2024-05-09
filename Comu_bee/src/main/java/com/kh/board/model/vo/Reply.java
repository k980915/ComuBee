package com.kh.board.model.vo;

import java.sql.Date;

public class Reply {
//	REPLYNO	NUMBER
//	USERID	VARCHAR2(50 BYTE)
//	REPLYCONTENT	VARCHAR2(1000 BYTE)
//	CREATEDATE	DATE
//	UPDATEDATE	DATE
//	BOARDNO	NUMBER(38,0)
	
	private int replyNo;
	private String userId;
	private String replyContent;
	private Date createDate;
	private int boardNo;
	
	public Reply() {
		super();
	}
	public Reply(int replyNo, String userId, String replyContent, Date createDate, int boardNo) {
		super();
		this.replyNo = replyNo;
		this.userId = userId;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.boardNo = boardNo;
	}
	

	public Reply(int replyNo, String userId, String replyContent, Date createDate) {
		super();
		this.replyNo = replyNo;
		this.userId = userId;
		this.replyContent = replyContent;
		this.createDate = createDate;
	}
	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", userId=" + userId + ", replyContent=" + replyContent + ", createDate="
				+ createDate + ", boardNo=" + boardNo + "]";
	}
	
	
}
