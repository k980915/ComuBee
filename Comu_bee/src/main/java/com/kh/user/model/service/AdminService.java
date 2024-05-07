package com.kh.user.model.service;

import java.sql.Connection;

import com.kh.common.JDBCTemplate;
import com.kh.user.model.dao.AdminDao;
import com.kh.user.model.vo.AdminHits;

public class AdminService {
	public int AdminHitsView() {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().AdminHitsView(conn);
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int AdminHitsViewUpdate(int hitLog) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().AdminHitsViewUpdate(conn,hitLog);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		

		JDBCTemplate.close(conn);
		
		return result;
	}

	public int MonthHitsView(AdminHits adh) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().MonthHitsView(conn,adh);

		JDBCTemplate.close(conn);
		
		return result;
	}
}
