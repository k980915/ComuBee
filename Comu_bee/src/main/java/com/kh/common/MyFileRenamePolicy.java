package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	// 파일명 변경처리 객체
	@Override
	public File rename(File origin) {
		// 원본 파일명 추출
		String originName = origin.getName();
		// 원본파일명 : hello.txt / 사진.jpg / 미니.png
		// -> 확장자를 추출하기 위함
		// 현재시간 + 랜덤 수 + 확장자
		// 1. 업로드 시간 추출 202404231209
		String time = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 2. 5자리 랜덤값 추출
		int ranNum = (int)(Math.random()*90000)+10000;
		
		// 3. 원본파일명에서 확장자 추출
		// 확장자는 파일명의 뒤에서부터 첫 .을 기준으로 뒤의 문자열
		// 마지막 .을 찾아 subString으로 잘라내기
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 변경할 이름 하나로 합치기
		String changeName = time+ranNum+ext;
		
		// 원본파일이 있던 곳에 새로운 이름으로 파일객체를 만들어 전달해야하므로 원본파일의 원래 위치 추출
		// 원본파일 원래 위치 추출 : 파일객체.getParent()
		return new File(origin.getParent(),changeName);
	}
	
	
	
	
	
}
