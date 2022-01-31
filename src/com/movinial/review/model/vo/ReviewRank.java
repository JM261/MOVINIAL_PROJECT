package com.movinial.review.model.vo;

public class ReviewRank {
	// mainPage에 lank용
	// 필드
	private String memberName;
	private int count;
	private String profileImage;
	
	// 생성자
	public ReviewRank() {
		super();
	}
	public ReviewRank(String memberName, int count, String profileImage) {
		super();
		this.memberName = memberName;
		this.count = count;
		this.profileImage = profileImage;
	}
	
	// g/s
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	
	
	
}
