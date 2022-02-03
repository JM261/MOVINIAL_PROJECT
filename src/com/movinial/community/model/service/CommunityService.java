package com.movinial.community.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.movinial.common.JDBCTemplate.*;
import com.movinial.common.model.vo.PageInfo;
import com.movinial.community.model.dao.CommunityDao;
import com.movinial.community.model.vo.Community;
import com.movinial.community.model.vo.CommunityFile;
import com.movinial.community.model.vo.Reply;
import com.movinial.member.model.vo.LikesCommunity;
import com.movinial.member.model.vo.Member;

public class CommunityService {

	public int selectListCount() { // 커뮤니티 전체 글 수 구하기
		
		Connection conn = getConnection(); // 커넥션 객체 생성
		
		// SELECT문 결과 ResultSet이나 , 목적이 게시글 개수 얻기 이므로 정수형 변수에 저장
		int listCount = new CommunityDao().selectListCount(conn); 
		
		close(conn); // 다 쓴 커넥션 객체 자원 반납
		
		return listCount; // 글 수 반환
	}
	
	public int selectListFilterCount(String communityCategory) { // 커뮤니티 카테고리별  글 개수 구하기
		
		Connection conn = getConnection();
		
		// SELECT문 결과 ResultSet이나 , 목적이 게시글 개수 얻기 이므로 정수형 변수에 저장
		int listCount = new CommunityDao().selectListFilterCount(conn, communityCategory);
		
		close(conn);
		
		return listCount; // 글 수 반환
	}

	public int selectListSearchCount(String searchType, String keyword) { // 커뮤니티 검색결과별 글 개수 구하기
		
		Connection conn = getConnection();
		
		// SELECT문 결과 ResultSet이나 , 목적이 게시글 개수 얻기 이므로 정수형 변수에 저장
		int listCount = new CommunityDao().selectListSearchCount(conn, searchType, keyword);
		
		close(conn);
		
		return listCount; // 글 수 반환
	}

	public ArrayList<Community> selectList(PageInfo pi) { // 커뮤니티 글 전체 리스트 조회
		
		Connection conn = getConnection();
		
		// 조회하는 커뮤니티 글 리스트 -> 0개 또는 여러개 ArrayList 이용하여 반환값 담기
		ArrayList<Community> list = new CommunityDao().selectList(conn, pi);
		
		close(conn);
		
		return list; // 글 리스트(0개 또는 여러개) 반환
	}
	
	public ArrayList<Community> selectListFilter(PageInfo pi, String communityCategory) { // 커뮤니티 카테고리별 글 리스트 조회
		
		Connection conn = getConnection();

		ArrayList<Community> list = new CommunityDao().selectListFilter(conn, pi, communityCategory);
		
		close(conn);
		
		return list; // 글 리스트(0개 또는 여러개) 반환
	}

	public ArrayList<Community> selectListSearch(PageInfo pi, String searchType, String keyword) { // 커뮤니티 검색결과별 글 리스트 조회
		
		Connection conn = getConnection();
		
		ArrayList<Community> list = new CommunityDao().selectListSearch(conn, pi, searchType, keyword);
		
		close(conn);
		
		return list; // 글 리스트(0개 또는 여러개) 반환
	}

