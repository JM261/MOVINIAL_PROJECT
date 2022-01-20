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

	public int selectListCount(Connection conn) {
		// SELECT => ResultSet => 근데 우리가 지금 필요한건 총 게시글의 갯수..?
		// SELECT문을 쓰지만 사잇ㄱ적으로 반환되는 값이 정수가 필요함
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

	public ArrayList<Community> selectList(Connection conn, PageInfo pi) {
		
		// SELECT문 => ResultSet => 여러 행이므로 ArrayList<Board>
		
		// 필요한 변수 셋팅
		ArrayList<Community> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// TOP-N분석 활용 : 인라인뷰 활용(서브쿼리 중에서도 FROM절에 서브쿼리가 들어가는 것)
			// 1) ORDER BY순서가 가장 마지막인데 맨 처음 실행 되어야 하므로
			// 일단 정렬해주는 SELECT문을 만듦 => 서브쿼리
			// 2) 서브쿼리를 FROM절에 넣음 (메인쿼리의) + ROWNUM 붙이기
			// 3) 메인쿼리의 WHERE절에 어디서부터 어디까지만 조회할건지 잘라내기
			
			// 구멍메구기
			/*
			 * boardLimit이 10이라는 가정하에
			 * 
			 * currentPage = 1 => 시작값 1, 끝값 10
			 * currentPage = 2 => 시작값 11, 끝값 20
			 * currentPage = 3 => 시작값 21, 끝값 30
			 * 
			 * => 시작값 = (currentPage -1 ) * boardLimit + 1
			 * => 끝값 = 시작값 + boardLimit - 1
			 * 
			 */
			
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

}
