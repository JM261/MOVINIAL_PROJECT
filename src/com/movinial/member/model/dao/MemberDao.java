 package com.movinial.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.movinial.common.JDBCTemplate.*;

import com.movinial.common.model.vo.PageInfo;
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
				
				m = new Member(rset.getInt("MEMBER_NO")
						  ,rset.getString("MEMBER_ID")
						  ,rset.getString("MEMBER_PWD")
						  ,rset.getString("MEMBER_NAME")
						  ,rset.getString("NICKNAME")
						  ,rset.getString("EMAIL")
						  ,rset.getString("PHONE")
						  ,rset.getString("MEMBER_TYPE")
						  ,rset.getString("STATUS")
						  ,rset.getDate("ENROLL_DATE")
						  ,rset.getDate("MODIFY_DATE")
						  ,rset.getString("preferGenre"));
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	public int selectMemberCount(Connection conn) { // 전체 멤버 수 조회
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;		
		
	} // selectMemberCount : 전체 회원 수(관리자)

	public ArrayList<Member> selectMember(Connection conn, PageInfo pi) {
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
						
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Member(rset.getInt("MEMBER_NO"),
								   rset.getString("MEMBER_ID"),
								   rset.getString("MEMBER_PWD"),
								   rset.getString("MEMBER_NAME"),
								   rset.getString("NICKNAME"),
								   rset.getString("EMAIL"),
								   rset.getString("PHONE"),
								   rset.getString("MEMBER_TYPE"),
								   rset.getString("STATUS"),
								   rset.getDate("ENROLL_DATE"),
								   rset.getDate("MODIFY_DATE"),
								   rset.getString("PREFERGENRE")								  
						));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	} // selectMember : 전체 회원 조회(관리자)

	public int deleteMember(Connection conn, String str) { // 멤버 삭제(관리자)
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(str));
			
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	} // deleteMember : 멤버 삭제(관리자)

	public ArrayList<Member> searchMember(Connection conn, String keyword) { // searchMember : 회원 검색(관리자)
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Member m = new Member(rset.getInt("MEMBER_NO")
						  ,rset.getString("MEMBER_ID")
						  ,rset.getString("MEMBER_PWD")
						  ,rset.getString("MEMBER_NAME")
						  ,rset.getString("NICKNAME")
						  ,rset.getString("EMAIL")
						  ,rset.getString("PHONE")
						  ,rset.getString("MEMBER_TYPE")
						  ,rset.getString("STATUS")
						  ,rset.getDate("ENROLL_DATE")
						  ,rset.getDate("MODIFY_DATE")
						  ,rset.getString("preferGenre"));
				
				list.add(m);				
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	} // searchMember : 회원 검색(관리자)
		
		
	
	
		
}


