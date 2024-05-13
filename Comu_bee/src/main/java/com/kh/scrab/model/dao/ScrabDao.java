package com.kh.scrab.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Board;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.scrab.model.vo.Scrab;

public class ScrabDao {
	private Properties prop = new Properties();
	public ScrabDao() {
		//message-mapper파일의 물리적인 주소(경로) 알아오기
		// getResource에서 /로 시작하면 classes 가 기준이 됨
		String filePath = ScrabDao.class
								   .getResource("/resources/sql/scrab-mapper.xml")
								   .getPath();
//		System.out.println(filePath);
		//해당 sql 구문 파일 경로를 스트림에 담아준다 
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public int myScrabListCount(Connection conn, String userId) {

		// select
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("myScrabListCount");

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
	
	public ArrayList<Board> myScrabSelectList(Connection conn, PageInfo pi, String userId) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int startRow=(pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow=pi.getCurrentPage()*pi.getBoardLimit();
		String sql = prop.getProperty("myScrabSelectList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(
						rset.getInt("BOARDNO"),
						rset.getString("USERID"),
						rset.getString("CATEGORYNAME"),
						rset.getString("TITLE"),
						rset.getDate("CREATEDATE"),
						rset.getInt("BOARDLIKE"),
						rset.getInt("COUNT")
						));
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
	
	public int insertScrab(Connection conn, int bNo, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertScrab");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, bNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	
	
}
