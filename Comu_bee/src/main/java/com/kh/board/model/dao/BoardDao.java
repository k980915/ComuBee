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
						rset.getString("ATNO"),
						rset.getString("CATEGORYNO"),
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
						rset.getString("CATEGORYNAME"),
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

	public ArrayList<Board> selectListbyCategory(Connection conn, PageInfo pi, String ca) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int startRow=(pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow=pi.getCurrentPage()*pi.getBoardLimit();
		String sql = prop.getProperty("selectListByCategory");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, ca);
			rset=pstmt.executeQuery();
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
						rset.getString("TITLE")
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

	public int insertBoard(Connection conn, Board b, ArrayList<Attachment> atList) {
		// TODO Auto-generated method stub
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertBoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getUserId());
			pstmt.setString(2, b.getCategory());
			pstmt.setString(3, b.getTitle());
			pstmt.setString(4, b.getBoardContent());
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
			pstmt.setString(1, contTitle);
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

}
