package com.kh.message.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.message.model.dao.MessageDao;
import com.kh.message.model.vo.Message;

public class MessageService {
	public int insertMessage(Message m) {
		
		Connection conn = JDBCTemplate.getConnection();

		// DAO에게 전달받은 데이터와 Connection 객체 전달하기
		int result=new MessageDao().insertMessage(conn, m);

		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		//트랜잭션 처리되었으니 자원반납
		JDBCTemplate.close(conn);
		return result;
	}
	
	public ArrayList<Message> selectSendMessage(String userId){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Message> list = new MessageDao().selectSendMessage(conn, userId);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public ArrayList<Message> selectReceiveMessage(String userId){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Message> list = new MessageDao().selectReceiveMessage(conn, userId);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public ArrayList<Message> selectScrabMessage(String userId){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Message> list = new MessageDao().selectScrabMessage(conn, userId);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Message> selectNewMessage(String userId){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Message> list = new MessageDao().selectNewMessage(conn, userId);
		JDBCTemplate.close(conn);
		return list;
	}
	
}
