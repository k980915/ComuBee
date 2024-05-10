package com.kh.user.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.user.model.vo.AdminHits;
import com.kh.user.model.vo.User;

public class AdminDao {
	private Properties prop = new Properties();
	
	public AdminDao() {
		String filePath = AdminDao.class.getResource("/resources/sql/admin-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int AdminHitsView(Connection conn) {
		int result = 0;
		ResultSet rset=null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminHits");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "2024년");
			pstmt.setString(2, "5월");
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				result = rset.getInt("TODAYHITS");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}


	public int AdminHitsViewUpdate(Connection conn, int hitLog) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminHitsUpdate");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, hitLog);
			pstmt.setInt(2, hitLog);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int MonthHitsView(Connection conn, AdminHits adh) {
		ResultSet rset = null;
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("adminMonthHitsView");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, adh.getYeatSelect());
			pstmt.setString(2, adh.getMonthSelect());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("MONTHHITS");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public ArrayList<AdminHits> HitsYearSelectAll(Connection conn, String yearData2) {
		ArrayList<AdminHits> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("HitsYearSelectAll");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, yearData2);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new AdminHits(rset.getString("MONTHSELECT")
										,rset.getInt("MONTHHITS")));
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

	public int suspendDays(Connection conn, String susDays, String userIdval) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("suspend");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userIdval);
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public int unSuspend(Connection conn, String userIdval) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("unsuspend");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userIdval);
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public User UserInfoList(Connection conn, String userId) {
		User list = new User();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("UserInfoList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				list = (new User (rset.getString("USERID")
										,rset.getString("USERNAME")
										,rset.getString("USEREMAIL")
										,rset.getDate("JOINDATE")
										,rset.getInt("POINT")));
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

	public int UseradminSuspend(Connection conn, String userIdval) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("suspend");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userIdval);
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

	public int MessageCouponCreate(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("CouponCreate");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
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
