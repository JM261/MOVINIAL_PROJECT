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
							  rset.getInt("MOVIE_ID"),
							  rset.getString("TITLE"),
							  rset.getString("ORIGINAL_TITLE"),
							  rset.getString("ORIGINAL_LANGUAGE"),
							  rset.getString("OVERVIEW"),
							  rset.getString("GENRE_IDS"),
							  rset.getDate("RELEASE_DATE"),
							  rset.getString("POSTER_PATH"),
							  rset.getString("BACKDROP_PATH"),
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
	

	/**
	 * 영화 포스터 가져오기
	 * @param conn
	 * @param movieId
	 * @return String
	 */
	public String getMoviePosterPath(Connection conn, int movieId) {
		
		String moviePosterPath = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMoviePosterPath");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			System.out.println(movieId);
			
			pstmt.setInt(1, movieId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				moviePosterPath = rset.getString("POSTER_PATH");
			}
			
			System.out.println(moviePosterPath);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return moviePosterPath;
		
	}
	
	
	

	/**
	 * 봤어요 카운트 올려주기
	 * @param conn
	 * @param movieNo
	 * @return
	 */
	public int increaseMovieSeen(Connection conn, int movieNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseMovieSeen");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, movieNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	/**
	 * 봤어요 카운트 내려주기
	 * @param conn
	 * @param movieNo
	 * @return
	 */
	public int decreaseMovieSeen(Connection conn, int movieNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseMovieSeen");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, movieNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}


	
	
}
