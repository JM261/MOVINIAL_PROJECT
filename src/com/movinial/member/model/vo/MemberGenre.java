package com.movinial.member.model.vo;

import java.sql.Date;

public class MemberGenre {
	
	private String genreId;
	private String genreName;
	private String genreMovieId;
	private String genreMovieTitle;
	private String genrePosterPath;
	
	//정인 : 회원가입
	public MemberGenre(String genreId
					 , String genreName
					 , String genreMovieId
					 , String genreMovieTitle
					 , String genrePosterPath) {
		super();
		this.genreId 			= genreId;
		this.genreName	 		= genreName;
		this.genreMovieId 		= genreMovieId;
		this.genreMovieTitle 	= genreMovieTitle;
		this.genrePosterPath 	= genrePosterPath;
	}
	
	//정인 : 회원가입
		public MemberGenre(String genreId
						 , String genreName) {
			super();
			this.genreId 			= genreId;
			this.genreName	 		= genreName;
		}
	
		
	//기본 생성자
	public MemberGenre() {
		super();
	}
	
	public String getGenreId() {
		return genreId;
	}

	public void setGenreId(String genreId) {
		this.genreId = genreId;
	}

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

	public String getGenreMovieId() {
		return genreMovieId;
	}

	public void setGenreMovieId(String genreMovieId) {
		this.genreMovieId = genreMovieId;
	}

	public String getGenreMovieTitle() {
		return genreMovieTitle;
	}

	public void setGenreMovieTitle(String genreMovieTitle) {
		this.genreMovieTitle = genreMovieTitle;
	}

	public String getGenrePosterPath() {
		return genrePosterPath;
	}

	public void setGenrePosterPath(String genrePosterPath) {
		this.genrePosterPath = genrePosterPath;
	}


	@Override
	public String toString() {
		return "MemberGenre [genreId=" + genreId + ", genreName=" + genreName + ", genreMovieId=" + genreMovieId + ", genreMovieTitle="
				+ genreMovieTitle + ", genrePosterPath=" + genrePosterPath + " ]";
	}
	

}
	

	
	
	
	

	