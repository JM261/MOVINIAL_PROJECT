package com.movinial.notice.model.vo;

import java.sql.Date;

public class Answer {
	private int answerNo;//ANSWER_NO	NUMBER
	private int refQno;//REF_QNO	NUMBER
	private String answerWriter;//ANSWER_WRITER	NUMBER
	private String answerContent;//ANSWER_CONTENT	VARCHAR2(2000 BYTE)
	private Date createDate;//CREATE_DATE	DATE
	private String status;//STATUS	VARCHAR2(1 BYTE)
	public Answer() {
		super();
	}
	public Answer(int answerNo, int refQno, String  answerWriter, String answerContent, Date createDate, String status) {
		super();
		this.answerNo = answerNo;
		this.refQno = refQno;
		this.answerWriter = answerWriter;
		this.answerContent = answerContent;
		this.createDate = createDate;
		this.status = status;
	}
	
	public Answer(int answerNo, String answerContent, Date createDate) {
		super();
		this.answerNo = answerNo;
		this.answerContent = answerContent;
		this.createDate = createDate;
	}
	
	
	public Answer(int answerNo, String answerWriter, String answerContent, Date createDate) {
		super();
		this.answerNo = answerNo;
		this.answerWriter = answerWriter;
		this.answerContent = answerContent;
		this.createDate = createDate;
	}
	public int getAnswerNo() {
		return answerNo;
	}
	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}
	public int getRefQno() {
		return refQno;
	}
	public void setRefQno(int refQno) {
		this.refQno = refQno;
	}
	public String  getAnswerWriter() {
		return answerWriter;
	}
	public void setAnswerWriter(String  answerWriter) {
		this.answerWriter = answerWriter;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
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
		return "Answer [answerNo=" + answerNo + ", refQno=" + refQno + ", answerWriter=" + answerWriter
				+ ", answerContent=" + answerContent + ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
	
	

}
