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

}
