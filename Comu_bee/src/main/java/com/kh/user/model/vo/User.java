package com.kh.user.model.vo;

import java.util.Date;

public class User {
	
	public User(String userId, String userName, String userPwd, String gender, int userBirth, String userEmail,
			int point) {
		// TODO Auto-generated constructor stub
	}

	private String userId;
	private String userPwd;
	private String gender;
	private int userBirth;
	private String userEmail;
	private int point;
	public String userName;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(String userId, String userPwd, String gender, int userBirth, String userEmail, Date sysdate,
			int point,String userName) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.gender = gender;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.point = point;
		this.userName =userName;
	}
	
	
	
	


	public User(String userId, String userPwd, String gender, int userBirth, String userEmail,Date sysdate) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.gender = gender;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public User(String userId, String userPwd, String gender, int userBirth, String userEmail) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.gender = gender;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(int userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPwd=" + userPwd + ", gender=" + gender + ", userBirth=" + userBirth
				+ ", userEmail=" + userEmail + ", point=" + point + ", userName=" + userName + "]";
	}

	public User(String userId, String userPwd, String gender, int userBirth, String userEmail, int point,
			String userName) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.gender = gender;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.point = point;
		this.userName = userName;
	}



	

	
	
	
	

}
