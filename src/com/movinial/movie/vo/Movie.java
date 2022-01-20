package com.movinial.movie.vo;

public class Movie {
	
	// 필드부
	private int movieNo;			//MOVIE_NO	NUMBER
	private String movieNameKr;		//MOVIE_NAME_KR	VARCHAR2(500 BYTE)
	private String movieNameEn;		//MOVIE_NAME_EN	VARCHAR2(500 BYTE)
	private String releaseYear;		//RELEASE_YEAR	VARCHAR2(200 BYTE)
	private String national;		//NATIONAL	VARCHAR2(500 BYTE)
	private String genreName;		//GENRE_NAME	VARCHAR2(500 BYTE)
	private String director;		//DIRECTOR	VARCHAR2(500 BYTE)
	private String company;			//COMPANY	VARCHAR2(500 BYTE)
	private String movieImage;		//MOVIE_IMAGE	VARCHAR2(1000 BYTE)
	private int movieLikes;			//MOVIE_LIKES	NUMBER
	private int movieSeen;			//MOVIE_SEEN	NUMBER
	
	
	// 생성자부
	public Movie() {
		super();
	}

	public Movie(int movieNo, String movieNameKr, String movieNameEn, String releaseYear, String national,
			String genreName, String director, String company, String movieImage, int movieLikes, int movieSeen) {
		super();
		this.movieNo = movieNo;
		this.movieNameKr = movieNameKr;
		this.movieNameEn = movieNameEn;
		this.releaseYear = releaseYear;
		this.national = national;
		this.genreName = genreName;
		this.director = director;
		this.company = company;
		this.movieImage = movieImage;
		this.movieLikes = movieLikes;
		this.movieSeen = movieSeen;
	}

	
	// 메소드부
	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getMovieNameKr() {
		return movieNameKr;
	}

	public void setMovieNameKr(String movieNameKr) {
		this.movieNameKr = movieNameKr;
	}

	public String getMovieNameEn() {
		return movieNameEn;
	}

	public void setMovieNameEn(String movieNameEn) {
		this.movieNameEn = movieNameEn;
	}

	public String getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(String releaseYear) {
		this.releaseYear = releaseYear;
	}

	public String getNational() {
		return national;
	}

	public void setNational(String national) {
		this.national = national;
	}

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getMovieImage() {
		return movieImage;
	}

	public void setMovieImage(String movieImage) {
		this.movieImage = movieImage;
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
		return "Movie [movieNo=" + movieNo + ", movieNameKr=" + movieNameKr + ", movieNameEn=" + movieNameEn
				+ ", releaseYear=" + releaseYear + ", national=" + national + ", genreName=" + genreName + ", director="
				+ director + ", company=" + company + ", movieImage=" + movieImage + ", movieLikes=" + movieLikes
				+ ", movieSeen=" + movieSeen + "]";
	}
	
}
