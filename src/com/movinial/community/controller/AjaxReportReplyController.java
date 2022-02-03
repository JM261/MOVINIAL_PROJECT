package com.movinial.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.community.model.service.CommunityService;

/**
 * Servlet implementation class AjaxReportReplyController
 */
@WebServlet("/report.re")
public class AjaxReportReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReportReplyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// GET 방식 -> 인코딩 X
		
		// AJAX 요청시 넘겨 받은 값 뽑기
		int memberNo = Integer.parseInt(request.getParameter("mno")); // 회원번호
		int replyNo = Integer.parseInt(request.getParameter("rno")); // 댓글번호
		
		// reply 테이블의 REPORT_COUNT 컬럼 값 1 증가 시켜줘야 한다
		int result1 = new CommunityService().reportReply(replyNo);
		
		if(result1 > 0) { // 댓글 신고누적횟수 증가 처리가 성공하면, 회원의 신고한 댓글 컬럼에 댓글번호 누적 저장
			
			int result2 = new CommunityService().replyReportStore(memberNo,replyNo);
			
			response.setContentType("text/html; charset=UTF-8"); // 처리 형식 , 인코딩 지정
			
			response.getWriter().print(result2); // 응답, 값 넘기기
			
		} else { // 댓글의 신고누적횟수 증가 처리가 실패하면, 에러페이지로 보내기
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
