package com.movinial.member.model.dao;

import static com.movinial.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.community.model.vo.Community;
import com.movinial.community.model.vo.Reply;
import com.movinial.member.model.vo.Member;
import com.movinial.review.model.vo.ReviewRank;
import com.movinial.member.model.vo.MemberGenre;
import com.movinial.member.model.vo.MyPageFile;
import com.movinial.movie.model.vo.Movie;
import com.movinial.review.model.vo.Review;

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
			return m;
		}
	
		//주현 : 비밀번호 변경
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
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return memberId;
	}

	public ArrayList<ReviewRank> reviewRanking(Connection conn) {

		ArrayList<ReviewRank> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("reviewRanking");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ReviewRank(rset.getString("MEMBER_NAME")
									   ,rset.getInt("COUNT")
									   ,rset.getString("PROFILE_IMAGE")
									   ));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 주현 : 회원탈퇴
	public int deleteMember(Connection conn, String memberId, String memberPwd) {

			int result = 0;
			PreparedStatement pstmt = null;

			String sql = prop.getProperty("deleteMember");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, memberId);
				pstmt.setString(2, memberPwd);

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;

		}

		// 주현 : 아이디 체크
	public int idCheck(Connection conn, String checkId) {

			// select => ResultSet => COUNT 함수 이용(숫자 한개)

			int count = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("idCheck");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, checkId);
				rset = pstmt.executeQuery();

				if (rset.next()) {
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

		// 주현 : 내 글 목록(커뮤니티)
	public ArrayList<Community> selectList(Connection conn, PageInfo pi, int userNo) {

			ArrayList<Community> list = new ArrayList<>();
			// select문 => ResultSet=> 여러행으로 돌아옴 ArrayList에 담자
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("selectList");

			try {
				pstmt = conn.prepareStatement(sql);

				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;

				pstmt.setInt(1, userNo);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

				rset = pstmt.executeQuery();

				while (rset.next()) {
					list.add(new Community(rset.getInt("COMMUNITY_NO"), 
										   rset.getString("COMMUNITY_TITLE"),
										   rset.getString("COMMUNITY_CATEGORY"), 
										   rset.getDate("CREATE_DATE")));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);

			}
			return list;

		}

		// 주현 : 내 글 수
	public int selectListCount(Connection conn, int userNo) {
			// SELECT문을 쓰지만 값은 정수가 필요함(총 게시글의 갯수)
			// 변수
			int listCount = 0;

			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("selectListCount");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, userNo);

				rset = pstmt.executeQuery();

				if (rset.next()) {
					listCount = rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return listCount;

		}

		// 주현 : 내 댓글 목록
	public ArrayList<Reply> selectReplyList(Connection conn, PageInfo pi, int userNo) {

			ArrayList<Reply> list = new ArrayList<>();

			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("selectReplyList");

			try {
				pstmt = conn.prepareStatement(sql);

				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;

				pstmt.setInt(1, userNo);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

				rset = pstmt.executeQuery();

				while (rset.next()) {
					list.add(new Reply( rset.getInt("REPLY_NO"), 
										rset.getInt("REF_CNO"), 
										rset.getString("NICKNAME"),
										rset.getString("REPLY_CONTENT"), 
										rset.getString("CREATE_DATE"),
										rset.getString("COMMUNITY_TITLE")));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}

		// 주현 : 내 댓글 수
	public int selectReplyListCount(Connection conn, int userNo) {

			int listCount = 0;

			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("selectReplyListCount");

			try {

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, userNo);

				rset = pstmt.executeQuery();

				if (rset.next()) {
					listCount = rset.getInt("COUNT");
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return listCount;
		}

		//주현: 리뷰 좋아요 누른 수
		public int selectReviewLikesCount(Connection conn, int memberNo) {

			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("selectReviewLikesCount");

			try {

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, memberNo);

				rset = pstmt.executeQuery();

				if (rset.next()) {
					listCount = rset.getInt("COUNT");
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return listCount;
		}

		//주현 : 좋아요 누른 리뷰 리스트 가져오기(포스터포함)
		public ArrayList<Review> myReviewLikesListView(Connection conn, PageInfo pi, int memberNo) {

			ArrayList<Review> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("myReviewLikesList");

			try {
				pstmt = conn.prepareStatement(sql);

				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;

				pstmt.setInt(1, memberNo);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

				rset = pstmt.executeQuery();

				while (rset.next()) {
					list.add(new Review(rset.getInt("REVIEW_NO"), 
										rset.getString("NICKNAME"), 
										rset.getString("REVIEW_TITLE"),
										rset.getDate("CREATE_DATE"),
										rset.getInt("LIKES"),
										rset.getInt("REF_MNO"),
										rset.getString("REVIEW_CONTENT"),
										rset.getString("POSTER_PATH")));
							}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}

		// 주현 : 내 리뷰 글 수
	public int selectMyReviewCount(Connection conn, int memberNo) {
			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("selectMyReviewCount");

			try {

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, memberNo);

				rset = pstmt.executeQuery();

				if (rset.next()) {
					listCount = rset.getInt("COUNT");
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return listCount;

		}

		// 주현 : 내 리뷰 글
	public ArrayList<Review> selectMyReview(Connection conn, PageInfo pi, int memberNo) {

			ArrayList<Review> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("selectMyReview");

			try {
				pstmt = conn.prepareStatement(sql);

				int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
				int endRow = startRow + pi.getBoardLimit() - 1;

				pstmt.setInt(1, memberNo);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

				rset = pstmt.executeQuery();

				while (rset.next()) {
					list.add(new Review(rset.getInt("REVIEW_NO"), 
										rset.getString("NICKNAME"), 
										rset.getString("REVIEW_TITLE"),
										rset.getDate("CREATE_DATE"),
										rset.getString("POSTER_PATH"),
										rset.getInt("REF_MNO")));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}
	
	// 주현 - 회원정보수정
	public int updateMember(Connection conn, Member m) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateMember");

		try {
				pstmt = conn.prepareStatement(sql);

//				pstmt.setString(1, m.getMemberName());
				pstmt.setString(1, m.getMemberNickname());
				pstmt.setString(2, m.getEmail());
				pstmt.setString(3, m.getPhone());
				pstmt.setString(4, m.getPreferGenre());
				pstmt.setString(5, m.getMemberId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

		}
	
	// 주현 : 회원정보 수정시 기존 정보 불러오기
	public Member selectMember(Connection conn, String memberId) {

			Member m = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;

			String sql = prop.getProperty("selectMember");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, memberId);

				rset = pstmt.executeQuery();

				if (rset.next()) {
					m = new Member( rset.getInt("MEMBER_NO"), 
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
									rset.getString("PREFERGENRE"));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

			return m;
		}
	
	// 주현 : 회원 비밀번호 변경
	public int updatePwdMember(Connection conn, String memberId, String memberPwd, String updatePwd) {

			int result = 0;
			PreparedStatement pstmt = null;

			String sql = prop.getProperty("updatePwdMember");

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, updatePwd);
				pstmt.setString(2, memberPwd);
				pstmt.setString(3, memberId);

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;

		}
	
	//주현 : 커뮤니티 좋아요 누른 수
	public int selectCommunityLikesCount(Connection conn, int memberNo) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectCommunityLikesCount");

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, memberNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt("COUNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
		
	}

		//주현 : 커뮤니티 좋아요 리스트
	public ArrayList<Community> myCommunityLikesList(Connection conn, PageInfo pi, int memberNo) {
		
		ArrayList<Community> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("myCommunityLikesList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Community(rset.getInt("COMMUNITY_NO"), 
									   rset.getString("COMMUNITY_TITLE"),
						     		   rset.getString("COMMUNITY_CATEGORY"),
						     		   rset.getString("NICKNAME"), 
						     		   rset.getInt("LIKES"),
									   rset.getDate("CREATE_DATE")));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		
	}
	
	//주현: 좋아요 영화 수
	public int selectMovieLikesCount(Connection conn, int memberNo) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMovieLikesCount");

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, memberNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt("COUNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;

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
  
	//주현 : 영화 좋아요 리스트
	public ArrayList<Movie> myMovieLikesList(Connection conn, PageInfo pi, int memberNo) {
		
		ArrayList<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("myMovieLikesList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Movie(rset.getInt("MOVIE_NO"), 
								   rset.getString("TITLE"),
								   rset.getString("POSTER_PATH")));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	
	}
	
	//주현 : 봤어요 영화 수
	public int selectMyMovieSeenCount(Connection conn, int memberNo) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMyMovieSeenCount");

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, memberNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt("COUNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;	
	}
	
	//주현 : 봤어요 영화 리스트
	public ArrayList<Movie> myMovieSeenList(Connection conn, PageInfo pi, int memberNo) {
		
		ArrayList<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("myMovieSeenList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;

			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Movie(rset.getInt("MOVIE_NO"), 
								   rset.getString("TITLE"),
								   rset.getString("POSTER_PATH")));
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	//주현: 프로필 이미지 수정
	public int updateProfileImage(Connection conn, MyPageFile mpf) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateProfileImage");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, mpf.getFilePath() + mpf.getChangeName());
			pstmt.setInt(2, mpf.getRefNo());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}
	//주현: 프로필이미지
	public String getProfileImage(Connection conn, int memberNo) {
		
		String profileImage = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getProfileImage");

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, memberNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				profileImage = rset.getString("PROFILE_IMAGE");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return profileImage;
	}

	//주현 : 마이페이지 리뷰쓰기 - 봤어요 영화 검색
	public ArrayList<Movie> searchSeenMovie(Connection conn, int memberNo) {
		
		// 영화 조회
		ArrayList<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchSeenMovie");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Movie m = new Movie(
							rset.getInt("MOVIE_NO"),
							rset.getInt("MOVIE_ID"),
							rset.getString("TITLE"),
							rset.getString("ORIGINAL_TITLE"),
							rset.getString("ORIGINAL_LANGUAGE"),
							rset.getString("OVERVIEW"),
							rset.getString("GENRE_IDS"),
							rset.getDate("RELEASE_DATE"),
							rset.getString("POSTER_PATH"),
							rset.getString("BACKDROP_PATH"),
							rset.getInt("MOVIE_LIKES"),
							rset.getInt("MOVIE_SEEN")
							);
				list.add(m);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	} 
	
	//주현 : 닉네임 중복확인
	public int nicknameCheck(Connection conn, String nicknameUp) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("nicknameCheck"); 
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nicknameUp);
			
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
}