package com.movinial.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {
	
	/**
	 * 매개변수: File 객체
	 * 리턴값: File 객체
	 */
	@Override
	public File rename(File originFile) {
		
		// 원본 파일명 뽑기 => 매개변수로 전달받은 원본파일로부터 getName()
		String originName = originFile.getName(); // "aaa.jpg"
		
		// 파일이 업로드된 시간(년월일시분초) + 5자리 랜덤값(10000 ~ 99999)
		// 확장자: 원본 파일의 확장자 그대로
		
		/*
		 * 원본명				수정명
		 * aaa.jpg -> 2022011239333XXXXX.jpg 형태로 변환
		 * 
		 */
		
		// 1. 파일이 업로드된 시간 추출 => String currentTime;
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 2. 5자리 랜덤값 추출 => int ranNum;
		int ranNum = (int)(Math.random() * 99999) + 10000;
		
		// 3. 확장자 뽑기 => String ext;
		// String의 lastIndexOf(찾고자하는문자열) 메소드 활용
		// 혹여나 파일명 중간에 .이 포함될 걸 대비해서 가장 마지막에 있는 . 기준으로 뽑아낼 것 = Substring
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 1 + 2 + 3 조합해서 수정파일명 변수에 담기
		String changeName = currentTime + ranNum + ext;
		
		// 기존 파일을 수정된 파일명으로 적용시켜서 리턴
		return new File(originFile.getParent(), changeName);
		
	}

}
