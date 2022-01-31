package com.movinial.notice.model.vo;

import java.sql.Date;

public class Question {
	
	private int qnaNo; //QNA_NO	NUMBER
	private String qnaWriter;//QNA_WRITER	NUMBER
	private String qnaTitle; //QNA_TITLE	VARCHAR2(100 BYTE)
	private String qnaContent;//QNA_CONTENT	VARCHAR2(4000 BYTE)
	private String category;//CATEGORY_NO	NUMBER
	private Date createDate;//CREATE_DATE	DATE
	private String orginName;//ORIGIN_NAME	VARCHAR2(100 BYTE)
	private String qnaFilePath; //QNA_FILE_PATH	VARCHAR2(1000 BYTE)
	private String status;//STATUS	VARCHAR2(1 BYTE)
	
	public Question() {
		super();
	}
	
	public Question(int qnaNo, String qnaWriter, String qnaTitle, String qnaContent, String category, Date createDate,
			String orginName, String qnaFilePath, String status) {
		super();
		this.qnaNo = qnaNo;
		this.category = category;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWriter = qnaWriter;
		this.createDate = createDate;
		this.orginName = orginName;
		this.qnaFilePath = qnaFilePath;
		this.status = status;
	}

	public Question(int qnaNo, String category, String qnaTitle, String qnaWriter, Date createDate) {
		super();
		this.qnaNo = qnaNo;
		this.category = category;
		this.qnaWriter = qnaWriter;
		this.qnaTitle = qnaTitle;
		this.qnaWriter = qnaWriter;
		this.createDate = createDate;
		
	}
	
	
	

	public Question(int qnaNo, String category, String qnaTitle, String qnaContent, String qnaWriter, Date createDate) {
		super();
		this.qnaNo = qnaNo;
		this.category = category;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.category = category;
		this.qnaWriter = qnaWriter;
		this.createDate = createDate;
	}

	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getOrginName() {
		return orginName;
	}
	public void setOrginName(String orginName) {
		this.orginName = orginName;
	}
	public String getQnaFilePath() {
		return qnaFilePath;
	}
	public void setQnaFilePath(String qnaFilePath) {
		this.qnaFilePath = qnaFilePath;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Question [qnaNo=" + qnaNo + ", qnaWriter=" + qnaWriter + ", qnaTitle=" + qnaTitle + ", qnaContent="
				+ qnaContent + ", category=" + category + ", createDate=" + createDate + ", orginName=" + orginName
				+ ", qnaFilePath=" + qnaFilePath + ", status=" + status + "]";
	}

	
	
}
