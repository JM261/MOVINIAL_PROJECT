package com.movinial.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.movinial.common.MyFileRenamePolicy;
import com.movinial.community.model.service.CommunityService;
import com.movinial.community.model.vo.Community;
import com.movinial.community.model.vo.CommunityFile;
import com.movinial.member.model.service.MemberService;
import com.movinial.member.model.vo.Member;
import com.movinial.member.model.vo.MyPageFile;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MyPageController
 */
@WebServlet("/myPage.me")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") == null) {
			session.setAttribute("alertMsg", "로그인 후 이용해주세요");
			
			response.sendRedirect(request.getContextPath());
		} else {
			
			int likeCount = 0;
			int seenCount = 0;
			int reviewCount = 0;
			
			Member member = (Member)request.getSession().getAttribute("loginUser");
			int memberNo = member.getMemberNo();
				
			//좋아요(커뮤니티, 영화, 리뷰) 수 같이 넘기기
			likeCount += new MemberService().selectCommunityLikesCount(memberNo);
			likeCount += new MemberService().selectMovieLikesCount(memberNo);
			likeCount += new MemberService().selectReviewLikesCount(memberNo);
			
			//봤어요, 리뷰 카운트 수 넘기기
			seenCount = new MemberService().selectMyMovieSeenCount(memberNo);
			reviewCount = new MemberService().selectMyReviewCount(memberNo);
			
			//프로필이미지 넘기기
			String profileImage = new MemberService().getProfileImage(memberNo);

			//Atrribute영역에 다 넣어서 넘기기
			request.setAttribute("likeCount", likeCount);
			request.setAttribute("seenCount", seenCount);
			request.setAttribute("reviewCount", reviewCount);
			request.setAttribute("profileImage", profileImage);
			
			//포워딩
			request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1) POST 방식 => 인코딩설정
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기 => 파일이 전송될 것인가 <<< 파악하고 난 뒤에
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 파일 내려받기 => 2가지 설정
			int maxSize = 1024 * 1024 * 10; // 1. 전송파일 용량 제한 10Mbyte
			
			// 2. 전달될 파일 저장시킬 서버폴더의 물리적인 경로를 알아내기 String savePath
			String savePath = request.getSession().getServletContext().getRealPath("/resources/mypage_upfiles/");
			
			// 전달될 파일명 수정 후 서버에 업로드
			// MultipartRequest객체를 생성함으로써 서버에 파일이 잘감
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// Update Community
			
			// 2) 값뽑기 request => mutiRequest
			int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
			
			// 3) VO 가공 - Community 관련
			Member member = new Member();
			member.setMemberNo(memberNo);
			
			// Attachment 와 관련된 것도 처리하고 토스~
			// Attachment 객체 선언만(null)
			// 실제 첨부파일이 있다면 => 객체 생성
			// 없다면 => null
			MyPageFile mpf = null;
			
			// 새로운 첨부파일명을 리턴해주는 메소드를 이용해서 첨부파일이 있는지 확인
			
			if(multiRequest.getOriginalFileName("reUpfile") != null ) {
				
				// 새로운 파일명이 존해한다면 객체 생성 후 원본이름, 수정이름 , 파일경로
				mpf = new MyPageFile();
				mpf.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
				mpf.setChangeName(multiRequest.getFilesystemName("reUpfile"));
				mpf.setFilePath("/resources/mypage_upfiles/");
				// => 여기까지는 새롭게 업로드한 새로운 첨부파일에 대한 내용 (SET절)
				
				// 첨부파일이 있었을 경우 + 원본파일도 있을 경우
				// 원본 파일의 파일번호, 수정명 필요
				
				if(multiRequest.getParameter("originFileNo") != null) {
					
					// 기존 파일이 있었다면
					// 기존 파일에 대한 파일번호를 at에 담을 것(WHERE절)
					mpf.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					// 기존에 서버에 존재하던 첨부파일 삭제!!!
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
				} else {
					mpf.setRefNo(memberNo);
				}
			}
			
			// 4) Service 단으로 토스
			int result = new MemberService().updateProfileImage(mpf);
			
			// 5) 결과에 따른 응답뷰 지정
			if(result > 0) {// 성공 => 상세보기 페이지 이동
	//						request.getSession().setAttribute("alertMsg", "게시글 수정이 완료 되었습니다.");
				response.sendRedirect(request.getContextPath()+ "/myPage.me");
				
			} else { // 실패 => 에러페이지로 이동
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

}
