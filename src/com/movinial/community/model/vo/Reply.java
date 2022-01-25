package com.movinial.community.model.vo;

public class Reply {
	// 필드부
	private int replyNo;//REPLY_NO	NUMBER
	private int refCno;//REF_CNO	NUMBER
	private String replyWriter;//REPLY_WRITER	NUMBER
	private String replyContent;//REPLY_CONTENT	VARCHAR2(1000 BYTE)
	private String createDate;//CREATE_DATE	DATE
	private String modifyDate;//MODIFY_DATE	DATE
	private int reportCount;//REPORT_COUNT	NUMBER
	private String status;//STATUS	VARCHAR2(1 BYTE)
	
	// 생성자부
	public Reply() {
		super();
	}
	
	// 댓글 작성용도
	public Reply(int refCno, String replyWriter, String replyContent) {
		super();
		this.refCno = refCno;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
	}

	public Reply(int replyNo, String replyWriter, String replyContent, String createDate, int reportCount) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.reportCount = reportCount;
	}

	public Reply(int replyNo, int refCno, String replyWriter, String replyContent, String createDate, String modifyDate,
			int reportCount, String status) {
		super();
		this.replyNo = replyNo;
		this.refCno = refCno;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.reportCount = reportCount;
		this.status = status;
	}
	
	// 메소드부
	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getRefCno() {
		return refCno;
	}

	public void setRefCno(int refCno) {
		this.refCno = refCno;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
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
		return "Reply [replyNo=" + replyNo + ", refCno=" + refCno + ", replyWriter=" + replyWriter + ", replyContent="
				+ replyContent + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", reportCount="
				+ reportCount + ", status=" + status + "]";
	}
	
}
