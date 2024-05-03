package com.kh.contents.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.contents.model.dao.ContentsDao;
import com.kh.contents.model.vo.Contents;

public class ContentsService {

	public Contents DetailContents(Contents co) {
		Connection conn = JDBCTemplate.getConnection();
		
		JDBCTemplate.close(conn);
		
		Contents c = new ContentsDao().DetailContents(conn, co);
		
		return c;	
	}
	
	
	
	
	
	

}
