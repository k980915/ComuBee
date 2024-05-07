package com.kh.message.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.message.model.vo.Message;

	public class MessageDao {
	//sql 구문 읽어서 담아둘 prop 준비 
		private Properties prop = new Properties();
		
		//MemberDao() 기본생성자가 호출될때마다 파일을 읽어올 수 있도록 작업
		public MessageDao() {
			//message-mapper파일의 물리적인 주소(경로) 알아오기
			// getResource에서 /로 시작하면 classes 가 기준이 됨
			String filePath = MemberDao.class
									   .getResource("/resources/sql/message-mapper.xml")
									   .getPath();
//			System.out.println(filePath);
			//해당 sql 구문 파일 경로를 스트림에 담아준다 
			try {
				prop.loadFromXML(new FileInputStream(filePath));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	public int insertMessage(Connection conn, Message m) {
		int result= 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMessage");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getSendName());
			pstmt.setString(2, m.getReceiveName());
			pstmt.setString(3, m.getMessageContent());
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	public ArrayList<Message> selectSendMessage(Connection conn, String userId){
		ArrayList<Message> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSendMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message(rset.getInt("MNO"),
										rset.getString("SENDNAME"),
										rset.getString("RECEIVENAME"),
										rset.getString("MESSAGE_CONTENT"),
										rset.getDate("M_DATE"),
										rset.getString("SCRAB_CHECK"),
										rset.getString("READ_CHECK"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Message> selectReceiveMessage(Connection conn, String userId){
		ArrayList<Message> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReceiveMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message(rset.getInt("MNO"),
						rset.getString("SENDNAME"),
						rset.getString("RECEIVENAME"),
						rset.getString("MESSAGE_CONTENT"),
						rset.getDate("M_DATE"),
						rset.getString("SCRAB_CHECK"),
						rset.getString("READ_CHECK"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Message> selectScrabMessage(Connection conn, String userId){
		ArrayList<Message> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectScrabMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userId);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message(rset.getInt("MNO"),
						rset.getString("SENDNAME"),
						rset.getString("RECEIVENAME"),
						rset.getString("MESSAGE_CONTENT"),
						rset.getDate("M_DATE"),
						rset.getString("SCRAB_CHECK"),
						rset.getString("READ_CHECK"));
				list.add(m);
				System.out.println(m);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public ArrayList<Message> selectNewMessage(Connection conn, String userId){
		ArrayList<Message> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message(rset.getInt("MNO"),
						rset.getString("SENDNAME"),
						rset.getString("RECEIVENAME"),
						rset.getString("MESSAGE_CONTENT"),
						rset.getDate("M_DATE"),
						rset.getString("SCRAB_CHECK"),
						rset.getString("READ_CHECK"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

}
