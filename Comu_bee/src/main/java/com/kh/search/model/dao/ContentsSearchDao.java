package com.kh.search.model.dao;

import com.kh.common.JDBCTemplate;
import com.kh.contents.model.vo.Contents;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ContentsSearchDao {

    public ArrayList<Contents> search(Connection conn, String keyword) {
        ArrayList<Contents> list = new ArrayList<>();  // 결과를 저장할 ArrayList
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        String sql = "SELECT CONTENTSID, TITLE, ENGLISHTITLE, OVERVIEW, POSTERPATH, RUNTIME, RELEASEDATE,"
        		+ " DIRECTOR FROM CONTENTS WHERE (UPPER(TITLE) LIKE UPPER(?) OR UPPER(DIRECTOR) LIKE UPPER(?))";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword.toUpperCase() + "%");  // 첫 번째 매개변수 (TITLE 검색)
            pstmt.setString(2, "%" + keyword.toUpperCase() + "%");  // 두 번째 매개변수 (DIRECTOR 검색)
            rset = pstmt.executeQuery();

            while (rset.next()) {
                Contents Contents = new Contents();
                
                Contents.setContentsId(rset.getInt("CONTENTSID"));
                Contents.setTitle(rset.getString("TITLE"));
                Contents.setEnglishTitle(rset.getString("ENGLISHTITLE"));
                Contents.setOverView(rset.getString("OVERVIEW"));
                Contents.setPosterPath(rset.getString("POSTERPATH"));
                Contents.setRuntime(rset.getString("RUNTIME"));
                Contents.setReleaseDate(rset.getString("RELEASEDATE"));
                Contents.setDirector(rset.getString("DIRECTOR"));
                list.add(Contents);
                
                //로그찍기
                System.out.println("타이틀: Title " + Contents.getTitle() + ", 감독 " + Contents.getDirector());
                
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