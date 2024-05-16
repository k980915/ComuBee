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
import com.kh.board.model.vo.Reply;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.contents.model.vo.Contents;

public class BoardDao {
	private Properties prop = new Properties();
	public BoardDao() {
		String filepath = BoardDao.class.getResource("/resources/sql/board_mapper.xml").getPath();
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
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int startRow=(pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow=pi.getCurrentPage()*pi.getBoardLimit();
		String sql = prop.getProperty("selectList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset=pstmt.executeQuery();
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
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public int listCount(Connection conn,String ca) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("listCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ca);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				result=rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
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
						rset.getString("ATNO"),
						rset.getString("CATEGORYNAME"),
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

	public Attachment selectAttachment(Connection conn, int bno) {
		// TODO Auto-generated method stub
		Attachment at = new Attachment();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectAttachment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				at=new Attachment(
							rset.getInt("ATNO"),
							rset.getInt("CATEGORYNO"),
							rset.getInt("BOARDNO"),
							rset.getString("ORIGINNAME"),
							rset.getString("CHANGENAME"),
							rset.getString("ATFILEPATH"),
							rset.getDate("ATUPLOADDATE")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}		
		return at;
	}

	public ArrayList<Board> selectListById(Connection conn, PageInfo pi, String userId) {
		// TODO Auto-generated method stub
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

	public ArrayList<Board> selectListbyCategory(Connection conn, PageInfo pi, String ca) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int startRow=(pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow=pi.getCurrentPage()*pi.getBoardLimit();
		String sql = prop.getProperty("selectListByCategory");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ca);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Board(
						rset.getInt("BOARDNO"),
						rset.getString("USERID"),
						rset.getString("CATEGORYNAME"),
						rset.getString("TITLE"),
						rset.getString("BOARDCONTENT"),
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

	public ArrayList<Board> newPopList(Connection conn, Board b) {
		// TODO Auto-generated method stub
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("newPopList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getCategory());
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Board(
						rset.getInt("BOARDNO"),
						rset.getString("TITLE"),
						rset.getString("BOARDCONTENT")
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

	public ArrayList<Board> bestPopList(Connection conn, Board b) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("bestPopList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getCategory());
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Board(
						rset.getInt("BOARDNO"),
						rset.getString("TITLE"),
						rset.getString("BOARDCONTENT"),
						rset.getInt("BOARDLIKE")
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

	public ArrayList<Contents> bestContList(Connection conn) {
		// TODO Auto-generated method stub
		ArrayList<Contents> list=new ArrayList<>();
		Statement stmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("bestContList");
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(sql);
			
			while(rset.next()) {
				list.add(new Contents(
						rset.getInt("CONTENTSID"),
						rset.getString("TITLE"),
						rset.getString("POSTERPATH"),
						rset.getDouble("RATE")
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

	public int deleteBoard(Connection conn, int bno) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("deleteBoard");
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

	public ArrayList<Board> selectNoticeListByCategory(Connection conn) {
		// TODO Auto-generated method stub
		ArrayList<Board> noList=new ArrayList<>();
		Statement stmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectNoticeListByCategory");
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(sql);
			while(rset.next()) {
				noList.add(new Board(
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
			JDBCTemplate.close(stmt);
		}
		return noList;
	}
	public int selectBoardNo(Connection conn) {
		// select 구문으로 시퀀스 발행시키기
		int boardNo=0;
		ResultSet rset = null;
		Statement stmt = null;
		String sql = prop.getProperty("selectBoardNo");
		
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(sql);
			if(rset.next()) {
				boardNo = rset.getInt("BNO");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return boardNo;
	}
	
	public int insertBoard(Connection conn, Board b) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertBoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardNo());
			pstmt.setString(2, b.getUserId());
			pstmt.setString(3, b.getCategory());
			pstmt.setString(4, b.getTitle());
			pstmt.setString(5, b.getBoardContent());
			pstmt.setString(6, b.getContentsId());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int insertAttachment(Connection conn, Attachment at,Board b) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBoardNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getAtFilePath());
			pstmt.setString(5,b.getCategory());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertReply(Connection conn, Reply r) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertReply");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, r.getUserId());
			pstmt.setString(2, r.getReplyContent());
			pstmt.setInt(3, r.getBoardNo());
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Reply> replyList(Connection conn, int bno) {
		// TODO Auto-generated method stub
		ArrayList<Reply> rList = new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql = prop.getProperty("replyList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				rList.add(new Reply(
						rset.getInt("REPLYNO"),
						rset.getString("USERID"),
						rset.getString("REPLYCONTENT"),
						rset.getDate("CREATEDATE")
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return rList;
	}

	public ArrayList<Contents> searchContentByTitle(Connection conn, String contTitle) {
		// TODO Auto-generated method stub
		ArrayList<Contents> cList=new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("searchContentByTitle");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+contTitle+"%");
			rset=pstmt.executeQuery();
			while(rset.next()) {
				Contents c=new Contents();
				c.setContentsId(rset.getInt("CONTENTSID"));
				c.setTitle(rset.getString("TITLE"));
				cList.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
			JDBCTemplate.close(pstmt);
		}
		
		return cList;
	}

	public int updateBoard(Connection conn, Board b) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("updateBoard");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, b.getBoardNo());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int likeCheck(Connection conn, int bno, String userId) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("likeCheck");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, userId);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				result=rset.getInt("COUNT");
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
	public int scrabCheck(Connection conn, int bno, String userId) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("scrabCheck");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, userId);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				result=rset.getInt("COUNT");
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

	public int deleteLike(Connection conn, int bno, String userId) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("deleteLike");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, userId);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	public int deleteScrab(Connection conn, int bno, String userId) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("deleteScrab");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, userId);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int insertLike(Connection conn, int bno, String userId) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertLike");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, userId);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int insertScrab(Connection conn, int bno, String userId) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertScrab");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, userId);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int countLike(Connection conn, int bno) {
		// TODO Auto-generated method stub
		int like=0;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("countLike");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				like=rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return like;
	}
	
	public int updateBoardLike(Connection conn, int bno,int like) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql = prop.getProperty("updateBoardLike");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, like);
			pstmt.setInt(2, bno);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Board> selectListByLike(Connection conn,PageInfo pi) {
		// TODO Auto-generated method stub
		ArrayList<Board> list = new ArrayList<>();
		int startRow=(pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow=pi.getCurrentPage()*pi.getBoardLimit();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql=prop.getProperty("selectListByLike");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Board(
						rset.getInt("BOARDNO"),
						rset.getString("USERID"),
						rset.getString("CATEGORYNAME"),
						rset.getString("TITLE"),
						rset.getString("BOARDCONTENT"),
						rset.getDate("CREATEDATE"),
						rset.getInt("BOARDLIKE"),
						rset.getInt("COUNT")
						));
			};
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int updateAttachment(Connection conn, Attachment at) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("updateAttachment");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getAtFilePath());
			pstmt.setInt(4, at.getAtNo());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		System.out.println("결과는" +result);
		return result;

	}



}
