package com.kh.contents.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.contents.model.vo.Contents;

public class ContentsDao {
	
private Properties prop = new Properties();
	
	public ContentsDao() {
		String filePath = ContentsDao.class.getResource("/resources/sql/board-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Contents DetailContents(Connection conn, Contents co) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Contents c = null;
		
		String sql = prop.getProperty("DetailContents");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, co.getContentsId());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Contents(rset.getInt("CONTENTSID")
							  ,rset.getString("TITLE")
							  ,rset.getString("ENGLISHTITLE")
							  ,rset.getString("OVERVIEW")
							  ,rset.getString("POSTERPATH")
							  ,rset.getString("RUNTIME")
							  ,rset.getString("RELEASEDATE")
							  ,rset.getString("AGELIMIT")
							  ,rset.getDouble("RATE")
							  ,rset.getString("ACTORS")
							  ,rset.getString("DIRECTOR"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return c;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
