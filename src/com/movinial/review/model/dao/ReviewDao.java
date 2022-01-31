package com.movinial.review.model.dao;

import static com.movinial.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.member.model.vo.LikesReview;
import com.movinial.review.model.vo.Review;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	/**
	 * 기본생성자: review-mapper.xml 읽어오기
	 */
	public ReviewDao() {
		
		String fileName = ReviewDao.class.getResource("/sql/review/review-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 해당 영화의 공개된 리뷰의 총 개수
	 * @param conn
	 * @param movieNo
	 * @return
	 */
	public int selectListCount(Connection conn, int movieNo) {
		
		// 변수
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, movieNo);
			
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
	
	/**
	 * 해당 영화 리뷰 상세보기 페이지 출력
	 * @param conn
	 * @param movieNo
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> selectMovieReviewList(Connection conn, int movieNo, PageInfo pi) {
		
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMovieReviewList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			// 페이지의 시작 리뷰 번호
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			
			// 페이지의 끝 리뷰 번호
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, movieNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("REVIEW_NO"),
					    			rset.getString("NICKNAME"),
					    			rset.getString("REVIEW_CONTENT"),
					    			rset.getDate("CREATE_DATE"),
					    			rset.getInt("LIKES"),
					    			rset.getInt("REF_MNO")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	/**
	 * 해당 영화의 리뷰 정보 받아오기
	 * @param conn
	 * @param movieNo
	 * @param movieNo2 
	 * @return
	 */
	public ArrayList<Review> selectMovieReview(Connection conn, int memberNo, int movieNo) {
		
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMovieReview");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, movieNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(rset.getInt("REVIEW_NO"),
								    rset.getString("NICKNAME"),
								    rset.getString("REVIEW_CONTENT"),
								    rset.getDate("CREATE_DATE"),
								    rset.getInt("LIKES")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	/**
	 * 리뷰 상세보기 페이지에서 리뷰 작성
	 * @param conn
	 * @param memberNo
	 * @param movieNo
	 * @param reviewContent
	 * @param reviewShow
	 * @param reviewTitle
	 * @return
	 */
	public int insertMovieReview(Connection conn, int memberNo, int movieNo, String reviewContent, String reviewShow, String reviewTitle) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMovieReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			pstmt.setString(2, reviewTitle);
			pstmt.setString(3, reviewContent);
			pstmt.setString(4, reviewShow);
			pstmt.setInt(5, movieNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	
	// ---------- 리뷰 좋아요 시작 ----------
	
	/**
	 * 리뷰 좋아요 테이블 회원번호로 조회
	 * @param conn
	 * @param memberNo
	 * @return
	 */
	public LikesReview selectLikesReview(Connection conn, int memberNo) {

		LikesReview lr = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLikesReview");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				lr = new LikesReview();
				lr.setLikesReview(rset.getString("LIKES_REVIEW"));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		
		return lr;
		
	}

	/**
	 * 해당 리뷰의 좋아요 수 증가
	 * @param conn
	 * @param reviewNo
	 * @return
	 */
	public int increaseLikes(Connection conn, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseLikes");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 해당 리뷰의 좋아요 수 감소
	 * @param conn
	 * @param reviewNo
	 * @return
	 */
	public int decreaseLikes(Connection conn, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("decreaseLikes");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	/**
	 * 좋아요 누른 리뷰 번호, 리뷰 좋아요 '좋아요' 컬럼에 저장
	 * @param conn
	 * @param memberNo
	 * @param reviewNo
	 * @return
	 */
	public int likesReviewStore(Connection conn, int memberNo, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("likesReviewStore");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "," + String.valueOf(reviewNo));
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	/**
	 * 좋아요 누른 리뷰 번호, 리뷰 좋아요 '좋아요' 컬럼에서 삭제
	 * @param conn
	 * @param memberNo
	 * @param reviewNo
	 * @return
	 */
	public int likesReviewRemove(Connection conn, int memberNo, int reviewNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("likesReviewRemove");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "," + String.valueOf(reviewNo));
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	// ---------- 리뷰 좋아요 끝 ----------
	

}
