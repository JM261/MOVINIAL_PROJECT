package com.movinial.community.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.movinial.common.JDBCTemplate.*;
import com.movinial.common.model.vo.PageInfo;
import com.movinial.community.model.dao.CommunityDao;
import com.movinial.community.model.vo.Community;
import com.movinial.community.model.vo.CommunityFile;
import com.movinial.community.model.vo.Reply;

public class CommunityService {

	public int selectListCount() { // 게시글 전체글 수 구하기
		
		Connection conn = getConnection();
		
		int listCount = new CommunityDao().selectListCount(conn);
		// SELECT문의 결과는 ResultSet 이지만 게시글의 총 갯수를 알아야 함으로 정수형으로 반환받기
		
		close(conn);
		
		return listCount;
	}
	
	public int selectListFilterCount(String communityCategory) { // 카테고리별 게시글 전체글 수 구하기
		
		Connection conn = getConnection();
		
		int listCount = new CommunityDao().selectListFilterCount(conn, communityCategory);
		// SELECT문의 결과는 ResultSet 이지만 게시글의 총 갯수를 알아야 함으로 정수형으로 반환받기
		
		close(conn);
		
		return listCount;
	}

	public int selectListSearchCount(String searchType, String keyword) { // 카테고리별 게시글 전체글 수 구하기
		
		Connection conn = getConnection();
		
		int listCount = new CommunityDao().selectListSearchCount(conn, searchType, keyword);
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
	
	public ArrayList<Community> selectListFilter(PageInfo pi, String communityCategory) {
		
		Connection conn = getConnection();
		
		ArrayList<Community> list = new CommunityDao().selectListFilter(conn, pi, communityCategory);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Community> selectListSearch(PageInfo pi, String searchType, String keyword) { // 게시글 키워드 검색  조회
		
		Connection conn = getConnection();
		
		ArrayList<Community> list = new CommunityDao().selectListSearch(conn, pi, searchType, keyword);
		
		close(conn);
		
		return list;
	}

	public int increaseCount(int communityNo) {
		
		Connection conn = getConnection();
		
		int result = new CommunityDao().increaseCount(conn, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Community selectCommunity(int communityNo) {
		
		Connection conn = getConnection();
		
		Community c = new CommunityDao().selectCommunity(conn, communityNo);
		
		close(conn);
		
		return c;
	}

	public CommunityFile selectCommunityFile(int communityNo) {
		
		Connection conn = getConnection();
		
		CommunityFile cf = new CommunityDao().selectCommunityFile(conn, communityNo);
		
		close(conn);
		
		return cf;
	}

	public ArrayList<Reply> selectReplyList(int communityNo) {

		Connection conn = getConnection();
		
		ArrayList<Reply> list = new CommunityDao().selectReplyList(conn, communityNo);
		
		close(conn);
		
		return list;
	}

	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		
		int result = new CommunityDao().insertReply(conn,r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int insertCommunity(Community c, CommunityFile cf) {
		
		Connection conn = getConnection();
		
		// board 테이블에 삽입 무조건 해야 됨!!!!!!!!!!!!!!!!!!!
		// 첨부파일은 null 이 아니라면 attachment 테이블에 삽입 <= 선택
		
		// 1) board테이블에 INSERT 무조건!!!!
		int result1 = new CommunityDao().insertCommunity(conn, c);
		
		// 2) attachment 테이블에 INSERT (null이 아닐때만!!)
		int result2 = 1;
		if(cf != null) {
			result2 = new CommunityDao().insertCommunityFile(conn, cf);
		}
		
		// 3) 트랜잭션
		// result1도 성공이고 result2도 성공일 때 commit
		// 둘중 하나라도 실패하면 ? 무조건 rollback
		// 곱셈
		if((result1 * result2) > 0) { // 성공
			commit(conn);
		} else { // 실패
			rollback(conn);
		}
		
		close(conn);
		
		return (result1 * result2);
	}


}
