package com.movinial.curation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.movinial.common.JDBCTemplate.*;
import com.movinial.curation.model.dao.CurationDao;
import com.movinial.movie.model.vo.Movie;

public class CurationService {

	public ArrayList<Movie> searchMovie(String movieKeyword) { // searchMovie : 키워드로 영화 조회 

		Connection conn = getConnection();
		
		ArrayList<Movie> list = new CurationDao().searchMovie(conn, movieKeyword);
		
		close(conn);
		
		return list;
		
	} // searchMovie : 키워드로 영화 조회 

	

	
	
}
