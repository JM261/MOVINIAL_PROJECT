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
	
	//기본 생성자
	public Member() {
		super();
	}
	
	//전체 생성자
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
	
	//주현 : 회원정보 수정
	public Member(String memberId, String memberName, String memberNickname, String email, String phone,
			String preferGenre) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberNickname = memberNickname;
		this.email = email;
		this.phone = phone;
		this.preferGenre = preferGenre;
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

	
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", memberNickname=" + memberNickname + ", email=" + email + ", phone=" + phone
				+ ", memberType=" + memberType + ", status=" + status + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", preferGenre=" + preferGenre + "]";
	}

}
	

	
	
	
	

	