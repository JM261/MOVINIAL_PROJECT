package com.movinial.member.model.service;

import java.sql.Connection;
import java.sql.ResultSet;

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
	
	public int insertMember(Member m ) {

		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		// 성공헀으면 1, 실패했다면 0으로 리턴이 되었을 것이다.
		if(result > 0) { //성공했다면
			commit(conn);
		} else { // 실패했다면
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}

	public String findId(String memberName, String phone) { // 아아디 찾기

		Connection conn = getConnection();
		
		String memberId = new MemberDao().findId(conn, memberName, phone);
		
		close(conn);
		
		return memberId;
	}
	
	public Member forgotPwd(String memberId, String memberName, String phone) { // 비밀번호 변경 대상 찾기
		
		Connection conn = getConnection();
		
		Member m = new MemberDao().forgotPwd(conn, memberId, memberName, phone);

		close(conn);
		
		System.out.println("서비스단에서의 m" + m);
		
		return m;
	}
	
	public int updateMemberPwd(String updatePwd,String memberId, int memberNo) {	//확인된 회원 비밀번호 변경

		Connection conn = getConnection();

		int result = new MemberDao().updateMemberPwd(conn, updatePwd,memberId,memberNo);

		close(conn);

		
		return result;
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
