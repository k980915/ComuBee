package com.kh.scrab.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.scrab.model.dao.ScrabDao;
import com.kh.scrab.model.vo.Scrab;

public class ScrabService {
	public ArrayList<Scrab> selectScrabList(String userId){
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Scrab> list= new ScrabDao().selectScrabList(conn, userId);
		JDBCTemplate.close(conn);
		return list;
	}
}
