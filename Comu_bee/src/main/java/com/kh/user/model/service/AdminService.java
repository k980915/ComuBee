package com.kh.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.user.model.dao.AdminDao;
import com.kh.user.model.vo.AdminHits;
import com.kh.user.model.vo.User;

public class AdminService {
	public int AdminHitsView() {
		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminDao().AdminHitsView(conn);

		JDBCTemplate.close(conn);

		return result;
	}

	public int AdminHitsViewUpdate(int hitLog) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminDao().AdminHitsViewUpdate(conn, hitLog);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;
	}

	public int MonthHitsView(AdminHits adh) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new AdminDao().MonthHitsView(conn, adh);

		JDBCTemplate.close(conn);

		return result;
	}

	public ArrayList<AdminHits> HitsYearSelectAll(String yearData2) {
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<AdminHits> list = new AdminDao().HitsYearSelectAll(conn, yearData2);

		JDBCTemplate.close(conn);
		
		return list;

	}

	public int suspendDays(String susDays, String userIdval) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().suspendDays(conn, susDays,userIdval);
		
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);
		
		return result;
	}

	public int unSuspend(String userIdval) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().unSuspend(conn, userIdval);
		
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);
		
		return result;
	}

	public User UserInfoList(String userId) {
		Connection conn = JDBCTemplate.getConnection();

		User list = new AdminDao().UserInfoList(conn,userId);

		JDBCTemplate.close(conn);
		
		return list;
	}

	public int UseradminSuspend(String userIdval) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().UseradminSuspend(conn,userIdval);
		
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);
		return result;
	}

	public int MessageCouponCreate(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new AdminDao().MessageCouponCreate(conn,userId);
		
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);
		return result;
	}

	

}
