package com.kh.scrab.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.scrab.model.vo.Scrab;

public class ScrabDao {
	private Properties prop = new Properties();
	public ScrabDao() {
		//message-mapper파일의 물리적인 주소(경로) 알아오기
		// getResource에서 /로 시작하면 classes 가 기준이 됨
		String filePath = ScrabDao.class
								   .getResource("/resources/sql/scrab-mapper.xml")
								   .getPath();
//		System.out.println(filePath);
		//해당 sql 구문 파일 경로를 스트림에 담아준다 
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<Scrab> selectScrabList(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Scrab> list = null;
		String sql = prop.getProperty("selectScrabList");
		return null;
	}
}
