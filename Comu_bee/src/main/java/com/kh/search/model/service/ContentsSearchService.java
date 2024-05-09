package com.kh.search.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.search.model.dao.ContentsSearchDao;
import com.kh.contents.model.vo.Contents;

public class ContentsSearchService {

    public ArrayList<Contents> search(String keyword) {
       
        Connection conn = JDBCTemplate.getConnection();
        
        ArrayList<Contents> result= new ContentsSearchDao().search(conn,keyword);
        System.out.println(result);
        JDBCTemplate.close(conn);
        return result;
    }


}
