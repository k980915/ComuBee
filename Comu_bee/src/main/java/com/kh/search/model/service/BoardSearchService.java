package com.kh.search.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.search.model.dao.BoardSearchDao;
import com.kh.board.model.vo.Board;
import com.kh.common.JDBCTemplate;

public class BoardSearchService {

    public ArrayList<Board> search(String keyword) {
       
        Connection conn = JDBCTemplate.getConnection();
        
        ArrayList<Board> result= new BoardSearchDao().search(conn,keyword);
        System.out.println(result);	
        JDBCTemplate.close(conn);
        return result;
    }
    
    
}
