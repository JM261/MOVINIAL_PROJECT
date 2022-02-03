package com.movinial.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.review.model.service.ReviewService;

/**
 * Servlet implementation class AjaxReportReviewController
 */
@WebServlet("/report.rev")
public class AjaxReportReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReportReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST 방식 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		int memberNo = Integer.parseInt(request.getParameter("mno")); // 회원번호
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo")); // 글번호
		
		int result1 = new ReviewService().reportReview(reviewNo); // 해당 리뷰의 신고 횟수 증가
		
		if(result1 > 0) { // 신고 횟수 증가 처리 성공 시, 회원 테이블 신고한 리뷰에 해당 리뷰 번호 누적 저장
			
			int result2 = new ReviewService().reviewReportStore(memberNo, reviewNo);
			
			// 처리 결과 보내기
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(result2);
			
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
