package com.movinial.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.movinial.community.model.service.CommunityService;
import com.movinial.member.model.vo.Member;
import com.movinial.review.model.service.ReviewService;

/**
 * Servlet implementation class AjaxSelectReportReviewController
 */
@WebServlet("/chkreport.rev")
public class AjaxSelectReportReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSelectReportReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberNo = Integer.parseInt(request.getParameter("mno")); // 회원번호
		
		// 회원 번호로 '회원' 테이블 '신고한 리뷰' 컬럼 조회
		Member m = new ReviewService().selectReviewReport(memberNo);
		
		// 값 보내기
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(m, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
