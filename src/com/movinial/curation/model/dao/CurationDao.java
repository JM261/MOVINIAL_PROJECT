package com.movinial.curation.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.movinial.movie.model.vo.Movie;
import static com.movinial.common.JDBCTemplate.*;

public class CurationDao {

	private Properties prop = new Properties();
	
	public CurationDao() {
		
		String fileName = CurationDao.class.getResource("/sql/curation/curation-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<Movie> searchMovie(Connection conn, String movieKeyword) {
		
		// 영화 조회
		ArrayList<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchMovie");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, movieKeyword);
			pstmt.setString(2, movieKeyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Movie m = new Movie(
							rset.getInt("MOVIE_NO"),
							rset.getString("MOVIE_NAME_KR"),
							rset.getString("MOVIE_NAME_EN"),
							rset.getString("MOVIE_RELEASE_YEAR"),
							rset.getString("MOVIE_NATIONAL"),
							rset.getString("MOVIE_GENRE"),
							rset.getString("MOVIE_DIRECTOR"),
							rset.getString("MOVIE_IMAGE")
							);
				
				list.add(m);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	} // searchMovie
	
	
	
	//
	
	
	
	
	
	
	
}
