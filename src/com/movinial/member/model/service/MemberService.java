package com.movinial.member.model.service;

import java.sql.Connection;

import static com.movinial.common.JDBCTemplate.*;

import com.movinial.common.model.vo.PageInfo;
import java.util.ArrayList;
import com.movinial.member.model.dao.MemberDao;
import com.movinial.member.model.vo.Member;

public class MemberService {
	public Member loginMember(String userId, String userPwd) {
				
		//Service => Connection 객체
		// 1) Connecttion 객체 생성
		
		Connection conn = getConnection();
		
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return m;
		
		
		

		
		
	}

	public int selectMemberCount() { // 전체 멤버 수 구하기
		
		Connection conn = getConnection();
		
		int listCount = new MemberDao().selectMemberCount(conn);
				
		close(conn);
		
		return listCount;
		
	} // selectMemberCount

	
	public ArrayList<Member> selectMember(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectMember(conn, pi);
		
		close(conn);
			
		return list;
		
	}

	public int deleteMember(String str) { // 멤버 삭제
		
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, str);
		
		close(conn);
		
		return result;
		
	} // deleteMember : 멤버 삭제

	public ArrayList<Member> searchMember(String keyword) { // searchMember : 키워드로 검색
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().searchMember(conn, keyword);
		
		close(conn);
		
		return list;
		
	} // searchMember : 키워드로 검색

	
	

}
