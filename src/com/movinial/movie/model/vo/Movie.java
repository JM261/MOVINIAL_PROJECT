package com.movinial.movie.model.vo;

import java.sql.Date;

public class Movie {

	// 필드
	private int movieNo;				// MOVIE_NO	NUMBER
	private int movieId;				// MOVIE_ID	NUMBER
	private String title;				// TITLE	VARCHAR2(500 BYTE)
	private String originalTitle;		// ORIGINAL_TITLE	VARCHAR2(500 BYTE)
	private String originalLanguage;	// ORIGINAL_LANGUAGE	VARCHAR2(10 BYTE)
	private String overview;			// OVERVIEW	VARCHAR2(4000 BYTE)
	private String genreIds;			// GENRE_IDS	VARCHAR2(50 BYTE)
	private Date releaseDate; 			// RELEASE_DATE	DATE
	private String posterPath;			// POSTER_PATH	VARCHAR2(400 BYTE)
	private String backdropPath; 		// BACKDROP_PATH	VARCHAR2(400 BYTE)
	private int movieLikes; 			// MOVIE_LIKES	NUMBER
	private int movieSeen; 				// MOVIE_SEEN	NUMBER
	
	// 생성자
	// mainPage 최신 영화 포스터 이미지경로, 영화번호
	public Movie(int movieNo, String posterPath) {
		super();
		this.movieNo = movieNo;
		this.posterPath = posterPath;
	}
	
	/**
	 * 메인화면 영화 배경이미지 가져오기
	 * @param movieNo
	 * @param movieId
	 * @param backdropPath
	 */
	public Movie(int movieNo, int movieId, String backdropPath) {
		super();
		this.movieNo = movieNo;
		this.movieId = movieId;
		this.backdropPath = backdropPath;
	}

	/**
	 * 회원 선호 장르 기반 추천 영화 가져오기 (5개)
	 * @param movieNo
	 * @param title
	 * @param posterPath
	 */
	public Movie(int movieNo, String title, String posterPath) {
		super();
		this.movieNo = movieNo;
		this.title = title;
		this.posterPath = posterPath;
	}
	
	public Movie(int movieNo, int movieId, String title, String posterPath) {
		super();
		this.movieNo = movieNo;
		this.movieId = movieId;
		this.title = title;
		this.posterPath = posterPath;
	}

	public Movie(int movieNo, int movieId, String title, String originalTitle, String originalLanguage, String overview,
			String genreIds, Date releaseDate, String posterPath, String backdropPath, int movieLikes, int movieSeen) {
		super();
		this.movieNo = movieNo;
		this.movieId = movieId;
		this.title = title;
		this.originalTitle = originalTitle;
		this.originalLanguage = originalLanguage;
		this.overview = overview;
		this.genreIds = genreIds;
		this.releaseDate = releaseDate;
		this.posterPath = posterPath;
		this.backdropPath = backdropPath;
		this.movieLikes = movieLikes;
		this.movieSeen = movieSeen;
	}	
	
	
	// 메소드
	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public int getMovieId() {
		return movieId;
	}

	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOriginalTitle() {
		return originalTitle;
	}

	public void setOriginalTitle(String originalTitle) {
		this.originalTitle = originalTitle;
	}

	public String getOriginalLanguage() {
		return originalLanguage;
	}

	public void setOriginalLanguage(String originalLanguage) {
		this.originalLanguage = originalLanguage;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public String getGenreIds() {
		return genreIds;
	}

	public void setGenreIds(String genreIds) {
		this.genreIds = genreIds;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getPosterPath() {
		return posterPath;
	}

	public void setPosterPath(String posterPath) {
		this.posterPath = posterPath;
	}

	public String getBackdropPath() {
		return backdropPath;
	}

	public void setBackdropPath(String backdropPath) {
		this.backdropPath = backdropPath;
	}

	public int getMovieLikes() {
		return movieLikes;
	}

	public void setMovieLikes(int movieLikes) {
		this.movieLikes = movieLikes;
	}

	public int getMovieSeen() {
		return movieSeen;
	}

	public void setMovieSeen(int movieSeen) {
		this.movieSeen = movieSeen;
	}

	@Override
	public String toString() {
		return "Movie [movieNo=" + movieNo + ", movieId=" + movieId + ", title=" + title + ", originalTitle="
				+ originalTitle + ", originalLanguage=" + originalLanguage + ", overview=" + overview + ", genreIds="
				+ genreIds + ", releaseDate=" + releaseDate + ", posterPath=" + posterPath + ", backdropPath="
				+ backdropPath + ", movieLikes=" + movieLikes + ", movieSeen=" + movieSeen + "]";
	}
	
}
