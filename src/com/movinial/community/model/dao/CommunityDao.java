package com.movinial.community.model.dao;

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
import com.movinial.community.model.vo.CommunityFile;
import com.movinial.community.model.vo.Reply;
import com.movinial.member.model.vo.LikesCommunity;
import com.movinial.member.model.vo.Member;

import static com.movinial.common.JDBCTemplate.*;

public class CommunityDao {
	
	private Properties prop = new Properties();
	
	public CommunityDao() { // 기본생성자 이용하여 SQL 쿼리문 별도로 관리
		
		String fileName = CommunityDao.class.getResource("/sql/community/community-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn) { // 커뮤니티 전체 글 수 구하기

		// SELECT문 결과 ResultSet이나 , 목적이 게시글 개수 얻기 이므로 정수형 변수에 저장

		// 필요한 변수 셋팅
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 쿼리문 prop 객체 이용해서 쿼리문 모아둔 파일에서 키:밸류 형식으로 불러오기
		String sql = prop.getProperty("selectListCount"); // sql COUNT 함수 이용
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery(); // 쿼리문 보내고 결과값 변수에 담기
			
			if(rset.next()) { // 결과값 하나, 반복문 필요 X
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 다쓴 JDBC용 객체 생성한 역순으로 자원 반납
			close(rset); 
			close(pstmt);
		}
		return listCount; // 결과값(글 개수) 정수형 변수에 담아서 반환
	}

	public int selectListFilterCount(Connection conn, String communityCategory) { // 커뮤니티 카테고리별  글 개수 구하기

		// SELECT문 결과 ResultSet이나 , 목적이 게시글 개수 얻기 이므로 정수형 변수에 저장

		// 필요한 변수 셋팅
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListFilterCount"); // 전체 글 수 조회 쿼리문과 동일하며 조건만 추가 (카테고리 값)
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// PreparedStatement 이용한 미완성 쿼리문 위치홀더 값 채워주기 (Service단에서 넘겨 받은 카테고리 값)
			pstmt.setString(1, communityCategory); 
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount; // 결과값(글 개수) 정수형 변수에 담아서 반환
	}

	public int selectListSearchCount(Connection conn, String searchType, String keyword) { // 커뮤니티 검색결과별 글 개수 구하기
		
		// SELECT문 결과 ResultSet이나 , 목적이 게시글 개수 얻기 이므로 정수형 변수에 저장
		
		// 필요한 변수 셋팅
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = ""; // 쿼리문 담을 변수 선언 및 빈 문자열로 초기화
		
		// Service 단에서 넘겨받은 검색타입에 따른 쿼리문 선택을 위한 제어문(조건문) 사용
		switch(searchType) {
			case "titleNcontent" : sql = prop.getProperty("selectListSearchTitleNcontentCount"); break;
			case "title" : sql = prop.getProperty("selectListSearchTitleCount"); break;
			case "content" : sql = prop.getProperty("selectListSearchContentCount"); break;
			case "writer" : sql = prop.getProperty("selectListSearchWriterCount"); break;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			// 검색타입에 따른 위치홀더 값 채우기 위한 조건문 사용
			if(searchType.equals("titleNcontent")) {
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
			} else {
				pstmt.setString(1, "%" + keyword + "%");
			}
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount; // 결과값(글 개수) 정수형 변수에 담아서 반환
	}	
	
	public ArrayList<Community> selectList(Connection conn, PageInfo pi) { // 커뮤니티 글 전체 리스트 조회
		
		// 필요한 변수 셋팅
		ArrayList<Community> list = new ArrayList<>(); // 조회하는 커뮤니티 글 리스트 -> 0개 또는 여러개 ArrayList 이용
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList"); // FROM절에 서브쿼리(인라인뷰) 이용
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 글 리스트 페이징 처리 위한 시작페이지, 끝페이지 셋팅
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1 ;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Community(rset.getInt("COMMUNITY_NO"),
										rset.getString("COMMUNITY_TITLE"),
										rset.getString("COMMUNITY_CATEGORY"),
										rset.getString("NICKNAME"),
										rset.getInt("VIEWS"),
										rset.getInt("LIKES"),
										rset.getDate("CREATE_DATE"),
										rset.getString("SPOILER"),
										rset.getInt("REPORT_COUNT"),
										rset.getInt("REPLY_COUNT")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list; // 글 리스트(0개 또는 여러개) 반환
	}
	
	public ArrayList<Community> selectListFilter(Connection conn, PageInfo pi, String communityCategory) { // 커뮤니티 카테고리별 글 리스트 조회
		
		// 필요한 변수 셋팅
		ArrayList<Community> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListFilter"); // 글 천제 리스트 구하는 쿼리문에서 조건추가 (카테고리값에 따라)
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 글 리스트 페이징 처리 위한 시작페이지, 끝페이지 셋팅
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1 ;
			
			pstmt.setString(1, communityCategory);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Community(rset.getInt("COMMUNITY_NO"),
						rset.getString("COMMUNITY_TITLE"),
						rset.getString("COMMUNITY_CATEGORY"),
						rset.getString("NICKNAME"),
						rset.getInt("VIEWS"),
						rset.getInt("LIKES"),
						rset.getDate("CREATE_DATE"),
						rset.getString("SPOILER"),
						rset.getInt("REPORT_COUNT"),
						rset.getInt("REPLY_COUNT")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list; // 카테고리별 글 리스트(0개 또는 여러개) 반환
	}

	public ArrayList<Community> selectListSearch(Connection conn, PageInfo pi, String searchType, String keyword) {
		// 커뮤니티 검색결과별 글 개수 구하기
		
		// 필요한 변수 셋팅
		ArrayList<Community> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = ""; // 쿼리문 담을 변수 선언 및 빈 문자열로 초기화
		
		// Service 단에서 넘겨받은 검색타입에 따른 쿼리문 선택을 위한 제어문(조건문) 사용
		switch(searchType) {
			case "titleNcontent" : sql = prop.getProperty("selectListSearchTitleNcontent"); break;
			case "title" : sql = prop.getProperty("selectListSearchTitle"); break;
			case "content" : sql = prop.getProperty("selectListSearchContent"); break;
			case "writer" : sql = prop.getProperty("selectListSearchWriter"); break;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			// 글 리스트 페이징 처리 위한 시작페이지, 끝페이지 셋팅
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1 ;
			
			// 검색타입에 따른 위치홀더 값 채우기 위한 조건문 사용
			if(searchType.equals("titleNcontent")) {
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setString(2, "%" + keyword + "%");
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			} else {
				pstmt.setString(1, "%" + keyword + "%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Community(rset.getInt("COMMUNITY_NO"),
										rset.getString("COMMUNITY_TITLE"),
										rset.getString("COMMUNITY_CATEGORY"),
										rset.getString("NICKNAME"),
										rset.getInt("VIEWS"),
										rset.getInt("LIKES"),
										rset.getDate("CREATE_DATE"),
										rset.getString("SPOILER"),
										rset.getInt("REPORT_COUNT"),
										rset.getInt("REPLY_COUNT")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list; // 검색결과별 글 리스트(0개 또는 여러개) 반환
	}

	public int increaseView(Connection conn, int communityNo) { // 커뮤니티 글 조회수 증가

		//필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseView"); // 조회수 컬럼 숫자값 쿼리문 실행시 누적으로 1씩 증가
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, communityNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public Community selectCommunity(Connection conn, int communityNo) { // 커뮤니티 글 상세보기
		
		// 필요한 변수 셋팅
		Community c = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, communityNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				c = new Community(rset.getInt("COMMUNITY_NO"),
							rset.getString("COMMUNITY_TITLE"),
							rset.getString("COMMUNITY_CATEGORY"),
							rset.getString("NICKNAME"),
							rset.getString("COMMUNITY_CONTENT"),
							rset.getInt("VIEWS"),
							rset.getInt("LIKES"),
							rset.getDate("CREATE_DATE"),
							rset.getString("SPOILER"),
							rset.getInt("REPORT_COUNT"),
							rset.getInt("ISNOTICE"),
							rset.getInt("COMMUNITY_WRITER"),
							rset.getInt("REPLY_COUNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return c; // 요청한 글 상세내용 담은 객체 반환
	}

	public CommunityFile selectCommunityFile(Connection conn, int communityNo) { // 커뮤니티 글 첨부파일 조회
		
		// 필요한 변수 셋팅
		CommunityFile cf = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommunityFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, communityNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cf = new CommunityFile();
				
				cf.setFileNo(rset.getInt("FILE_NO"));
				cf.setOriginName(rset.getString("ORIGIN_NAME"));
				cf.setChangeName(rset.getString("CHANGE_NAME"));
				cf.setFilePath(rset.getString("FILE_PATH"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cf; // 요청한 글 첨부파일 내용 담은 객체 반환
	}

	public ArrayList<Reply> selectReplyList(Connection conn, int communityNo) { // 댓글 리스트 조회
		
		// 필요한 변수 셋팅
		ArrayList<Reply> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, communityNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Reply r = new Reply();
				
					r.setReplyNo(rset.getInt("REPLY_NO"));
					r.setReplyWriter(rset.getString("NICKNAME"));
					r.setReplyContent(rset.getString("REPLY_CONTENT"));
					r.setCreateDate(rset.getString("CREATE_DATE"));
					r.setModifyDate(rset.getString("MODIFY_DATE"));
					r.setReportCount(rset.getInt("REPORT_COUNT"));
					r.setMemberNo(rset.getInt("MEMBER_NO"));
				
				if(r.getModifyDate() != null) {
					r.setCreateDate(r.getModifyDate());
				}
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list; // 댓글 리스트(0개 또는 여러개) 반환
	}

	public int insertReply(Connection conn, Reply r) { // 댓글 달기
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getRefCno());
			pstmt.setInt(2, Integer.parseInt(r.getReplyWriter()));
			pstmt.setString(3, r.getReplyContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 댓글달기 결과값 반환 -> 처리된 행의 갯수 1(성공) 또는 0(실패)
	}

	public int insertCommunity(Connection conn, Community c) { // 커뮤니티 글 등록
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getCommunityTitle());
			pstmt.setString(2, c.getCommunityCategory());
			pstmt.setInt(3, Integer.parseInt(c.getCommunityWriter()));
			pstmt.setString(4, c.getCommounityContent());
			pstmt.setString(5, c.getSpoiler());
			pstmt.setInt(6, c.getIsNotice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int insertCommunityFile(Connection conn, CommunityFile cf) { // 커뮤니티 글 등록시 첨부파일 등록
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCommunityFile");	
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cf.getOriginName());
			pstmt.setString(2, cf.getChangeName());
			pstmt.setString(3, cf.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int updateCommunity(Connection conn, Community c) { // 커뮤니티 글 수정
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getCommunityCategory());
			pstmt.setString(2, c.getCommunityTitle());
			pstmt.setString(3, c.getCommounityContent());
			pstmt.setString(4, c.getSpoiler());
			pstmt.setInt(5, c.getCommunityNo());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int updateCommunityFile(Connection conn, CommunityFile cf) { // 글 첨부파일 수정 (기존에 첨부파일이 있었을 경우)
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCommunityFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cf.getOriginName());
			pstmt.setString(2, cf.getChangeName());
			pstmt.setString(3, cf.getFilePath());
			pstmt.setInt(4, cf.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int insertNewCommunityFile(Connection conn, CommunityFile cf) { // 글 첨부파일 수정 (기존에 첨부파일이 없었을 경우)
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNewCommunityFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cf.getRefNo());
			pstmt.setString(2, cf.getOriginName());
			pstmt.setString(3, cf.getChangeName());
			pstmt.setString(4, cf.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int deleteCommunity(Connection conn, int communityNo) { // 커뮤니티 글 삭제
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, communityNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int increaseLike(Connection conn, int communityNo) { // 커뮤니티 글 좋아요 수 증가
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, communityNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int communityLikesStore(Connection conn, int memberNo, int communityNo) {
		// 커뮤니티 글 상세페이지에서 좋아요 누른 글번호, 글 좋아요 테이블에 저장

		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("communityLikesStore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "," + String.valueOf(communityNo));
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public LikesCommunity selectCommunityLikes(Connection conn, int memberNo) { // 커뮤니티 글 좋아요 테이블, 회원번호로 조회
		
		// 필요한 변수 셋팅
		LikesCommunity lc = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommunityLikes");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				lc = new LikesCommunity();
				lc.setLikesCommunity(rset.getString("LIKES_COMMUNITY"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		return lc; // 요청한 글 첨부파일 내용 담은 객체 반환
	}

	public int decreaseLike(Connection conn, int communityNo) { // 커뮤니티 글 좋아요 수 감소 (좋아요 취소)

		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("decreaseLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, communityNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int communityLikesRemove(Connection conn, int memberNo, int communityNo) {
		// 커뮤니티 글 좋아요 누른 글번호, 글 좋아요 테이블에서 제거
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("communityLikesRemove");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "," + String.valueOf(communityNo));
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int reportCommunity(Connection conn, int communityNo) { // 커뮤니티 글 신고
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("reportCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, communityNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int communityReportStore(Connection conn, int memberNo, int communityNo) {
		// 커뮤니티 글 상세페이지에서 신고한 글번호, 회원 테이블의 신고한 글 컬럼에 저장
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("communityReportStore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "," + String.valueOf(communityNo));
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public Member selectCommunityReport(Connection conn, int memberNo) { // 회원번호로 회원 테이블의 신고한 글 컬럼 조회
		
		// 필요한 변수 셋팅
		Member m = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCommunityReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member();
				m.setReportCommunity(rset.getString("REPORT_COMMUNITY"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		return m; // 요청한 회원번호의 조회된 신고한 글 컬럼 반환
	}

	public Reply selectReply(Connection conn, int replyNo) { // 수정할 댓글 조회
		
		// 필요한 변수 셋팅
		Reply r = null;

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, replyNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				r = new Reply(rset.getInt("REPLY_NO"),
						rset.getString("NICKNAME"),
						rset.getString("REPLY_CONTENT"),
						rset.getString("CREATE_DATE"),
						rset.getString("MODIFY_DATE"),
						rset.getInt("REPORT_COUNT"),
						rset.getInt("MEMBER_NO"));
				
				if(r.getModifyDate() != null) {
					r.setCreateDate(r.getModifyDate());
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r; // 댓글번호로 조회된 댓글내용 담은 객체 반환
	}

	public int updateReply(Connection conn, int replyNo, String replyContent) { // 댓글 내용 수정
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, replyContent);
			pstmt.setInt(2, replyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int deleteReply(Connection conn, int replyNo) { // 댓글 삭제 (상태 비노출로)
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public ArrayList<Reply> selectReplyOfReplyList(Connection conn, int replyNo) { // 대댓글 리스트 조회
		
		// 필요한 변수 셋팅
		ArrayList<Reply> list = new ArrayList<>(); // 조회 결과값이 0개 또는 여러개 => ArrayList 사용

		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRereplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, replyNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Reply r = new Reply();
				
					r.setReplyNo(rset.getInt("REPLY_NO"));
					r.setReplyWriter(rset.getString("NICKNAME"));
					r.setReplyContent(rset.getString("REPLY_CONTENT"));
					r.setCreateDate(rset.getString("CREATE_DATE"));
					r.setModifyDate(rset.getString("MODIFY_DATE"));
					r.setReportCount(rset.getInt("REPORT_COUNT"));
					r.setMemberNo(rset.getInt("MEMBER_NO"));
				
				if(r.getModifyDate() != null) {
					r.setCreateDate(r.getModifyDate());
				}
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list; // 대댓글 리스트(0개 또는 여러개) 반환
	}

	public int insertReplyOfReply(Connection conn, Reply r) { // 대댓글 등록
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReplyOfReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getRefCno());
			pstmt.setInt(2, Integer.parseInt(r.getReplyWriter()));
			pstmt.setString(3, r.getReplyContent());
			pstmt.setInt(4, r.getIsReply());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public Member selectReplyReport(Connection conn, int memberNo) { // 회원번호로 회원 테이블의 신고한 댓글 컬럼 조회
		
		// 필요한 변수 셋팅
		Member m = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReplyReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				m = new Member();
				m.setReportReply(rset.getString("REPORT_REPLY"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		return m; // 요청한 회원번호의  신고한 댓글 내용 담은 객체 반환
	}

	public int reportReply(Connection conn, int replyNo) { // 댓글 신고

		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("reportReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int replyReportStore(Connection conn, int memberNo, int replyNo) { // 신고한 댓글번호, 회원 테이블의 신고한 글 컬럼에 저장
		
		// 필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("replyReportStore");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "," + String.valueOf(replyNo));
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int increaseReplyCount(Connection conn, int communityNo) { // 댓글작성 완료시 , 댓글 개수 증가

		//필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseReplyCount"); // 댓글 개수 컬럼 값 쿼리문 실행시  1씩 증가
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, communityNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public int decreaseReplyCount(Connection conn, int communityNo) { // 댓글삭제 완료시 , 댓글 개수 감소

		//필요한 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("decreaseReplyCount"); // 댓글 개수 컬럼 값 쿼리문 실행시  1씩 감소
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, communityNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result; // 처리된 행의 개수 반환
	}

	public ArrayList<Community> mainPageCommunity(Connection conn) { // 메인 페이지에 띄워줄 커뮤니티 글

		ArrayList<Community> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("mainPageCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Community(rset.getInt("COMMUNITY_NO")
									  ,rset.getString("COMMUNITY_TITLE")
									  ,rset.getString("COMMUNITY_CATEGORY")
									  ,rset.getString("MEMBER_NAME")
									  ,rset.getInt("VIEWS")
									  ,rset.getInt("LIKES")
									  ,rset.getDate("CREATE_DATE")
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
	} // 메인 페이지에 띄워줄 커뮤니티 글


}
