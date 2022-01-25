package com.movinial.movie.model.service;

import static com.movinial.common.JDBCTemplate.*;

import java.sql.Connection;

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
	 * 봤어요 카운트 올려주기
	 * @param movieNo
	 */
	public int increaseMovieSeen(int movieNo) {
		
		Connection conn = getConnection();
		
		int result = new MovieDao().increaseMovieSeen(conn, movieNo);
		
		close(conn);
		
		return result;
		
	}

	/**
	 * 봤어요 카운트 내려주기
	 * @param movieNo
	 */
	public int decreaseMovieSeen(int movieNo) {
		
		Connection conn = getConnection();
		
		int result = new MovieDao().increaseMovieSeen(conn, movieNo);
		
		close(conn);
		
		return result;
		
	}

}
