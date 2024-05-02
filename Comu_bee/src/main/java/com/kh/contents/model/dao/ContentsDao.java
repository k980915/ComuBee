package com.kh.contents.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ContentsDao {
	
private Properties prop = new Properties();
	
	public ContentsDao() {
		String filePath = ContentsDao.class.getResource("/resources/sql/board-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
