package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Category;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;

public class BoardService {

	public int listCount() {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int result=new BoardDao().listCount(conn);
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Board> list = new BoardDao().selectList(conn,pi);
		JDBCTemplate.close(conn);
		return list;
	}

	public int increaseCount(int bno) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().increaseCount(conn, bno);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public ArrayList<Category> selectCategoryList() {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Category> cList = new BoardDao().selectCategoryList(conn);
		JDBCTemplate.close(conn);
		return cList;
	}

	public Board selectBoard(int bno) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		Board b = new Board();
		b=new BoardDao().selectBoard(conn,bno);
		JDBCTemplate.close(conn);
		return b;
	}

	public ArrayList<Attachment> selectAttachment(int bno) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Attachment> atList = new BoardDao().selectAttachment(conn,bno);
		JDBCTemplate.close(conn);
		return atList;
	}

	public ArrayList<Board> selectListById(PageInfo pi, String userId) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Board> list = new BoardDao().selectListById(conn,pi,userId);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Board> selectListByCategory(PageInfo pi, String ca) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Board> list = new BoardDao().selectListbyCategory(conn,pi,ca);
		JDBCTemplate.close(conn);
		return list;
	}

}
