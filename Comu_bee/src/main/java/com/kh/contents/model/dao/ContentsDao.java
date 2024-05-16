package com.kh.contents.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.contents.model.vo.Board;
import com.kh.contents.model.vo.Contents;

public class ContentsDao {
	
private Properties prop = new Properties();
	
	public ContentsDao() {
		String filePath = ContentsDao.class.getResource("/resources/sql/contents-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public ArrayList<Contents> DetailContentsList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Contents> list = new ArrayList<>();
		
		String sql = prop.getProperty("DetailContentsList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Contents(rset.getInt("CONTENTSID")
									 ,rset.getString("TITLE")
									 ,rset.getString("ENGLISHTITLE")
									 ,rset.getString("OVERVIEW")
									 ,rset.getString("POSTERPATH")
									 ,rset.getString("RUNTIME")
									 ,rset.getString("RELEASEDATE")
									 ,rset.getString("AGELIMIT")
									 ,rset.getDouble("RATE")
									 ,rset.getString("ACTORS")
									 ,rset.getString("DIRECTOR")
									 ,rset.getString("LINK")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}

	public ArrayList<Board> ForReview(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Board> list = new ArrayList<>();
		
		String sql = prop.getProperty("ForReview");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Board(rset.getString("USERID")
									 ,rset.getInt("CONTENTSID")
									 ,rset.getString("BOARDCONTENT")
									 ,rset.getDate("CREATEDATE")
									 ,rset.getString("STATUS")
									 ,rset.getInt("BOARDLIKE")
									 ,rset.getInt("HATE")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(rset);
		}	
		return list;
	}

	public ArrayList<Contents> BestContentsList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Contents> list = new ArrayList<>();
		
		String sql = prop.getProperty("BestContentsList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Contents(rset.getInt("CONTENTSID")
									 ,rset.getString("TITLE")
									 ,rset.getString("ENGLISHTITLE")
									 ,rset.getString("OVERVIEW")
									 ,rset.getString("POSTERPATH")
									 ,rset.getString("RUNTIME")
									 ,rset.getString("RELEASEDATE")
									 ,rset.getString("AGELIMIT")
									 ,rset.getDouble("RATE")
									 ,rset.getString("ACTORS")
									 ,rset.getString("DIRECTOR")
									 ,rset.getString("LINK")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(stmt);
			JDBCTemplate.close(rset);
		}	
		return list;
	}


	public ArrayList<Board> ForReview(Connection conn, int contentsId) {
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    
	    ArrayList<Board> list = new ArrayList<>();
	    
	    String sql = prop.getProperty("ForReview");
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, contentsId);
	        rset = pstmt.executeQuery();
	        
	        while(rset.next()) {
	            list.add(new Board(rset.getInt("BOARDNO")
	            				,rset.getString("USERID")
	                                     ,rset.getInt("CONTENTSID")
	                                     ,rset.getString("BOARDCONTENT")
	                                     ,rset.getDate("CREATEDATE")
	                                     ,rset.getString("STATUS")
	                                     ,rset.getInt("BOARDLIKE")
	                                     ,rset.getInt("HATE")));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JDBCTemplate.close(pstmt);
	        JDBCTemplate.close(rset);
	    }   
	    return list;
	}


}
