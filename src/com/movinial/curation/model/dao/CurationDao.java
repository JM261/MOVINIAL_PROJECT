package com.movinial.curation.model.dao;

import static com.movinial.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.movinial.curation.model.vo.CurationList;
import com.movinial.movie.model.vo.Movie;

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
			
			pstmt.setString(1, "%"+movieKeyword+"%");
			pstmt.setString(2, "%"+movieKeyword+"%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Movie m = new Movie(
							rset.getInt("MOVIE_NO"),
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
							rset.getInt("MOVIE_SEEN")
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

	
	public int insertCurationList(Connection conn, CurationList cl) { // insertCurationList : 큐레이션 저장

		// 큐레이션 이름, 큐레이션에 들어있는 영화들의 번호 (,)으로 구분
		// insert
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCurationList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cl.getListName());
			pstmt.setString(2, cl.getListMovieId());
			pstmt.setString(3, cl.getPosterPath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	} // insertCurationList : 큐레이션 저장

	public ArrayList<CurationList> selectCurationList(Connection conn) { //  selectCurationList : 큐레이션 조회
		
		ArrayList<CurationList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCurationList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				CurationList cl = new CurationList(
													rset.getInt("LIST_NO"),
													rset.getString("LIST_NAME"),
													rset.getString("LIST_MOVIE_Id"),
													rset.getString("STATUS")
												  );
				list.add(cl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	} //  selectCurationList : 큐레이션 조회

	public int deleteCuration(Connection conn, int listNo) { // deleteCuration : 큐레이션 삭제 

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCuration");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, listNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	} // deleteCuration : 큐레이션 삭제

	public ArrayList<CurationList> randomList(Connection conn) {
		
		ArrayList<CurationList> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("randomList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				CurationList cl = new CurationList(
													rset.getInt("LIST_NO"),
													rset.getString("LIST_NAME"),
													rset.getString("LIST_MOVIE_ID"),
													rset.getString("STATUS"),
													rset.getString("LIST_POSTER_PATH")
												  );
				list.add(cl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Movie> latestList(Connection conn) { // latestList : 가장 최신 영화 조회하기
		
		ArrayList<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("latestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Movie m = new Movie(
									rset.getInt("MOVIE_NO"),
									rset.getString("POSTER_PATH")
									);
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}  // latestList : 가장 최신 영화 조회하기
	
	
	
	
	
	
	
	
	
	
	
}
