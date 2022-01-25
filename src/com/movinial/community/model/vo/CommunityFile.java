package com.movinial.community.model.vo;

import java.sql.Date;

public class CommunityFile {
	
	// 필드부
	private int fileNo;//	FILE_NO	NUMBER
	private int refNo;//	REF_CNO	NUMBER
	private String originName;//	ORIGIN_NAME	VARCHAR2(500 BYTE)
	private String changeName;//	CHANGE_NAME	VARCHAR2(500 BYTE)
	private String filePath;//	FILE_PATH	VARCHAR2(1500 BYTE)
	private Date uploadDate;//	UPLOAD_DATE	DATE
	private Date modifyDate;//	MODIFY_DATE	DATE
	private String status;//	STATUS	VARCHAR2(1 BYTE)
	
	// 생성자부
	public CommunityFile() {
		super();
	}

	public CommunityFile(int fileNo, int refNo, String originName, String changeName, String filePath, Date uploadDate,
			Date modifyDate, String status) {
		super();
		this.fileNo = fileNo;
		this.refNo = refNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}
	// 메소드부
	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
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

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CommunityFile [fileNo=" + fileNo + ", refNo=" + refNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", modifyDate=" + modifyDate
				+ ", status=" + status + "]";
	}

}
