package com.kh.scrab.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.scrab.model.dao.ScrabDao;
import com.kh.scrab.model.vo.Scrab;
import com.kh.user.model.dao.UserDao;

public class ScrabService {
	
	
	public int myScrabListCount(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new ScrabDao().myScrabListCount(conn,userId);
		JDBCTemplate.close(conn);
		
		return listCount;
	}

	public ArrayList<Board> myScrabSelectList(PageInfo pi, String userId) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new ScrabDao().myScrabSelectList(conn,pi,userId);
		
		//select 구문은 트랜잭션처리 필요없으니 자원반납만 하면 된다
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	public int insertScrab(int bNo, String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ScrabDao().insertScrab(conn,bNo,userId);
		if (result > 0) { // 성공시 확정
			JDBCTemplate.commit(conn);
		} else {// 실패시 되돌리기
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	
}
