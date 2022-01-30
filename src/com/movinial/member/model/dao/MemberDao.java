package com.movinial.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.movinial.common.JDBCTemplate.*;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.member.model.vo.Member;
import com.movinial.member.model.vo.MemberGenre;

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
			close(rset);
			close(pstmt);
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
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}
	public int insertMemberLikeCommunity(Connection conn, Member m) { 
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertMemberLikeCommunity");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, m.getMemberNo());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}
	public int insertMemberLikeMovie(Connection conn, Member m) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertMemberLikeMovie");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, m.getMemberNo());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}
	public int insertMemberLikeReview(Connection conn, Member m) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertMemberLikeReview");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, m.getMemberNo());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}

	public int selectMemberCount(Connection conn) { // 전체 멤버 수 조회
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("AselectMemberCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;		
		
	} // selectMemberCount : 전체 회원 수(관리자)

	public ArrayList<Member> selectMember(Connection conn, PageInfo pi) {
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("AselectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
						
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Member(rset.getInt("MEMBER_NO"),
								   rset.getString("MEMBER_ID"),
								   rset.getString("MEMBER_PWD"),
								   rset.getString("MEMBER_NAME"),
								   rset.getString("NICKNAME"),
								   rset.getString("EMAIL"),
								   rset.getString("PHONE"),
								   rset.getString("MEMBER_TYPE"),
								   rset.getString("STATUS"),
								   rset.getDate("ENROLL_DATE"),
								   rset.getDate("MODIFY_DATE"),
								   rset.getString("PREFERGENRE")								  
						));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	} // selectMember : 전체 회원 조회(관리자)

	public int deleteMember(Connection conn, String str) { // 멤버 삭제(관리자)
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("AdeleteMember");
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(str));
			
			result = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	} // deleteMember : 멤버 삭제(관리자)
	
	
	
	public Member forgotPwd(Connection conn, String memberId, String memberName, String phone) { // 비밀번호 바꿀 대상찾기
		
		Member m = new Member();
		
		ResultSet rset = null;
		
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("forgotPwd");
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberName);
			pstmt.setString(3, phone);
			
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
			close(pstmt);
		}
			System.out.println("DAO단에서의 m" + m);
			return m;
		}
	
	public int updateMemberPwd(Connection conn, String updatePwd,String memberId, int memberNo) { // 비밀번호 변경
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("updateMemberPwd");
			
			try {
				pstmt= conn.prepareStatement(sql);
				
				pstmt.setString(1, updatePwd);
				pstmt.setString(2, memberId);
				pstmt.setInt(3, memberNo);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
	
	

	public ArrayList<Member> searchMember(Connection conn, String keyword) { // searchMember : 회원 검색(관리자)
		
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("AsearchMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Member m = new Member(rset.getInt("MEMBER_NO")
						  ,rset.getString("MEMBER_ID")
						  ,rset.getString("MEMBER_PWD")
						  ,rset.getString("MEMBER_NAME")
						  ,rset.getString("NICKNAME")
						  ,rset.getString("EMAIL")
						  ,rset.getString("PHONE")
						  ,rset.getString("MEMBER_TYPE")
						  ,rset.getString("STATUS")
						  ,rset.getDate("ENROLL_DATE")
						  ,rset.getDate("MODIFY_DATE")
						  ,rset.getString("PREFERGENRE"));
				
				list.add(m);				
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	} // searchMember : 회원 검색(관리자)
  



	public String findId(Connection conn, String memberName, String phone) {

		String memberId = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("findId");

		try {
			pstmt = conn.prepareStatement(sql);

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
			close(rset);
			close(pstmt);
		}

		return memberId;
	}

	public int idCheck(Connection conn, String checkId) {
		//SELECT => ResultSet => COUNT 함수 이용(숫자 한 개)
				// 변수
				int count = 0;
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				String sql = prop.getProperty("idCheck");
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, checkId);
					rset = pstmt.executeQuery();
					
					if(rset.next()) {
						count = rset.getInt("COUNT(*)");	
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				return count;
	}
	
	
	public ArrayList<MemberGenre> selectGenreList(Connection conn) { // 장르조회
		
		ArrayList<MemberGenre> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectGenreList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				MemberGenre m = new MemberGenre(
						   rset.getString("GENRE_ID")
						  ,rset.getString("GENRE_NAME"));				
				list.add(m);				
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	} // 장르조회
	
public ArrayList<MemberGenre> selectGenreMoiveList(Connection conn) { // 장르별영화조회
		
		ArrayList<MemberGenre> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectGenreMoiveList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				MemberGenre m = new MemberGenre(
						   rset.getString("GENRE_ID")
						  ,rset.getString("GENRE_NAME")
						  ,rset.getString("TITLE")
						  ,rset.getString("MOVIE_ID")
						  ,rset.getString("POSTER_PATH")
						  );				
				list.add(m);				
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	} // 장르별영화조회
  

	




	
}
