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
		
		if (result > 0) { // 성공시 확정
			JDBCTemplate.commit(conn);
		} else {// 실패시 되돌리기
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
	//로그인
	public User loginUser(String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		User u = new UserDao().loginUser(userId, userPwd, conn);
		
		JDBCTemplate.close(conn);
		
		return u;
	}
	
	public Boolean checkId(String inputId) {
		Connection conn = JDBCTemplate.getConnection();
		
		Boolean flag = new UserDao().checkId(inputId,conn);
		
		
		JDBCTemplate.close(conn);
		return flag;
	}
	
	public User updateUser(User u) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new UserDao().updateUser(conn, u);
		System.out.println("서비스에서 result : "+result);
		User updateUser = null;
		
		if (result > 0) {// 성공
			JDBCTemplate.commit(conn);
			// 갱신된 회원의 정보를 조회하여 반환하기
			// selectMember 메소드를 이용해서 userId만 가지고 회원정보 조회해오기
			updateUser = new UserDao().selectUser(conn, u.getUserId());

		} else { // 실패
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return updateUser;
	}
	
	public int updatePwd(String userId,String userPwd,String updatePwd) {
		//연결객체 얻어오기
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().updatePwd(conn,userId,userPwd,updatePwd);
		
		//dml구문이니 트랜잭션처리할것
		if(result>0) {//성공시 확정
			JDBCTemplate.commit(conn); 
		}else {//실패시 되돌리기
			JDBCTemplate.rollback(conn);
		}
	
		//자원반납
		JDBCTemplate.close(conn); 
		
		return result;
	}
	
	public int deleteUser(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().deleteUser(conn, userId);
		if(result>0) {//성공시 확정
			JDBCTemplate.commit(conn); 
		}else {//실패시 되돌리기
			JDBCTemplate.rollback(conn);
		}
	
		//자원반납
		JDBCTemplate.close(conn); 
		
		return result;
	}
	
	
	
	
	
	
	

}
