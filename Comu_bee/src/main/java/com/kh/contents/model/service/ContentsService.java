package com.kh.contents.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.contents.model.dao.ContentsDao;
import com.kh.contents.model.vo.Board;
import com.kh.contents.model.vo.Contents;

public class ContentsService {


//	public Contents DetailContents(Contents con) {
//		Connection conn = JDBCTemplate.getConnection();
//		
//		Contents c = new ContentsDao().DetailContents(conn, con);
//		
//		JDBCTemplate.close(conn);
//		return c;	
//	}

	public ArrayList<Contents> DetailContentsList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Contents> list = new ContentsDao().DetailContentsList(conn);	
		
		JDBCTemplate.close(conn);	
		return list;
	}

	public ArrayList<Contents> BestContentsList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Contents> list = new ContentsDao().BestContentsList(conn);	
		
		JDBCTemplate.close(conn);	
		return list;
	}

	public ArrayList<Board> ForReview() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> boardList = new ContentsDao().ForReview(conn);	
		JDBCTemplate.close(conn);	
		return boardList;
	}


	
	
	

}
