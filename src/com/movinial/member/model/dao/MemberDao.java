 package com.movinial.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.movinial.common.JDBCTemplate;
import com.movinial.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		//SELECT문 => ResultSet객체로
		
		//변수선언먼저
		Member m = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		
		// pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			// 쿼리문을 날리기
			// 쿼리문 실행메소드
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("USER_NO")
						  ,rset.getString("USER_ID")
						  ,rset.getString("USER_PWD")
						  ,rset.getString("USER_NAME")
						  ,rset.getString("USER_NICKNAME")
						  ,rset.getString("EMAIL")
						  ,rset.getString("PHONE")
						  ,rset.getString("USERTYPE")
						  ,rset.getString("STAUS")
						  ,rset.getDate("ENROLL_DATE")
						  ,rset.getDate("MODIFY_DATE"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
		
		
		
	}


