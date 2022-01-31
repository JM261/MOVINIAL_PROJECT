package com.movinial.member.model.vo;

public class LikesReview {
	
	// 필드
	private int memberNo;			// MEMBER_NO	NUMBER
	private String likesReview;		// LIKES_REVIEW	VARCHAR2(4000 BYTE)
	
	// 생성자
	public LikesReview() {
		super();
	}
	
	public LikesReview(int memberNo, String likesReview) {
		super();
		this.memberNo = memberNo;
		this.likesReview = likesReview;
	}
	
	// 메소드
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getLikesReview() {
		return likesReview;
	}

	public void setLikesReview(String likesReview) {
		this.likesReview = likesReview;
	}

	@Override
	public String toString() {
		return "LikesReview [memberNo=" + memberNo + ", likesReview=" + likesReview + "]";
	}
	
}
