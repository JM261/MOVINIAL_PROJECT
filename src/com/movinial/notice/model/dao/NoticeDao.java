package com.movinial.notice.model.dao;

import static com.movinial.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.movinial.notice.model.vo.Category;

public class NoticeDao {

	private Properties prop = new Properties();
		
		public NoticeDao() {
			
			String fileName = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
			
			try {
				prop.loadFromXML(new FileInputStream(fileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	public ArrayList<Category> selectCategory(Connection conn){
			
			// SELECT문 => ResultSet => 7개 == 여러 행
			// 변수
			ArrayList<Category> list = new ArrayList<>();		
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectCategory");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Category(rset.getInt("CATEGORY_NO"),
										  rset.getString("CATEGORY_NAME")));
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
