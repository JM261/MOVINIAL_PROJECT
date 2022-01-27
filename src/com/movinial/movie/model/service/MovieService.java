package com.movinial.movie.model.service;

import static com.movinial.common.JDBCTemplate.*;

import java.sql.Connection;

import com.movinial.community.model.dao.CommunityDao;
import com.movinial.member.model.vo.LikesMovie;
import com.movinial.movie.model.dao.MovieDao;
import com.movinial.movie.model.vo.Movie;

public class MovieService {

	/**
	 * 선택한 영화 상세보기
	 * @return
	 */
	public Movie selectMovieDetail(int movieNo) {
		
		Connection conn = getConnection();
		
		Movie m = new MovieDao().selectMovieDetail(conn, movieNo);
		
		close(conn);
		
		return m;
		
	}
	
	/**
	 * 영화 포스터 가져오기
	 * @param movieId
	 * @return
	 */
	public String getMoviePosterPath(int movieId) {
		
		Connection conn = getConnection();
		
		String moviePosterPath = new MovieDao().getMoviePosterPath(conn, movieId);
		
		close(conn);
		
		return moviePosterPath;
		
	}
	
	/**
	 * 영화 배경 가져오기
	 * @param movieId
	 * @return
	 */
	public String getMovieBackdropPath(int movieId) {
		
		Connection conn = getConnection();
		
		String movieBackdropPath = new MovieDao().getMovieBackdropPath(conn, movieId);
		
		close(conn);
		
		return movieBackdropPath;
		
	}
	
	/**
	 * 영화 좋아요 테이블 회원번호로 조회 (이영화 봤어요 컬럼용)
	 * @param memberNo
	 * @return
	 */
	public LikesMovie selectSeenMovie(int memberNo) {
		
		Connection conn = getConnection();

		LikesMovie lm = new MovieDao().selectSeenMovie(conn, memberNo);
		
		close(conn);
		
		return lm;
		
	}
	
	/**
	 * 해당 영화의 봤어요 수 증가 
	 * @param movieNo
	 * @return
	 */
	public int increaseMovieSeen(int movieNo) {
		
		Connection conn = getConnection();
		
		int result = new MovieDao().increaseMovieSeen(conn, movieNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	/**
	 * 해당 영화의 봤어요 수 감소
	 * @param movieNo
	 * @return
	 */
	public int decreaseMovieSeen(int movieNo) {
		
		Connection conn = getConnection();
		
		int result = new MovieDao().decreaseMovieSeen(conn, movieNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	/**
	 * 봤어요 누른 영화 번호, 영화 좋아요 '이영화 봤어요' 컬럼에 저장
	 * @param memberNo
	 * @param movieNo
	 * @return
	 */
	public int seenMovieStore(int memberNo, int movieNo) {
		
		Connection conn = getConnection();
		
		int result = new MovieDao().seenMovieStore(conn, memberNo, movieNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	/**
	 * 봤어요 누른 영화 번호, 영화 좋아요 '이영화 봤어요' 컬럼에서 삭제
	 * @param memberNo
	 * @param movieNo
	 * @return
	 */
	public int seenMovieRemove(int memberNo, int movieNo) {
		
		Connection conn = getConnection();
		
		int result = new MovieDao().seenMovieRemove(conn, memberNo, movieNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}


	
	
	
	
	
}