	public int increaseView(int communityNo) { // 커뮤니티 글 조회수 증가
		
		Connection conn = getConnection();
		
		// UPDATE문 처리결과 처리된 행의 갯수 -> 정수형 변수에 결과 담기
		int result = new CommunityDao().increaseView(conn, communityNo);
		
		// 처리된 결과에 따른 트랜잭션 처리
		if(result > 0) { // 0 보다 크다 -> 처리된 내용이 있음 , 성공
			commit(conn); // 성공 시 커밋 처리
		} else { // 0 보다 작다 -> 처리된 내용이 없음, 실패
			rollback(conn); // 실패시 롤백 처리
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public Community selectCommunity(int communityNo) { // 커뮤니티 글 상세보기
		
		Connection conn = getConnection();
		
		// 글 상세페이지는 한번에 하나씩 보기 때문에, SELECT문 결과 0개(없거나) 또는 1개(있거나)라서 커뮤니티 객체에 결과값 담기
		Community c = new CommunityDao().selectCommunity(conn, communityNo);
		
		close(conn);
		
		return c; // 요청한 글 상세내용 담은 객체 반환
	}

	public CommunityFile selectCommunityFile(int communityNo) { // 커뮤니티 글 첨부파일 조회
		
		Connection conn = getConnection();
		
		CommunityFile cf = new CommunityDao().selectCommunityFile(conn, communityNo);
		
		close(conn);
		
		return cf; // 요청한 글 첨부파일 내용 담은 객체 반환
	}

	public ArrayList<Reply> selectReplyList(int communityNo) { // 댓글 리스트 조회

		Connection conn = getConnection();
		
		ArrayList<Reply> list = new CommunityDao().selectReplyList(conn, communityNo);
		
		close(conn);
		
		return list; // 댓글 리스트(0개 또는 여러개) 반환
	}

	public int insertReply(Reply r) { // 댓글 달기
		
		Connection conn = getConnection();
		
		int result = new CommunityDao().insertReply(conn,r);
		
		if(result > 0) { // 댓글달기 성공 시
			commit(conn); // 커밋
		} else { // 댓글달기 실패 시
			rollback(conn); // 롤백
		}
		close(conn);
		
		return result; // 댓글달기 결과값 반환 -> 처리된 행의 갯수 1(성공) 또는 0(실패)
	}

	public int insertCommunity(Community c, CommunityFile cf) { // 커뮤니티 글 등록
		
		Connection conn = getConnection();
		
		// Community 테이블에 INSERT
		int result1 = new CommunityDao().insertCommunity(conn, c);
		
		int result2 = 1; // 첨부파일 삽입 결과값 담을 변수 선언, 초기화 값을 1로 (첨부파일이 없을 경우 글만 삽입 후 커밋처리 해야하기 때문)
		
		if(cf != null) { // null이 아닐때만 -> 첨부파일이 있을때만
		// CommunityFile(첨부파일) 테이블에 INSERT
			result2 = new CommunityDao().insertCommunityFile(conn, cf);
		}
		
		// 커뮤니티 글 & 첨부파일 삽입 처리결과 값으로 트랜잭션처리 판단 (commit or rollback)
		if((result1 * result2) > 0) { // 성공 시  -> 두 결과값 곱하여 0이상 이면 commit
			commit(conn);
		} else { // 실패 시 -> 두 결과값 곱하여 하나라도 0이면 == 0 -> rollback
			rollback(conn);
		}
		
		close(conn);
		
		return (result1 * result2); // 처리된 결과 반환
	}

	public int updateCommunity(Community c, CommunityFile cf) { // 커뮤니티 글 수정
		
		Connection conn = getConnection();
		
		// 첨부파일 처리 가능 경우의 수를 떠나 공통적으로 처리 되어야 할 커뮤니티 글 UPDATE 우선 처리 후 조건 지정
		int result1 = new CommunityDao().updateCommunity(conn, c);
			
		int result2 = 1; // 첨부파일 처리결과값 담을 변수 선언 및 초기화
		
		if(cf != null) { // 새롭게 첨부된 파일이 있을 경우
			if(cf.getFileNo() != 0) { // 기존의 첨부파일이 있을 경우
				result2 = new CommunityDao().updateCommunityFile(conn, cf);
			} else { // 기존 첨부파일이 없을 경우
				result2 = new CommunityDao().insertNewCommunityFile(conn, cf); // 재활용X
			}
		} // 새로운 첨부파일이 없을 경우 , 따로 할일이 없음 => else 블럭 X
		
		// 커뮤니티 글 & 첨부파일 수정(UPDATE) 처리결과 값으로 트랜잭션처리 판단 (commit or rollback)
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return (result1 * result2); // 처리된 결과 반환
	}

	public int deleteCommunity(int communityNo) { // 커뮤니티 글 삭제
		
		Connection conn = getConnection();
		
		// DB에서 데이터 완전히 삭제 대신 UPDATE문으로 노출 상태 비노출로 변경 -> 삭제 대신 노출상태로 컨트롤하여 글 복구가능성 염두,
		// DB에서 데이터 완전히 삭제는 서비스 운영방침에 따라 추후 판단 및 처리
		int result = new CommunityDao().deleteCommunity(conn, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public int increaseLike(int communityNo) { // 커뮤니티 글 좋아요 수 증가
		
		Connection conn = getConnection();
		
		// 커뮤니티 조회수 증가와 동일한 형식으로 처리
		int result = new CommunityDao().increaseLike(conn, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public int communityLikesStore(int memberNo, int communityNo) { // 커뮤니티 글 상세페이지에서 좋아요 누른 글번호, 글 좋아요 테이블에 저장

		Connection conn = getConnection();
		
		int result = new CommunityDao().communityLikesStore(conn, memberNo, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public LikesCommunity selectCommunityLikes(int memberNo) { // 커뮤니티 글 좋아요 테이블, 회원번호로 조회
		
		Connection conn = getConnection();

		LikesCommunity lc = new CommunityDao().selectCommunityLikes(conn, memberNo);
		
		close(conn);
		
		return lc; // 조회된 회원번호의 글 좋아요 내용 담은 객체 반환
	}

	public int decreaseLike(int communityNo) { // 커뮤니티 글 좋아요 수 감소 (좋아요 취소)
		
		Connection conn = getConnection();
		
		// 커뮤니티 글 좋아요 증가와 반대로 차감되게 처리
		int result = new CommunityDao().decreaseLike(conn, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public int communityLikesRemove(int memberNo, int communityNo) { // 커뮤니티 글 좋아요 누른 글번호, 글 좋아요 테이블에서 제거

		Connection conn = getConnection();
		
		// UPDATE문으로 글 좋아요 컬럼의 삭제할 글번호를 "" 빈값으로 대체하여 처리
		int result = new CommunityDao().communityLikesRemove(conn, memberNo, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public int reportCommunity(int communityNo) { // 커뮤니티 글 신고
		
		Connection conn = getConnection();
		
		// 조회수 증가, 좋아요 증가와 동일한 형식으로 처리
		int result = new CommunityDao().reportCommunity(conn, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public int communityReportStore(int memberNo, int communityNo) { // 커뮤니티 글 상세페이지에서 신고한 글번호, 회원 테이블의 신고한 글 컬럼에 저장

		Connection conn = getConnection();
		
		int result = new CommunityDao().communityReportStore(conn, memberNo, communityNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public Member selectCommunityReport(int memberNo) { // 회원번호로 회원 테이블의 신고한 글 컬럼 조회
		
		Connection conn = getConnection();
		// 회원번호 == 유니크제약으로 조회시 값 하나만 조회됨으로 Member 객체에 값 담기
		Member m = new CommunityDao().selectCommunityReport(conn, memberNo);
		
		close(conn);
		
		return m; // 요청한 회원번호의 조회된 신고한 글 컬럼 반환
	}

	public Reply selectReply(int replyNo) { // 수정할 댓글 조회

		Connection conn = getConnection();
		
		// 댓글번호로 조회 -> 유니크 제약으로 하나만 검색됨으로 조회하여 댓글 객체에 저장
		Reply r = new CommunityDao().selectReply(conn, replyNo);
		
		close(conn);
		
		return r; // 댓글번호로 조회된 댓글내용 담은 객체 반환
	}

	public int updateReply(int replyNo, String replyContent) { // 댓글 내용 수정
		
		Connection conn = getConnection();
		
		int result = new CommunityDao().updateReply(conn,replyNo,replyContent);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public int deleteReply(int replyNo) { // 댓글 삭제 (상태 비노출로)
		
		Connection conn = getConnection();
		
		int result = new CommunityDao().deleteReply(conn, replyNo); // UPDATE 문 사용
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public ArrayList<Reply> selectReplyOfReplyList(int replyNo) { // 대댓글 리스트 조회

		Connection conn = getConnection();
		
		ArrayList<Reply> list = new CommunityDao().selectReplyOfReplyList(conn, replyNo);
		
		close(conn);
		
		return list; // 대댓글 리스트(0개 또는 여러개) 반환
	}

	public int insertReplyOfReply(Reply r) { // 대댓글 등록
		
		Connection conn = getConnection();
		
		int result = new CommunityDao().insertReplyOfReply(conn,r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public Member selectReplyReport(int memberNo) { // 회원번호로 회원 테이블의 신고한 댓글 컬럼 조회
		
		Connection conn = getConnection();

		Member m = new CommunityDao().selectReplyReport(conn, memberNo);
		
		close(conn);
		
		return m; // 요청한 회원번호의  신고한 댓글 내용 담은 객체 반환
	}

	public int reportReply(int replyNo) { // 댓글 신고

		Connection conn = getConnection();
		
		// 커뮤니티 글 신고와 동일한 방식으로 처리 (신고횟수 누적 증가)
		int result = new CommunityDao().reportReply(conn, replyNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public int replyReportStore(int memberNo, int replyNo) { // 신고한 댓글번호, 회원 테이블의 신고한 글 컬럼에 저장
		
		Connection conn = getConnection();
		
		int result = new CommunityDao().replyReportStore(conn, memberNo, replyNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public int increaseReplyCount(int communityNo) { // 댓글작성 완료시 , 댓글 개수 증가
		
		Connection conn = getConnection();
		
		// UPDATE문 처리결과 처리된 행의 갯수 -> 정수형 변수에 결과 담기
		int result = new CommunityDao().increaseReplyCount(conn, communityNo);
		
		// 처리된 결과에 따른 트랜잭션 처리
		if(result > 0) { // 0 보다 크다 -> 처리된 내용이 있음 , 성공
			commit(conn); // 성공 시 커밋 처리
		} else { // 0 보다 작다 -> 처리된 내용이 없음, 실패
			rollback(conn); // 실패시 롤백 처리
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

	public int decreaseReplyCount(int communityNo) { // 댓글삭제 완료시 , 댓글 개수 감소

		Connection conn = getConnection();
		
		// UPDATE문 처리결과 처리된 행의 갯수 -> 정수형 변수에 결과 담기
		int result = new CommunityDao().decreaseReplyCount(conn, communityNo);
		
		// 처리된 결과에 따른 트랜잭션 처리
		if(result > 0) { // 0 보다 크다 -> 처리된 내용이 있음 , 성공
			commit(conn); // 성공 시 커밋 처리
		} else { // 0 보다 작다 -> 처리된 내용이 없음, 실패
			rollback(conn); // 실패시 롤백 처리
		}
		close(conn);
		
		return result; // 처리된 행의 개수 반환
	}

}
