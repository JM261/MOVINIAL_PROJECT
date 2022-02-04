package com.movinial.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberNickname;
	private String email;
	private String phone;
	private String memberType;
	private String status;
	private Date enrollDate;
	private Date modifyDate;
	private String preferGenre;
	private String reportReview;
	private String reportCommunity;
	private String reportReply;
	private String profileImage;
	
	// 회원관리(관리자)
	private String mainPageEnrollDate;
	
	

	//기본 생성자
	public Member() {
		super();
	}
	
	// 로그인
	public Member(int memberNo, String memberId, String memberPwd, String memberName, String memberNickname,
			String email, String phone, String memberType, String status, Date enrollDate, Date modifyDate,
			String preferGenre) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.email = email;
		this.phone = phone;
		this.memberType = memberType;
		this.status = status;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.preferGenre = preferGenre;
	}

	//전체 생성자
	public Member(int memberNo, String memberId, String memberPwd, String memberName, String memberNickname,
			String email, String phone, String memberType, String status, Date enrollDate, Date modifyDate,
			String preferGenre, String reportReview, String reportCommunity, String reportReply) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.email = email;
		this.phone = phone;
		this.memberType = memberType;
		this.status = status;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.preferGenre = preferGenre;
		this.reportReview = reportReview;
		this.reportCommunity = reportCommunity;
		this.reportReply = reportReply;
	}
	
	//정인 : 회원가입
	public Member(String memberId, String memberPwd, String memberName, String memberNickname, String email,
			String phone, String preferGenre) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.email = email;
		this.phone = phone;
		this.preferGenre = preferGenre;
	}

	//주현 : 회원정보 수정
	public Member(String memberId, String memberNickname, String email, String phone,
			String preferGenre) {
		super();
		this.memberId = memberId;
		this.memberNickname = memberNickname;
		this.email = email;
		this.phone = phone;
		this.preferGenre = preferGenre;
	}
	
	// 승원 : 회원관리
	public Member(int memberNo, String memberId, String memberPwd, String memberName, String memberNickname,
			String email, String phone, String memberType, String status, Date modifyDate, String preferGenre,
			String mainPageEnrollDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.email = email;
		this.phone = phone;
		this.memberType = memberType;
		this.status = status;
		this.modifyDate = modifyDate;
		this.preferGenre = preferGenre;
		this.mainPageEnrollDate = mainPageEnrollDate;
	}

	public String getMainPageEnrollDate() {
		return mainPageEnrollDate;
	}

	public void setMainPageEnrollDate(String mainPageEnrollDate) {
		this.mainPageEnrollDate = mainPageEnrollDate;
	}
	
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getPreferGenre() {
		return preferGenre;
	}

	public void setPreferGenre(String preferGenre) {
		this.preferGenre = preferGenre;
	}

	public String getReportReview() {
		return reportReview;
	}

	public void setReportReview(String reportReview) {
		this.reportReview = reportReview;
	}

	public String getReportCommunity() {
		return reportCommunity;
	}

	public void setReportCommunity(String reportCommunity) {
		this.reportCommunity = reportCommunity;
	}

	public String getReportReply() {
		return reportReply;
	}

	public void setReportReply(String reportReply) {
		this.reportReply = reportReply;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", memberNickname=" + memberNickname + ", email=" + email + ", phone=" + phone
				+ ", memberType=" + memberType + ", status=" + status + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", preferGenre=" + preferGenre + ", reportReview=" + reportReview + ", reportCommunity="
				+ reportCommunity + ", reportReply=" + reportReply + "]";
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	
}
	

	
	
	
	

	