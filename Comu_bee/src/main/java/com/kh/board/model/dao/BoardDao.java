package com.kh.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Category;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;

public class BoardDao {
	private Properties prop = new Properties();
	public BoardDao() {
		String filepath = BoardDao.class.getResource("/resources/sql/board-mapper.xml").getPath();
			try {
				prop.loadFromXML(new FileInputStream(filepath));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		// TODO Auto-generated method stub
		ArrayList<Board> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Board(
						rset.getInt("BOARDNO"),
						rset.getString("CATEGORY"),
						rset.getString("TITLE"),
						rset.getString("USERID"),
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
			JDBCTemplate.close(stmt);
		}
		
		return list;
	}

	public int listCount(Connection conn) {
		// TODO Auto-generated method stub
		int result=0;
		Statement stmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("listCount");
		
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(sql);
			if(rset.next()) {
				result=rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		
		return result;
	}

	public int increaseCount(Connection conn, int bno) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("increaseCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Category> selectCategoryList(Connection conn) {
		// TODO Auto-generated method stub
		ArrayList<Category> cList=new ArrayList<>();
		Statement stmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectCategoryList");
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(sql);
			while(rset.next()) {
				cList.add(new Category(
							rset.getInt("CATEGORYNO"),
							rset.getString("CATEGORYNAME")
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return cList;
	}

	public Board selectBoard(Connection conn, int bno) {
		// TODO Auto-generated method stub
		Board b = new Board();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectBoard");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				b=new Board(
						bno,
						rset.getString("USERID"),
						rset.getString("ATPATHNAME"),
						rset.getString("CATEGORY"),
						rset.getString("CONTENTSID"),
						rset.getString("TITLE"),
						rset.getString("BOARDCONTENT"),
						rset.getDate("CREATEDATE"),
						rset.getDate("UPDATEDATE"),
						rset.getInt("BOARDLIKE"),
						rset.getInt("HATE"),
						rset.getInt("COUNT")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return b;
	}

	public ArrayList<Attachment> selectAttachment(Connection conn, int bno) {
		// TODO Auto-generated method stub
		ArrayList<Attachment> atList = new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectAttachment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				atList.add(new Attachment(
							rset.getInt("ATNO"),
							rset.getInt("CATEGORYNO"),
							rset.getInt("BOARDNO"),
							rset.getString("ORIGINNAME"),
							rset.getString("CHANGENAME"),
							rset.getString("ATFILEPATH"),
							rset.getDate("ATUPLOADDATE")
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		return atList;
	}

}
