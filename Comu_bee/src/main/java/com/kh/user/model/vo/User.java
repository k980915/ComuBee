package com.kh.user.model.vo;

import java.util.Date;

public class User {
	
	private String userId;
	private String userName;
	private String userPwd;
	private String userGender;
	private String userBirth;
	private String userEmail;
	private Date joinDate;
	private int point;
	private String status;
	
	public User() {
		super();
		
	}
	
	
	
	public User(String userPwd) {
		super();
		this.userPwd = userPwd;
	}



	public User(String userId, String userName, String userPwd, String userGender, String userBirth, String userEmail,
			Date joinDate, int point) {
		super();
		this.userId = userId; 
		this.userName = userName;
		this.userPwd = userPwd;
		this.userGender = userGender;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.joinDate = joinDate;
		this.point = point;
	}

	public User(String userId, String userName, String userPwd, String userEmail, String userBirth,
			String userGender) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userEmail = userEmail;
		this.userGender = userGender;
		this.userBirth = userBirth;	
	}
	
	
	


	public User(String userId, String userName, String userEmail, Date joinDate, int point) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.joinDate = joinDate;
		this.point = point;
	}

	public User(String userId, String userName, String userGender, String userEmail) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userGender = userGender;
		this.userEmail = userEmail;
	}
	
	
	
	







	public User(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	public User(String userId,String userName, String userEmail) {
		super();
		this.userId = userId;
		this.userName =userName;
		this.userEmail=userEmail;
		
	}
	
	
	
	
	
	

	

	

	public User(String userId, String userName, String userPwd, String userEmail, String status) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userEmail = userEmail;
		this.status = status;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", userGender="
				+ userGender + ", userBirth=" + userBirth + ", userEmail=" + userEmail + ", joinDate=" + joinDate
				+ ", point=" + point + ", status=" + status + "]";
	}
	
	
	


	
	
	
	
	
	
	
}
	