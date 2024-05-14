package com.kh.search.model.dao;

import com.kh.board.model.vo.Board;
import com.kh.common.JDBCTemplate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardSearchDao {

    public ArrayList<Board> search(Connection conn, String keyword) {
        ArrayList<Board> list = new ArrayList<>();  // 결과를 저장할 ArrayList
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = "SELECT BOARDNO, CATEGORYNAME, TITLE, BOARDCONTENT, USERID, CREATEDATE, COUNT, BOARDLIKE FROM BOARD JOIN CATEGORY_BRD USING(CATEGORYNO) WHERE (TITLE LIKE ? OR BOARDCONTENT LIKE ?)";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");  // 첫 번째 매개변수 (TITLE 검색)
            pstmt.setString(2, "%" + keyword + "%");  // 두 번째 매개변수 (BOARDCONTENT 검색)
            rset = pstmt.executeQuery();

            while (rset.next()) {
                Board board = new Board();
                board.setBoardNo(rset.getInt("BOARDNO"));
                board.setCategory(rset.getString("CATEGORYNAME"));
                board.setTitle(rset.getString("TITLE"));
                board.setBoardContent(rset.getString("BOARDCONTENT"));
                board.setUserId(rset.getString("USERID"));
                board.setCreateDate(rset.getDate("CREATEDATE"));
                board.setCount(rset.getInt("COUNT"));
                board.setBoardLike(rset.getInt("BOARDLIKE"));
                list.add(board);
                
                //로그찍기
                System.out.println("타이틀: Title " + board.getTitle() + ", 컨텐츠 " + board.getBoardContent());
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	
        	JDBCTemplate.close(rset);
        	JDBCTemplate.close(pstmt);
        	
        }

        return list;
    }
}