package com.movinial.review.model.service;

import static com.movinial.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.review.model.dao.ReviewDao;
import com.movinial.review.model.vo.Review;

public class ReviewService {
	
	/**
	 * 해당 영화의 공개된 리뷰의 총 개수
	 * @return int 총 개수
	 */
	public int selectListCount(int movieNo) {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectListCount(conn, movieNo);
		
		close(conn);
		
		return listCount;
		
	}

	/**
	 * 해당 영화 리뷰 상세보기 페이지 출력
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
	 * @param reviewNum
	 * @return
	 */
	public ArrayList<Review> selectMovieReview(int movieNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectMovieReview(conn, movieNo);
		
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
	
	
	
}
