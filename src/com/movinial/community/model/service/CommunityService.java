package com.movinial.community.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.movinial.common.JDBCTemplate.*;
import com.movinial.common.model.vo.PageInfo;
import com.movinial.community.model.dao.CommunityDao;
import com.movinial.community.model.vo.Community;

public class CommunityService {

	public int selectListCount() { // 게시글 전체글 수 구하기
		
		Connection conn = getConnection();
		
		int listCount = new CommunityDao().selectListCount(conn);
		// SELECT문의 결과는 ResultSet 이지만 게시글의 총 갯수를 알아야 함으로 정수형으로 반환받기
		
		close(conn);
		
		return listCount;
	}
	
	public int selectListCount(String communityCategory) { // 카테고리별 게시글 전체글 수 구하기
		
		Connection conn = getConnection();
		
		int listCount = new CommunityDao().selectListCount(conn, communityCategory);
		// SELECT문의 결과는 ResultSet 이지만 게시글의 총 갯수를 알아야 함으로 정수형으로 반환받기
		
		close(conn);
		
		return listCount;
	}
	

	public ArrayList<Community> selectList(PageInfo pi) { // 게시글 전체 조회 
		
		Connection conn = getConnection();
		
		ArrayList<Community> list = new CommunityDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Community> selectList(PageInfo pi, String communityCategory) { // 게시글 카테고리별 필터링 조회
		
		Connection conn = getConnection();
		
		ArrayList<Community> list = new CommunityDao().selectList(conn, pi, communityCategory);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Community> selectList(PageInfo pi, String searchType, String keyword) { // 게시글 키워드 검색  조회
		
		Connection conn = getConnection();
		
		ArrayList<Community> list = new CommunityDao().selectList(conn, pi, searchType,keyword);
		
		close(conn);
		
		return list;
	}
}
