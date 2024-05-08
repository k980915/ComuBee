package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardSearchDao;
import com.kh.board.model.vo.Board;
import com.kh.common.JDBCTemplate;

public class SearchService {

    public ArrayList<Board> search(String keyword) {
        //BoardSearchDao dao = new BoardSearchDao();
       
        Connection conn = JDBCTemplate.getConnection();
        
        ArrayList<Board> result= new BoardSearchDao().search(conn,keyword);
        System.out.println(result);
        JDBCTemplate.close(conn);
        return result;
    }
    
    
}
