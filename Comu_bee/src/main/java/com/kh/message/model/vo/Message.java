package com.kh.message.model.vo;

import java.sql.Date;

public class Message {
	private int mNo;
	private String sendName;
	private String receiveName;
	private String messageContent;
	private Date sendDate;
	private String readCheck;
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getSendName() {
		return sendName;
	}
	public void setSendName(String sendName) {
		this.sendName = sendName;
	}
	public String getReceiveName() {
		return receiveName;
	}
	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public String getReadCheck() {
		return readCheck;
	}
	public void setReadCheck(String readCheck) {
		this.readCheck = readCheck;
	}
	public Message(int mNo, String sendName, String receiveName, String messageContent, Date sendDate,
			 String readCheck) {
		super();
		this.mNo = mNo;
		this.sendName = sendName;
		this.receiveName = receiveName;
		this.messageContent = messageContent;
		this.sendDate = sendDate;
		this.readCheck = readCheck;
	}
	public Message( String sendName, String receiveName, String messageContent) {
		super();
		this.sendName = sendName;
		this.receiveName = receiveName;
		this.messageContent = messageContent;
	}
	@Override
	public String toString() {
		return "Message [mNo=" + mNo + ", sendName=" + sendName + ", receiveName=" + receiveName + ", messageContent="
				+ messageContent + ", sendDate=" + sendDate + ", readCheck=" + readCheck
				+ "]";
	}
	
	
	
	
}
