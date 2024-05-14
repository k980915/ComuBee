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
import com.kh.common.model.vo.PageInfo;
import com.kh.message.model.dao.MessageDao;
import com.kh.message.model.vo.Message;

	public class MessageDao {
	//sql 구문 읽어서 담아둘 prop 준비 
		private Properties prop = new Properties();
		
		//MemberDao() 기본생성자가 호출될때마다 파일을 읽어올 수 있도록 작업
		public MessageDao() {
			//message-mapper파일의 물리적인 주소(경로) 알아오기
			// getResource에서 /로 시작하면 classes 가 기준이 됨
			String filePath = MessageDao.class
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
		
	public int sendMessage(Connection conn, Message m) {
		int result= 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("sendMessage");
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
	
	public ArrayList<Message> selectSendMessage(Connection conn,PageInfo pi,String userId){
		ArrayList<Message> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		String sql = prop.getProperty("selectSendMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow); // 시작값
			pstmt.setInt(3, endRow); 
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message(rset.getInt("MNO"),
										rset.getString("SENDNAME"),
										rset.getString("RECEIVENAME"),
										rset.getString("MESSAGE_CONTENT"),
										rset.getDate("M_DATE"),
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
	
	public ArrayList<Message> selectReceiveMessage(Connection conn,PageInfo pi, String userId){
		ArrayList<Message> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		String sql = prop.getProperty("selectReceiveMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow); // 시작값
			pstmt.setInt(3, endRow); 
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message(rset.getInt("MNO"),
						rset.getString("SENDNAME"),
						rset.getString("RECEIVENAME"),
						rset.getString("MESSAGE_CONTENT"),
						rset.getDate("M_DATE"),
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
	
	
	public ArrayList<Message> selectNewMessage(Connection conn,PageInfo pi, String userId){
		ArrayList<Message> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		String sql = prop.getProperty("selectNewMessage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow); // 시작값
			pstmt.setInt(3, endRow); // 끝값
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message(rset.getInt("MNO"),
						rset.getString("SENDNAME"),
						rset.getString("RECEIVENAME"),
						rset.getString("MESSAGE_CONTENT"),
						rset.getDate("M_DATE"),
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
	
	public int updateReadCheck(Connection conn, int messageNum,String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateReadCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, messageNum);
			pstmt.setString(2, userId);
			
			result =pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int newMessageCount(Connection conn, String userId) {

		// select
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("newMessageCount");

		int listCount = 0; // 게시글 개수 담을 변수

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				// 조회된 게시글 개수
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return listCount;
	}
	
	public Message selectMessageByMNo(Connection conn, int mNo) {
		ResultSet rset= null;
		PreparedStatement pstmt = null;
		Message ms = null;
		String sql = prop.getProperty("selectMessageByMNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				ms = new Message(rset.getInt("MNO"),
								 rset.getString("SENDNAME"),
								 rset.getString("RECEIVENAME"),
								 rset.getString("MESSAGE_CONTENT"),
								 rset.getDate("M_DATE"),
								 rset.getString("READ_CHECK"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return ms;
	}
	
	
	public int sendMessageCount(Connection conn, String userId) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		int listCount=0;
		String sql = prop.getProperty("sendMessageCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset=pstmt.executeQuery();
			if (rset.next()) {
				// 조회된 게시글 개수
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return listCount;
		
	}
	public int receiveMessageCount(Connection conn, String userId) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		int listCount=0;
		String sql = prop.getProperty("receiveMessageCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset=pstmt.executeQuery();
			if (rset.next()) {
				// 조회된 게시글 개수
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return listCount;
		
	}
	


}
