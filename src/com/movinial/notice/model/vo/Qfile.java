package com.movinial.notice.model.vo;

import java.sql.Date;

public class Qfile {
	
	private int fileNo; //FILE_NO	NUMBER
	private int refQno; //REF_QNO	NUMBER
	private String originName;//ORIGIN_NAME	VARCHAR2(500 BYTE)
	private String changeName;//CHANGE_NAME	VARCHAR2(500 BYTE)
	private String filePath;//FILE_PATH	VARCHAR2(1500 BYTE)
	private Date uploadDate;//UPLOAD_DATE	DATE
	private String status;//STATUS	VARCHAR2(1 BYTE)
	public Qfile() {
		super();
	}
	public Qfile(int fileNo, int refQno, String originName, String changeName, String filePath, Date uploadDate,
			String status) {
		super();
		this.fileNo = fileNo;
		this.refQno = refQno;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getRefQno() {
		return refQno;
	}
	public void setRefQno(int refQno) {
		this.refQno = refQno;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Qfile [fileNo=" + fileNo + ", refQno=" + refQno + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status=" + status + "]";
	}
	
	
	
}
