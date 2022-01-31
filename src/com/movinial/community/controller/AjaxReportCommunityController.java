package com.movinial.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.community.model.service.CommunityService;

/**
 * Servlet implementation class AjaxReportCommunityController
 */
@WebServlet("/report.cm")
public class AjaxReportCommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReportCommunityController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) GET 방식 => 인코딩 X
		
		// 2) 넘긴 값 뽑기
		int memberNo = Integer.parseInt(request.getParameter("mno")); // 회원번호
		int communityNo = Integer.parseInt(request.getParameter("cno")); // 글번호
		
		// 커뮤니티 테이블의 REPORT_COUNT 컬럼 값 1 증가 시켜줘야 한다
		int result1 = new CommunityService().reportCommunity(communityNo);
		
		if(result1 > 0) { // 게시글의 신고누적횟수 증가 처리가 성공하면, 회원의 신고한 게시글 컬럼에 게시글번호 누적 저장
			
			int result2 = new CommunityService().communityReportStore(memberNo,communityNo);
			
			response.setContentType("text/html; charset=UTF-8");
			
			response.getWriter().print(result2); // 값 넘기기
			
		} else { // 게시글의 신고누적횟수 증가 처리가 실패하면, 에러페이지로 보내기
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
