package com.kh.board.model.dao;

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
        String sql = "SELECT TITLE, BOARDCONTENT FROM BOARD WHERE (TITLE LIKE ? OR BOARDCONTENT LIKE ?) AND STATUS = 'Y'";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");  // 첫 번째 매개변수 (TITLE 검색)
            pstmt.setString(2, "%" + keyword + "%");  // 두 번째 매개변수 (BOARDCONTENT 검색)
            rset = pstmt.executeQuery();

            while (rset.next()) {
                Board board = new Board();
                
                board.setTitle(rset.getString("TITLE"));
                board.setBoardContent(rset.getString("BOARDCONTENT"));
                list.add(board);
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