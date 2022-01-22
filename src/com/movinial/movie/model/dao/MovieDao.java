package com.movinial.movie.model.dao;

import static com.movinial.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.movinial.movie.model.vo.Movie;

public class MovieDao {
	
	private Properties prop = new Properties();
	
	public MovieDao() {
		
		String fileName = MovieDao.class.getResource("/sql/movie/movie-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 선택한 영화 상세보기
	 * @param conn
	 * @return
	 */
	public Movie selectMovieDetail(Connection conn, int movieNo) {
		
		Movie m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMovieDetail");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, movieNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Movie(rset.getInt("MOVIE_NO"),
							  rset.getString("MOVIE_NAME_KR"),
							  rset.getString("MOVIE_NAME_EN"),
							  rset.getString("RELEASE_YEAR"),
							  rset.getString("NATIONAL"),
							  rset.getString("GENRE_NAME"),
							  rset.getString("DIRECTOR"),
							  rset.getString("COMPANY"),
							  rset.getString("MOVIE_IMAGE"),
							  rset.getInt("MOVIE_LIKES"),
							  rset.getInt("MOVIE_SEEN"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}

}
