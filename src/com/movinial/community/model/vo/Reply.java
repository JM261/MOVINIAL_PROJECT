package com.movinial.community.model.vo;

public class Reply {// 커뮤니티 게시글 댓글
	
	// 필드부
	private int replyNo;//REPLY_NO	NUMBER
	private int refCno;//REF_CNO	NUMBER
	private String replyWriter;//REPLY_WRITER	NUMBER
	private String replyContent;//REPLY_CONTENT	VARCHAR2(1000 BYTE)
	private String createDate;//CREATE_DATE	DATE
	private String modifyDate;//MODIFY_DATE	DATE
	private int reportCount;//REPORT_COUNT	NUMBER
	private String status;//STATUS	VARCHAR2(1 BYTE)
	private String replyTitle; // 주현님 요청 마이페이지에 필요 *
	private int memberNo; // 댓글 작성자 확인용
	private int isReply; // 대댓글 여부 및 원 댓글번호 저장 목적  0 == 대댓글 X ,  0 != 대댓글 O
	
	// 생성자부
	
	// 기본 생성자
	public Reply() {
		super();
	}
	// 댓글등록 용도 생성자
	public Reply(int refCno, String replyWriter, String replyContent) {
		super();
		this.refCno = refCno;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
	}
	// 대댓글등록 용도 생성자
	public Reply(int refCno, String replyWriter, String replyContent, int isReply) {
		super();
		this.refCno = refCno;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.isReply = isReply;
	}
	// 주현님 요청 마이페이지 내 댓글 불러오기 용도 생성자
	public Reply(int replyNo, int refCno, String replyWriter, String replyContent, String createDate, String replyTitle) {
		super();
		this.replyNo = replyNo;
		this.refCno = refCno;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.replyTitle = replyTitle;
	}
	// 댓글조회 용도 생성자
	public Reply(int replyNo, String replyWriter, String replyContent, String createDate, String modifyDate, int reportCount, int memberNo) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.reportCount = reportCount;
		this.memberNo = memberNo;
	}
	// 모든 매개변수가 있는 생성자
	public Reply(int replyNo, int refCno, String replyWriter, String replyContent, String createDate, String modifyDate,
			int reportCount, String status, String replyTitle, int memberNo, int isReply) {
		super();
		this.replyNo = replyNo;
		this.refCno = refCno;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.reportCount = reportCount;
		this.status = status;
		this.replyTitle = replyTitle;
		this.memberNo = memberNo;
		this.isReply = isReply;
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

	public String getReplyTitle() {
		return replyTitle;
	}

	public void setReplyTitle(String replyTitle) {
		this.replyTitle = replyTitle;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getIsReply() {
		return isReply;
	}

	public void setIsReply(int isReply) {
		this.isReply = isReply;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", refCno=" + refCno + ", replyWriter=" + replyWriter + ", replyContent="
				+ replyContent + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", reportCount="
				+ reportCount + ", status=" + status + ", replyTitle=" + replyTitle + ", memberNo=" + memberNo
				+ ", isReply=" + isReply + "]";
	}
}
