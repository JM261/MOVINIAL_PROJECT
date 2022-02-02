package com.movinial.review.model.service;

import static com.movinial.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.member.model.vo.LikesReview;
import com.movinial.member.model.vo.Member;
import com.movinial.review.model.dao.ReviewDao;
import com.movinial.review.model.vo.Review;

public class ReviewService {
	
	/**
	 * 해당 영화 리뷰의 총 개수 (로그아웃 유저)
	 * @param movieNo
	 * @return
	 */
	public int selectListCountLogout(int movieNo) {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectListCountLogout(conn, movieNo);
		
		close(conn);
		
		return listCount;
		
	}
	
	/**
	 * 해당 영화 리뷰의 총 개수 (로그인 유저)
	 * @param memberNo
	 * @param movieNo
	 * @return
	 */
	public int selectListCountLogin(int memberNo, int movieNo) {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectListCountLogin(conn, memberNo, movieNo);
		
		close(conn);
		
		return listCount;
		
	}
	
	/**
	 * 해당 영화 리뷰 상세보기 페이지 출력 (로그아웃 유저)
	 * @param movieNo
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> selectMovieReviewListLogout(int movieNo, PageInfo pi, String orderBy) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectMovieReviewListLogout(conn, movieNo, pi, orderBy);
		
		close(conn);
		
		return list;
		
	}

	/**
	 * 해당 영화 리뷰 상세보기 페이지 출력 (로그인 유저)
	 * @param memberNo
	 * @param movieNo
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> selectMovieReviewListLogin(int memberNo, int movieNo, PageInfo pi, String orderBy) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectMovieReviewListLogin(conn, memberNo, movieNo, pi, orderBy);
		
		close(conn);
		
		return list;
		
	}
	
	/**
	 * 해당 영화의 리뷰 정보 받아오기 (로그아웃 유저)
	 * @param memberNo
	 * @param movieNo
	 * @return
	 */
	public ArrayList<Review> selectMovieReviewLogout(int movieNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectMovieReviewLogout(conn, movieNo);
		
		close(conn);
		
		return list;
		
	}

	/**
	 * 해당 영화의 리뷰 정보 받아오기 (로그인 유저)
	 * @param memberNo
	 * @param movieNo
	 * @return
	 */
	public ArrayList<Review> selectMovieReviewLogin(int memberNo, int movieNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectMovieReviewLogin(conn, memberNo, movieNo);
		
		close(conn);
		
		return list;
		
	}
	
	/**
	 * 리뷰 상세보기 페이지에서 리뷰 작성
	 * @param memberNo
	 * @param movieNo
	 * @param reviewContent
	 * @param reviewShow
	 * @param reviewTitle
	 * @return
	 */
	public int insertMovieReview(int memberNo, int movieNo, String reviewContent, String reviewShow, String reviewTitle) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().insertMovieReview(conn, memberNo, movieNo, reviewContent, reviewShow, reviewTitle);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	// 메인에 띄울 베스트 리뷰
	public ArrayList<Review> mainPageReview() {
		
		Connection conn = getConnection();

		ArrayList<Review> list = new ReviewDao().mainPageReview(conn);
		
		close(conn);
		
		return list;
	} 
	
	
	// ---------- 리뷰 좋아요 시작 ----------
	
	/**
	 * 리뷰 좋아요 테이블 회원번호로 조회
	 * @param memberNo
	 * @return 
	 */
	public LikesReview selectLikesReview(int memberNo) {
		
		Connection conn = getConnection();

		LikesReview lr = new ReviewDao().selectLikesReview(conn, memberNo);
		
		close(conn);
		
		return lr;
		
	}

	/**
	 * 해당 리뷰의 좋아요 수 증가
	 * @param reviewNo
	 * @return
	 */
	public int increaseLikes(int reviewNo) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().increaseLikes(conn, reviewNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	/**
	 * 해당 리뷰의 좋아요 수 감소
	 * @param reviewNo
	 * @return
	 */
	public int decreaseLikes(int reviewNo) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().decreaseLikes(conn, reviewNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	/**
	 * 좋아요 누른 리뷰 번호, 리뷰 좋아요 '좋아요' 컬럼에 저장
	 * @param memberNo
	 * @param reviewNo
	 * @return
	 */
	public int likesReviewStore(int memberNo, int reviewNo) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().likesReviewStore(conn, memberNo, reviewNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	/**
	 * 좋아요 누른 리뷰 번호, 리뷰 좋아요 '좋아요' 컬럼에서 삭제
	 * @param memberNo
	 * @param reviewNo
	 * @return
	 */
	public int likesReviewRemove(int memberNo, int reviewNo) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().likesReviewRemove(conn, memberNo, reviewNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	// ---------- 리뷰 좋아요 끝 ----------
	
	
	// ---------- 리뷰 신고 시작 ----------
	
	/**
	 * 회원 번호로 '회원' 테이블 '신고한 리뷰' 컬럼 조회
	 * @param memberNo
	 * @return
	 */
	public Member selectReviewReport(int memberNo) {
		
		Connection conn = getConnection();

		Member m = new ReviewDao().selectReviewReport(conn, memberNo);
		
		close(conn);
		
		return m;
		
	}
	
	/**
	 * 해당 리뷰의 신고 횟수 1 증가
	 * @param reviewNo
	 * @return
	 */
	public int reportReview(int reviewNo) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().reportReview(conn, reviewNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	/**
	 * 회원 테이블 신고한 리뷰에 해당 리뷰 번호 저장
	 * @param memberNo
	 * @param reviewNo
	 * @return
	 */
	public int reviewReportStore(int memberNo, int reviewNo) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().reviewReportStore(conn, memberNo, reviewNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	// ---------- 리뷰 신고 끝 ----------
	
	
}
