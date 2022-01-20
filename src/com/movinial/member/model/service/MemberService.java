package com.movinial.member.model.service;

import java.sql.Connection;

import com.movinial.common.JDBCTemplate;
import com.movinial.member.model.vo.Member;

public class MemberService {
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		
	}

}
