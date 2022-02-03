package com.movinial.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.movinial.community.model.service.CommunityService;
import com.movinial.member.model.vo.Member;

/**
 * Servlet implementation class AjaxSelectReportCommunityController
 */
@WebServlet("/chkreport.cm")
public class AjaxCheckCommunityReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCheckCommunityReportController() {
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
		
		// 회원번호로 멤버 테이블의 게시글신고 컬럼 조회
		Member m = new CommunityService().selectCommunityReport(memberNo);
		
		response.setContentType("application/json; charset=UTF-8"); // 처리 형식, 인코딩 지정
		
		// GSON 사용해서 응답하기 => 멤버 객체 m을 자바스크립트 객체형태로 변환
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
