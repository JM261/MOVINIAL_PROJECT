package com.movinial.member.model.service;

import java.sql.Connection;

import com.movinial.common.JDBCTemplate;
import com.movinial.member.model.dao.MemberDao;
import com.movinial.member.model.vo.Member;

public class MemberService {
	public Member loginMember(String userId, String userPwd) {
				
		//Service => Connection 객체
		// 1) Connecttion 객체 생성
		
		Connection conn = JDBCTemplate.getConnection();
		
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		JDBCTemplate.close(conn);
		
		return m;
		
		
		

		
		
	}

}
