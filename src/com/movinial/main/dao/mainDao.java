package com.movinial.main.dao;

import static com.movinial.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.movinial.community.model.vo.Community;


public class mainDao {
private Properties prop = new Properties();
	
	public mainDao() {
		
		String fileName = mainDao.class.getResource("/sql/main/main-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Community> selectList(Connection conn) {
		
		ArrayList<Community> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Community(rset.getInt("COMMUNITY_NO"),
										rset.getString("COMMUNITY_TITLE"),
										rset.getString("COMMUNITY_CATEGORY"),
										rset.getString("NICKNAME"),
										rset.getInt("VIEWS"),
										rset.getInt("LIKES"),
										rset.getDate("CREATE_DATE"),
										rset.getString("SPOILER"),
										rset.getInt("REPORT_COUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	

}
