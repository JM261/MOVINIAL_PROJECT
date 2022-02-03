package com.movinial.member.model.vo;

public class LikesCommunity {
	
	// 필드부
	
	private int memberNo; //MEMBER_NO	NUMBER
 	private String likesCommunity; //LIKES_COMMUNITY	VARCHAR2(1000 BYTE)
 	
 	
 	// 생성자부
 	
 	// 기본 생성자
	public LikesCommunity() {
		super();
	}
	
	// 모든 매개변수가 있는 생성자
	public LikesCommunity(int memberNo, String likesCommunity) {
		super();
		this.memberNo = memberNo;
		this.likesCommunity = likesCommunity;
	}
	
	// 메소드부
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getLikesCommunity() {
		return likesCommunity;
	}

	public void setLikesCommunity(String likesCommunity) {
		this.likesCommunity = likesCommunity;
	}

	@Override
	public String toString() {
		return "LikesCommunity [memberNo=" + memberNo + ", likesCommunity=" + likesCommunity + "]";
	}
	
}
