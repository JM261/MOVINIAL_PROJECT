package com.movinial.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.movinial.common.JDBCTemplate;
import com.movinial.member.model.vo.Member;

public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String userId, String userPwd) {

		// SELECT문 => ResultSet객체로

		// 변수선언먼저
		Member m = null;

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String sql = prop.getProperty("loginMember");

		// pstmt
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);

			// 쿼리문을 날리기
			// 쿼리문 실행메소드

			rset = pstmt.executeQuery();

			if (rset.next()) {

				m = new Member(rset.getInt("MEMBER_NO"), rset.getString("MEMBER_ID"), rset.getString("MEMBER_PWD"),
						rset.getString("MEMBER_NAME"), rset.getString("NICKNAME"), rset.getString("EMAIL"),
						rset.getString("PHONE"), rset.getString("MEMBER_TYPE"), rset.getString("STATUS"),
						rset.getDate("ENROLL_DATE"), rset.getDate("MODIFY_DATE"), rset.getString("preferGenre"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public int insertMember(Connection conn, Member m) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertMember");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberNickname());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getPreferGenre());
			System.out.println(pstmt);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);

		}

		return result;
	}

	public String findId(Connection conn, String memberName, String phone) {

		String memberId = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("findId");

		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, phone);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				memberId = (String)rset.getString("MEMBER_ID");
				System.out.println(memberId);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return memberId;
	}

}
