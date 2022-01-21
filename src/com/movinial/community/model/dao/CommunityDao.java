package com.movinial.community.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.community.model.vo.Community;

import static com.movinial.common.JDBCTemplate.*;

public class CommunityDao {
	
	private Properties prop = new Properties();
	
	public CommunityDao() {
		
		String fileName = CommunityDao.class.getResource("/sql/community/community-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) { // 게시글 전체글 수 구하기
		// SELECT문을 쓰지만 값은 정수가 필요함(총 게시글의 갯수)
		// 변수
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public int selectListCount(Connection conn, String communityCategory) { // 카테고리별 게시글 전체글 수 구하기
		// SELECT문을 쓰지만 값은 정수가 필요함(총 게시글의 갯수)
		// 변수
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCountFilter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, communityCategory);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}	
	
	
	public ArrayList<Community> selectList(Connection conn, PageInfo pi) { // 게시글 전체 조회
		
		// SELECT문 => ResultSet => 0개 또는 여러 행이므로 ArrayList<Board>
		
		// 필요한 변수 셋팅
		ArrayList<Community> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1 ;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
	
	public ArrayList<Community> selectList(Connection conn, PageInfo pi, String communityCategory) { // 게시글 카테고리별 필터링 조회
		
		// SELECT문 => ResultSet => 0개 또는 여러 행이므로 ArrayList<Board>
		
		// 필요한 변수 셋팅
		ArrayList<Community> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListFilter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1 ;
			
			pstmt.setString(1, communityCategory);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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

	public ArrayList<Community> selectList(Connection conn, PageInfo pi, String searchType, String keyword) { // 게시글 키워드 검색  조회
		
		// SELECT문 => ResultSet => 0개 또는 여러행
		
		// 필요한 변수 셋팅
		ArrayList<Community> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListFilter");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1 ;
			
			pstmt.setString(1, searchType);
			pstmt.setString(2, keyword);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
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
