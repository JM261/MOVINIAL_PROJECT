package com.movinial.curation.model.vo;

public class CurationList {

	// 필드
	private int listNo;
	private String listName;
	private String listMovieId;
	private String status;
	private String posterPath;
	
	
	public CurationList() {
		super();
	}	
	
	

	public CurationList(String listName, String listMovieId, String posterPath) {
		super();
		this.listName = listName;
		this.listMovieId = listMovieId;
		this.posterPath = posterPath;
	}



	public CurationList(int listNo, String listName, String listMovieId, String status) {
		super();
		this.listNo = listNo;
		this.listName = listName;
		this.listMovieId = listMovieId;
		this.status = status;
	}
	

	public CurationList(int listNo, String listName, String listMovieId, String status, String posterPath) {
		super();
		this.listNo = listNo;
		this.listName = listName;
		this.listMovieId = listMovieId;
		this.status = status;
		this.posterPath = posterPath;
	}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public String getListName() {
		return listName;
	}

	public void setListName(String listName) {
		this.listName = listName;
	}

	public String getListMovieId() {
		return listMovieId;
	}

	public void setListMovieId(String listMovieId) {
		this.listMovieId = listMovieId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPosterPath() {
		return posterPath;
	}

	public void setPosterPath(String posterPath) {
		this.posterPath = posterPath;
	}

	
	
}
