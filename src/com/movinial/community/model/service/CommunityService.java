package com.movinial.community.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.movinial.common.JDBCTemplate.*;
import com.movinial.common.model.vo.PageInfo;
import com.movinial.community.model.dao.CommunityDao;
import com.movinial.community.model.vo.Community;
import com.movinial.community.model.vo.CommunityFile;
import com.movinial.community.model.vo.Reply;
import com.movinial.member.model.vo.LikesCommunity;
import com.movinial.member.model.vo.Member;

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
		
		// 1) Community 테이블에 INSERT 
		int result1 = new CommunityDao().insertCommunity(conn, c);
		
		// 2) CommunityFile 테이블에 INSERT (null이 아닐때만,)
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

	public int updateCommunity(Community c, CommunityFile cf) {
		
		Connection conn = getConnection();
		
		// 1, 2, 3 케이스에 대해 공통적으로 일어나는 Community UPDATE 먼저 하고 조건 지정
		int result1 = new CommunityDao().updateCommunity(conn, c);
			
		int result2 = 1; // CommunityFile 테이블과 관련된 결과를 저장할 변수 선언 및 초기화
		
		// 새롭게 첨부된 파일이 있을경우
		if(cf != null) {
			// 기존의 첨부파일이 있을 경우
			if(cf.getFileNo() != 0) {
				result2 = new CommunityDao().updateCommunityFile(conn, cf);
			} else { // 기존 첨부파일이 없을 경우
				result2 = new CommunityDao().insertNewCommunityFile(conn, cf); // 재활용X
			}
		} // 새로운 첨부파일이 없을 경우 , 따로 할일이 없음 => else 블럭 X
		
		// 둘 다 성공했을 경우에만 무조건 commit
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return (result1 * result2);
	}

	public int deleteCommunity(int communityNo) {
		
		Connection conn = getConnection();
		
		int result = new CommunityDao().deleteCommunity(conn, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int increaseLike(int communityNo) { // 게시글 좋아요 수 증가
		
		Connection conn = getConnection();
		
		int result = new CommunityDao().increaseLike(conn, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int communityLikesStore(int memberNo, int communityNo) { // 좋아요 누른 글번호 게시글 좋아요 테이블에 저장

		Connection conn = getConnection();
		
		int result = new CommunityDao().communityLikesStore(conn, memberNo, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public LikesCommunity selectCommunityLikes(int memberNo) { // 게시글 좋아요 테이블 회원번호로 조회
		
		Connection conn = getConnection();

		LikesCommunity lc = new CommunityDao().selectCommunityLikes(conn, memberNo);
		
		close(conn);
		
		return lc;
	}

	public int decreaseLike(int communityNo) { // 게시글 좋아요 수 감소
		
		Connection conn = getConnection();
		
		int result = new CommunityDao().decreaseLike(conn, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int communityLikesRemove(int memberNo, int communityNo) { // 좋아요 누른 글번호 게시글 좋아요 테이블에서 제거

		Connection conn = getConnection();
		
		int result = new CommunityDao().communityLikesRemove(conn, memberNo, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int reportCommunity(int communityNo) { // 게시글 신고횟수 1 누적 증가
		
		Connection conn = getConnection();
		
		int result = new CommunityDao().reportCommunity(conn, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int communityReportStore(int memberNo, int communityNo) { // 좋아요 누른 글번호 회원 신고한 게시글 컬럼에 저장

		Connection conn = getConnection();
		
		int result = new CommunityDao().communityReportStore(conn, memberNo, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Member selectCommunityReport(int memberNo) { // 멤버 테이블 게시글 신고횟수 컬럼 회원번호로 조회
		
		Connection conn = getConnection();

		Member m = new CommunityDao().selectCommunityReport(conn, memberNo);
		
		close(conn);
		
		return m;
	}

	public ArrayList<Community> mainPageCommunity() { // 메인 페이지에 띄워줄 커뮤니티 글

		Connection conn = getConnection();
		
		ArrayList<Community> list = new CommunityDao().mainPageCommunity(conn);
		
		close(conn);
		
		return list;
	}  // 메인 페이지에 띄워줄 커뮤니티 글


}
