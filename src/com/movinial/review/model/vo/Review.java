package com.movinial.review.model.vo;

import java.sql.Date;

public class Review {
	
	// 필드부
	private int reviewNo;			// REVIEW_NO	NUMBER
	private int reviewWriter;		// REVIEW_WRITER	NUMBER
	private String reviewTitle;		// REVIEW_TITLE	VARCHAR2(400 BYTE)
	private String reviewContent;	// REVIEW_CONTENT	VARCHAR2(4000 BYTE)
	private Date createDate;		// CREATE_DATE	DATE
	private Date modifyDate;		// MODIFY_DATE	DATE
	private String publicStatus;	// PUBLIC_STATUS	VARCHAR2(1 BYTE)
	private int likes;				// LIKES	NUMBER
	private int reportCount;		// REPORT_COUNT	NUMBER
	private String status;			// STATUS	VARCHAR2(1 BYTE)
	
	// 생성자부
	public Review() {
		super();
	}

	public Review(int reviewNo, int reviewWriter, String reviewTitle, String reviewContent, Date createDate,
			Date modifyDate, String publicStatus, int likes, int reportCount, String status) {
		super();
		this.reviewNo = reviewNo;
		this.reviewWriter = reviewWriter;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.publicStatus = publicStatus;
		this.likes = likes;
		this.reportCount = reportCount;
		this.status = status;
	}
	
	// 메소드부
	public int getReviewNo() {
		return reviewNo;
	}
	
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	
	public int getReviewWriter() {
		return reviewWriter;
	}
	
	public void setReviewWriter(int reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	
	public String getReviewTitle() {
		return reviewTitle;
	}
	
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	
	public String getReviewContent() {
		return reviewContent;
	}
	
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public Date getModifyDate() {
		return modifyDate;
	}
	
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	public String getPublicStatus() {
		return publicStatus;
	}
	
	public void setPublicStatus(String publicStatus) {
		this.publicStatus = publicStatus;
	}
	
	public int getLikes() {
		return likes;
	}
	
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	public int getReportCount() {
		return reportCount;
	}
	
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewWriter=" + reviewWriter + ", reviewTitle=" + reviewTitle
				+ ", reviewContent=" + reviewContent + ", createDate=" + createDate + ", modifyDate=" + modifyDate
				+ ", publicStatus=" + publicStatus + ", likes=" + likes + ", reportCount=" + reportCount + ", status="
				+ status + "]";
	}
	
}
