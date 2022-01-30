package com.movinial.movie.model.dao;

import static com.movinial.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.movinial.member.model.vo.LikesMovie;
import com.movinial.movie.model.vo.Movie;

public class MovieDao {
	
	private Properties prop = new Properties();
	
	/**
	 * 기본 생성자: movie-mapper.xml 파일 삽입
	 */
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
	
	
	// ---------- 영화 템플릿 시작 ----------
	
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
			
			pstmt.setInt(1, movieId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				moviePosterPath = rset.getString("POSTER_PATH");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return moviePosterPath;
		
	}
	
	/**
	 * 영화 배경 가져오기
	 * @param conn
	 * @param movieId
	 * @return String
	 */
	public String getMovieBackdropPath(Connection conn, int movieId) {
		
		String movieBackdropPath = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getMovieBackdropPath");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, movieId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				movieBackdropPath = rset.getString("BACKDROP_PATH");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return movieBackdropPath;
		
	}
	
	// ---------- 영화 템플릿 끝 ----------
	
	
	// ---------- 영화 봤어요 시작 ----------
	
	/**
	 * 영화 좋아요 테이블 회원번호로 조회 (이영화 봤어요 컬럼용)
	 * @param conn
	 * @param memberNo
	 * @return
	 */
	public LikesMovie selectSeenMovie(Connection conn, int memberNo) {
		
		LikesMovie lm = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSeenMovie");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				lm = new LikesMovie();
				lm.setSeenMovie(rset.getString("SEEN_MOVIE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		
		return lm;
		
	}

	/**
	 * 해당 영화의 봤어요 수 증가
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
	 * 해당 영화의 봤어요 수 감소
	 * @param conn
	 * @param movieNo
	 * @return
	 */
	public int decreaseMovieSeen(Connection conn, int movieNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("decreaseMovieSeen");
		
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
	 * 봤어요 누른 영화 번호, 영화 좋아요 '이영화 봤어요' 컬럼에 저장
	 * @param conn
	 * @param memberNo
	 * @param movieNo
	 * @return
	 */
	public int seenMovieStore(Connection conn, int memberNo, int movieNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("seenMovieStore");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "," + String.valueOf(movieNo));
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
	 * 봤어요 누른 영화 번호, 영화 좋아요 '이영화 봤어요' 컬럼에서 삭제
	 * @param conn
	 * @param memberNo
	 * @param movieNo
	 * @return
	 */
	public int seenMovieRemove(Connection conn, int memberNo, int movieNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("seenMovieRemove");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "," + String.valueOf(movieNo));
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	// ---------- 영화 봤어요 끝 ----------

	
	// ---------- 영화 좋아요 시작 ----------

	/**
	 * 영화 좋아요 테이블 회원번호로 조회 (좋아요 컬럼용)
	 * @param conn
	 * @param memberNo
	 * @return
	 */
	public LikesMovie selectLikesMovie(Connection conn, int memberNo) {
		
		LikesMovie lm = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLikesMovie");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				lm = new LikesMovie();
				lm.setLikesMovie(rset.getString("LIKES_MOVIE"));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		
		return lm;
		
	}


	/**
	 * 해당 영화의 좋아요 수 증가
	 * @param conn
	 * @param movieNo
	 * @return
	 */
	public int increaseMovieLikes(Connection conn, int movieNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseMovieLikes");
		
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
	 * 해당 영화의 좋아요 수 감소
	 * @param conn
	 * @param movieNo
	 * @return
	 */
	public int decreaseMovieLikes(Connection conn, int movieNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("decreaseMovieLikes");
		
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
	 * 좋아요 누른 영화 번호, 영화 좋아요 '좋아요' 컬럼에 저장
	 * @param conn
	 * @param memberNo
	 * @param movieNo
	 * @return
	 */
	public int likesMovieStore(Connection conn, int memberNo, int movieNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("likesMovieStore");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "," + String.valueOf(movieNo));
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
	 * 좋아요 누른 영화 번호, 영화 좋아요 '좋아요' 컬럼에서 삭제
	 * @param conn
	 * @param memberNo
	 * @param movieNo
	 * @return
	 */
	public int likesMovieRemove(Connection conn, int memberNo, int movieNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("likesMovieRemove");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "," + String.valueOf(movieNo));
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	// ---------- 영화 좋아요 끝 ----------
	
	
	// ---------- 회원 추천 영화 시작 ----------
	
	/**
	 * 회원 선호 장르 가져오기
	 * @param conn
	 * @param memberNo
	 * @return
	 */
	public String selectMemberPreferGenre(Connection conn, int memberNo) {
		
		String result = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberPreferGenre");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getString("PREFERGENRE");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
		
		
	}

	/**
	 * 회원 선호 장르 기반 추천 영화 가져오기 (5개)
	 * @param conn
	 * @param regExpGenre
	 * @return
	 */
	public ArrayList<Movie> selectMemberRecommendMovie(Connection conn, String regExpGenre) {
		
		ArrayList<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberRecommendMovie");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, regExpGenre);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("MOVIE_NO"),
							  	   rset.getInt("MOVIE_ID"),
							  	   rset.getString("TITLE"),
							  	   rset.getString("POSTER_PATH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	
	// ---------- 회원 추천 영화 끝 ----------
	
	
}
