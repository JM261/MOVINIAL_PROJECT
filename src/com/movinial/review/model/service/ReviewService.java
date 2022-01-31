package com.movinial.review.model.service;

import static com.movinial.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.member.model.vo.LikesReview;
import com.movinial.review.model.dao.ReviewDao;
import com.movinial.review.model.vo.Review;

public class ReviewService {
	
	/**
	 * 해당 영화의 공개된 리뷰의 총 개수
	 * @param movieNo
	 * @return
	 */
	public int selectListCount(int movieNo) {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectListCount(conn, movieNo);
		
		close(conn);
		
		return listCount;
		
	}
	
	/**
	 * 해당 영화 리뷰 상세보기 페이지 출력
	 * @param movieNo
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> selectMovieReviewList(int movieNo, PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectMovieReviewList(conn, movieNo, pi);
		
		close(conn);
		
		return list;
		
	}

	/**
	 * 해당 영화의 리뷰 정보 받아오기
	 * @param movieNo
	 * @param movieNo2 
	 * @return
	 */
	public ArrayList<Review> selectMovieReview(int memberNo, int movieNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectMovieReview(conn, memberNo, movieNo);
		
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
	
	
	
}
