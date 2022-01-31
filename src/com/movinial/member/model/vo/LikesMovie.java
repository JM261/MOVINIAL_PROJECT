package com.movinial.member.model.vo;

public class LikesMovie {
	
	// 필드
	private int memberNo;		// MEMBER_NO	NUMBER
	private String likesMovie;	// LIKES_MOVIE	VARCHAR2(4000 BYTE)
	private String seenMovie;	// SEEN_MOVIE	VARCHAR2(4000 BYTE)
	
	// 생성자
	public LikesMovie() {
		super();
	}
	
	public LikesMovie(int memberNo, String likesMovie, String seenMovie) {
		super();
		this.memberNo = memberNo;
		this.likesMovie = likesMovie;
		this.seenMovie = seenMovie;
	}

	// 메소드
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getLikesMovie() {
		return likesMovie;
	}

	public void setLikesMovie(String likesMovie) {
		this.likesMovie = likesMovie;
	}

	public String getSeenMovie() {
		return seenMovie;
	}

	public void setSeenMovie(String seenMovie) {
		this.seenMovie = seenMovie;
	}

	@Override
	public String toString() {
		return "LikesMovie [memberNo=" + memberNo + ", likesMovie=" + likesMovie + ", seenMovie=" + seenMovie + "]";
	}
	
}
