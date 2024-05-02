package com.kh.user.model.vo;

import java.util.Date;

public class User {
	
	private String UserId;
	private String userName;
	private String userPwd;
	private String userGender;
	private String userBirth;
	private String userEmail;
	private Date joinDate;
	private int point;
	
	public User(String userId, String userName, String userPwd, String userGender, String userBirth, String userEmail,
			Date joinDate, int point) {
		super();
		this.UserId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userGender = userGender;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.joinDate = joinDate;
		this.point = point;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public User(String userId, String userName, String userPwd, String userGender, String userBirth, String userEmail) {
		super();
		UserId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userGender = userGender;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
	}
	public User(String userId, String userName, String userPwd, String userGender, int userBirth,
			String userEmail, int poin2) {
		// TODO Auto-generated constructor stub
	}
	public String getUserId() {
		return UserId;
	}
	public void setUserId(String userId) {
		UserId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "User [UserId=" + UserId + ", userName=" + userName + ", userPwd=" + userPwd + ", userGender="
				+ userGender + ", userBirth=" + userBirth + ", userEmail=" + userEmail + ", joinDate=" + joinDate
				+ ", point=" + point + "]";
	}
	
	
	
	
	




	

	
	
	
	

}
