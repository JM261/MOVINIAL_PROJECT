package com.movinial.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;//NOTICE_NO	NUMBER
	private String noticeWriter; //NOTICE_WRITER	NUMBER
	private String noticeTitle;//NOTICE_TITLE	VARCHAR2(100 BYTE)
	private String noticeContent;//NOTICE_CONTENT	VARCHAR2(4000 BYTE)
	private Date createDate;//CREATE_DATE	DATE
	private String status;//STATUS	VARCHAR2(1 BYTE)
	public Notice() {
		super();
	}
	public Notice(int noticeNo, String noticeWriter, String noticeTitle, String noticeContent, Date createDate,
			String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
		this.status = status;
	}
	
	
	
	
	public Notice(int noticeNo, String noticeWriter, String noticeTitle, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.createDate = createDate;
	}
	public Notice(int noticeNo, String noticeWriter, String noticeTitle, String noticeContent, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeWriter=" + noticeWriter + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", createDate=" + createDate + ", status=" + status + "]";
	}
	

	
}
