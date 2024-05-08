package com.kh.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	

	// 1. Connection 객체 반환하는 메소드 getConnection()
	public static Connection getConnection() {
		Properties prop = new Properties();
		// driver.properties 파일 읽어오기 - 읽는 작업을 하려면 물리적 위치 지정
		String filePath = JDBCTemplate.class.getResource("/resources/driver/driver.properties").getPath();
		// 커넥션 선언 준비
		Connection conn = null;
		
		try {
			prop.load(new FileInputStream(filePath));
			
			// properties 파일 읽었으니 driver 등록
			// 1-1) jdbc Driver 등록
			Class.forName(prop.getProperty("driver"));
			// 1-2) Connection 객체 생성
			conn = DriverManager.getConnection(prop.getProperty("url")
											  ,prop.getProperty("username")
											  ,prop.getProperty("password"));
			// 1-3) autoCommit 해제 (트랜잭션 직접처리)
			conn.setAutoCommit(false);
	        System.out.println("데이터 연결 완료.");

			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return conn;
	}
	
	// 2. commit 메소드 작성
	public static void commit(Connection conn) {
		// connection 객체가 null이거나 닫히지 않았는지 확인 작업
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 3. rollback 메소드 작성
	public static void rollback(Connection conn) {
		// connection 객체가 null이거나 닫히지 않았는지 확인 작업
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 4. 자원반납 메소드 3개 (conn, stmt, rset)
	public static void close(Connection conn) {

		try {
			// 자원이 null이 아니고 닫혀있지도 않다면
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void close(ResultSet rset) {

		try {
			if (rset != null && !rset.isClosed()) {
				rset.close();

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(Statement stmt) {

		try {
			if (stmt != null && !stmt.isClosed()) {
				stmt.close();

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
}
