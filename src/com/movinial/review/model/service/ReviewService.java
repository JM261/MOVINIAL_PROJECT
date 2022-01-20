package com.movinial.review.model.service;

import static com.movinial.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.review.model.dao.ReviewDao;
import com.movinial.review.model.vo.Review;

public class ReviewService {
	
	/**
	 * 공개된 리뷰의 총 개수
	 * @return int 총 개수
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
		
	}

	/**
	 * 해당페이지의 최신 리뷰부터 뽑아오기
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
		
	}
	
	
	
}
