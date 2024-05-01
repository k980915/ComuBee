package com.kh.user.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.user.model.dao.UserDao;
import com.kh.user.model.vo.User;

//회원가입
public class UserService {

	public int insertUser(User u) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().insertUser(conn,u);
		
		return result;
	}

}
