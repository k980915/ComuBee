package com.kh.message.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.Cookie;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.message.model.dao.MessageDao;
import com.kh.message.model.vo.Message;

public class MessageService {
	public int sendMessage(Message m) {
		
		Connection conn = JDBCTemplate.getConnection();

		// DAO에게 전달받은 데이터와 Connection 객체 전달하기
		int result=new MessageDao().sendMessage(conn, m);

		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		//트랜잭션 처리되었으니 자원반납
		JDBCTemplate.close(conn);
		return result;
	}
	public ArrayList<Message> selectNewMessage(PageInfo pi,String userId){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Message> list = new MessageDao().selectNewMessage(conn, pi, userId);
		JDBCTemplate.close(conn);
		return list;
	}
	public int updateReadCheck(int messageNum, String userId) {
		Connection conn  = JDBCTemplate.getConnection();
		int result = 0;
		result = new MessageDao().updateReadCheck(conn, messageNum,userId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		//트랜잭션 처리되었으니 자원반납
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int newMessageCount(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new MessageDao().newMessageCount(conn, userId);
		JDBCTemplate.close(conn);
		return listCount;
	}
	
	public Message selectMessageByMNo(int mNo) {
		Connection conn = JDBCTemplate.getConnection();
		Message ms = new MessageDao().selectMessageByMNo(conn, mNo);
		return ms;
	}
	
	public int sendMessageCount(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new MessageDao().sendMessageCount(conn, userId);
		JDBCTemplate.close(conn);
		return listCount;
	}
	public ArrayList<Message> selectSendMessage(PageInfo pi, String userId){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Message> list = new MessageDao().selectSendMessage(conn, pi, userId);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public int receiveMessageCount(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new MessageDao().receiveMessageCount(conn, userId);
		JDBCTemplate.close(conn);
		return listCount;
	}
	public ArrayList<Message> selectReceiveMessage(PageInfo pi, String userId){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Message> list = new MessageDao().selectReceiveMessage(conn, pi,userId);
		JDBCTemplate.close(conn);
		return list;
	}
	
	
}
