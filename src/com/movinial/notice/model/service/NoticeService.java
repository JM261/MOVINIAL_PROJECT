package com.movinial.notice.model.service;

import static com.movinial.common.JDBCTemplate.close;
import static com.movinial.common.JDBCTemplate.commit;
import static com.movinial.common.JDBCTemplate.getConnection;
import static com.movinial.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.member.model.vo.Member;
import com.movinial.notice.model.dao.NoticeDao;
import com.movinial.notice.model.vo.Category;
import com.movinial.notice.model.vo.Notice;
import com.movinial.notice.model.vo.Qfile;
import com.movinial.notice.model.vo.Question;

public class NoticeService {
	
	public ArrayList<Category> selectCategory(){
		
		Connection conn = getConnection();
		
		ArrayList<Category> list = new NoticeDao().selectCategory(conn);
		
		close(conn);
		
		return list;
	}
	
	public int selectListCount(int memberNo) {
		
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().selectListCount(conn, memberNo);
		// SELECT문의 결과는 ResultSet이 맞지만, 
		// 게시글의 총 개수를 알아야 하기 때문에 정수형으로 반환받는다.
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Question> selectList(PageInfo pi, int memberNo) { // 나의 문의내역 페이징
		
		Connection conn = getConnection();
		
		ArrayList<Question> list = new NoticeDao().selectList(conn, pi, memberNo);
	
		close(conn);
		
		return list;
	}

	public int insertQuestion(Question q, Qfile at) {
		
		Connection conn = getConnection();
		
		// question 테이블에 INSERT 무조건
		int result1 = new NoticeDao().insertQuestion(conn, q);
		
		// Attachment 테이블에 INSERT (null이 아닐때만)
		int result2 = 1;
		if(at != null) {
			result2 = new NoticeDao().insertQfile(conn,at);
		}
		
		
		
		// 트랜잭션 처리
		if((result1 * result2 ) > 0) { // 성공
			commit(conn);
		} else { // 실패
			rollback(conn);
		}
		close(conn);
		
		return (result1 * result2);
	}

	
	public ArrayList<Notice> selectNoticeList(PageInfo pi) { // 공지 페이징
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn,pi);
	
		close(conn);
		
		return list;
	}
	
	
	public int selectNoticeListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new NoticeDao().selectNoticeListCount(conn);
		// SELECT문의 결과는 ResultSet이 맞지만, 
		// 게시글의 총 개수를 알아야 하기 때문에 정수형으로 반환받는다.
		
		close(conn);
		
		return listCount;
	}
	
	public Notice selectNotice(int noticeNo) {
			
			Connection conn = getConnection();
			
			Notice n = new NoticeDao().selectNotice(conn,noticeNo);
			
			/* 조회만 해주는 거니까 트랜잭션처리할 필요 없음 */
			
			close(conn);
			
			return n;
		}
	
	public Question selectQuestion(int questionNo) {
		Connection conn = getConnection();
		
		Question q = new NoticeDao().selectQuestion(conn, questionNo);
		
		close(conn);
		
		return q;
	}

	public int insertNotice(Notice n) {
	
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) { 
			commit(conn);
		}else { 
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	} // insertNotice

	public int updateNotice(Notice n) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	} // updateNotice

	public int deleteNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	} // deleteNotice

	public Qfile selectQfile(int questionNo) {
		
		Connection conn = getConnection();
		Qfile at = new NoticeDao().selectQfile(conn, questionNo);
		
		close(conn);
		
		return at;
		
	}

	// 모든 문의 내역 수
	public int selectListManagementCount() {

		Connection conn = getConnection();
		
		int listCount = new NoticeDao().selectListManagementCount(conn);
		
		close(conn);
		
		return listCount;
	} // selectListManagementCount

	// 모든 문의 내역 조회
	public ArrayList<Question> selectListManagement(PageInfo pi) {

		Connection conn = getConnection();
		
		ArrayList<Question> list = new NoticeDao().selectListManagement(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	

}
