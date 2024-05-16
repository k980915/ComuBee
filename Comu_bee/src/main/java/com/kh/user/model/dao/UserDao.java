package com.kh.user.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Reply;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.user.model.vo.User;

public class UserDao {

	private Properties prop = new Properties();

	public UserDao() {
		String filePath = UserDao.class.getResource("/resources/sql/user-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertUser(Connection conn, User u) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertUser");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUserPwd());
			pstmt.setString(3, u.getUserName());
			pstmt.setString(4, u.getUserEmail());
			pstmt.setString(5, u.getUserBirth());
			pstmt.setString(6, u.getUserGender());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public User loginUser(String userId, String userPwd, Connection conn) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		User u = new User();

		String sql = prop.getProperty("loginUser");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			rset = pstmt.executeQuery();

			if (rset.next()) {

				u = new User(rset.getString("USERID"), rset.getString("USERNAME"), rset.getString("USERPWD"),
						rset.getString("USERGENDER"), rset.getString("USERBIRTH"), rset.getString("USEREMAIL"),
						rset.getDate("JOINDATE"), rset.getInt("POINT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return u;
	}

	public Boolean checkId(String inputId, Connection conn) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("checkId");
		boolean flag = false;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);

			rset = pstmt.executeQuery();
			flag = rset.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return flag;
	}

	public int updateUser(Connection conn, User u) {
		// DML (UPDATE)
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateUser");

		try {
			// 미완성 SQL 구문 전달하며 PSTMT 객체 생성
			pstmt = conn.prepareStatement(sql);
			// 미완성인 sql구문 위치홀더에 맞는 데이터 넣어주기
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getUserGender());
			pstmt.setString(3, u.getUserEmail());
			pstmt.setString(4, u.getUserId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public User selectUser(Connection conn, String userId) {
		// SELECT 구문
		ResultSet rset = null; // 결과집합담을 변수
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectUser");
		User u = null; // 조회된 회원정보가 있으면 담아갈 객체변수

		try {
			// 미완성 구문 전달하며 객체생성
			pstmt = conn.prepareStatement(sql);
			// 위치홀더 채워주기
			pstmt.setString(1, userId);

			// 조회구문 실행 및 결과집합 반환받기
			rset = pstmt.executeQuery();

			// 조회결과가 있다면 우리가 만든 VO객체변수에 담아주기
			// userId 는 unique제약조건이기때문에 식별자로 사용된다(조회된다면 하나만 조회됨)
			if (rset.next()) {// 다음 접근할 행이 있나요?
				// 있다면 해당 정보 옮겨 담기

				u = new User(rset.getString("USERID"), rset.getString("USERNAME"), rset.getString("USERPWD"),
						rset.getString("USERGENDER"), rset.getString("USERBIRTH"), rset.getString("USEREMAIL"),
						rset.getDate("JOINDATE"), rset.getInt("POINT"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return u;// 결과객체 반환
	}

	public int updatePwd(Connection conn, String userId, String userPwd, String updatePwd) {
		// DML - update
		int result = 0; // 처리된 행수를 받아줄 변수
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");

		try {
			// 미완성 sql구문 전달하며 pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			// 미완성 sql구문 완성하기 (위치홀더 채워주기)
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);

			// 완성된 sql구문 실행 및 결과 반환받기
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result; // 결과값 반환
	}

	public int deleteUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("deleteUser");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	// 내가 쓴 글 개수 가져오기
	public int myBoardListCount(Connection conn, String userId) {

		// select
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("myBoardListCount");

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

	public ArrayList<Board> myBoardSelectList(Connection conn, PageInfo pi, String userId) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int startRow=(pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow=pi.getCurrentPage()*pi.getBoardLimit();
		String sql = prop.getProperty("selectListById");
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
	
	public int myReplyListCount(Connection conn, String userId) {

		// select
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("myReplyListCount");

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
	//아이디 찾기
	public User findId(String userName, String userEmail, Connection conn) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findId");
		User u = new User();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				u = new User(rset.getString("USERID"),
						rset.getString("USERNAME"), 
						rset.getString("USEREMAIL"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return u;
	}

	public User findPwd(String userId, String userName, String userEmail, Connection conn) {
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findPwd");
		User u = new User();
		


		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, userEmail);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				u = new User(rset.getString("USERID"),
						rset.getString("USERNAME"),
						rset.getString("USEREMAIL"),
						rset.getString("USERPWD"),
						rset.getString("STATUS"));
						
						
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);

		}
		
		System.out.println(u);

		return u;
	}
	
	
	

	public ArrayList<Reply> myReplySelectList(Connection conn, PageInfo pi, String userId) {
		// 준비물
		ArrayList<Reply> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("myReplySelectList");

		// 1페이지 : 게시글 1~10번 보여주기
		// 5페이지 : 게시글 41~50번 보여주기
		// currentPage : 현재페이지 / boardLimit : 한 페이지에서 보여질 게시글 총 개수
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startRow); // 시작값
			pstmt.setInt(3, endRow); // 끝값

			rset = pstmt.executeQuery();
			// 목록조회이니 더이상 조회될행이 없을때까지 추출하기
			while (rset.next()) {
				list.add(new Reply(rset.getInt("REPLYNO"), 
						rset.getString("USERID"), 
						rset.getString("REPLYCONTENT"),
						rset.getDate("CREATEDATE"), 
						rset.getInt("BOARDNO")));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	//추천인작성시 포인트 추가구문
	public int recomCheck(String recommender, Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("recomCheck");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, recommender);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch blosck
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int boardPointCheck(String boardWriter, Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("PointCheck");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardWriter);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch blosck
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int replyPoint(String userId, Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("replyPoint");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch blosck
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		System.out.println(result+"Dao");
		return result;
	}

	public int getUserPoint(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int userPoint = 0;
		String sql = prop.getProperty("getUserPoint");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				userPoint = rset.getInt("POINT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}System.out.println("userPoint : "+userPoint);
		return userPoint;
	}
}
