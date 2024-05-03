package com.kh.user.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.user.model.vo.User;

public class UserDao {
	
	private Properties prop = new Properties();
	
	public UserDao() {
		String filePath = UserDao.class.getResource("/resources/sql/user-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertUser(Connection conn, User u) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql = prop.getProperty("insertUser");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUserPwd());
			pstmt.setString(3, u.getUserName());
			pstmt.setString(4, u.getUserEmail());
			pstmt.setString(5, u.getUserBirth());
			pstmt.setString(6, u.getUserGender());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public User loginUser(String userId,String userPwd, Connection conn) {
		ResultSet rset=null;
		PreparedStatement pstmt = null;
		User u = new User();
		
		
		String sql = prop.getProperty("loginUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				u= new User(
						rset.getString("USERID")
						,rset.getString("USERPWD"));

				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return u;
	}

	public Boolean checkId(String inputId, Connection conn) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("checkId");
		boolean flag = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			
			rset = pstmt.executeQuery();
			flag =rset.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return flag;
	}
	public int updateUser(Connection conn,User u) {
		//DML (UPDATE) 
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateUser");
		
		try {
			//미완성 SQL 구문 전달하며 PSTMT 객체 생성
			pstmt = conn.prepareStatement(sql);
			//미완성인 sql구문 위치홀더에 맞는 데이터 넣어주기 
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getUserGender());
			pstmt.setString(3, u.getUserEmail());
			pstmt.setString(4, u.getUserId());
			
			
			//완성된 sql구문 실행 및 결과 받기 
			result = pstmt.executeUpdate();//처리된 행수
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public User selectUser(Connection conn,String userId) {
		//SELECT 구문
		ResultSet rset = null; //결과집합담을 변수
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectUser");
		User u = null; //조회된 회원정보가 있으면 담아갈 객체변수
		
		try {
			//미완성 구문 전달하며 객체생성
			pstmt = conn.prepareStatement(sql);
			//위치홀더 채워주기 
			pstmt.setString(1, userId);
			
			//조회구문 실행 및 결과집합 반환받기
			rset = pstmt.executeQuery();
			
			//조회결과가 있다면 우리가 만든 VO객체변수에 담아주기 
			//userId 는 unique제약조건이기때문에 식별자로 사용된다(조회된다면 하나만 조회됨)
			if(rset.next()) {//다음 접근할 행이 있나요? 
				//있다면 해당 정보 옮겨 담기
				
				u = new User(  rset.getString("USERID")
							  ,rset.getString("USERNAME")
							  ,rset.getString("USERPWD")
							  ,rset.getString("USERGENDER")
							  ,rset.getString("USERBIRTH")
							  ,rset.getString("USEREMAIL")
							  ,rset.getDate("JOINDATE")
							  ,rset.getInt("POINT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return u;//결과객체 반환
		
	}
	

	

}
