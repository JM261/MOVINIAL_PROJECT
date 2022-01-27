package com.movinial.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.movinial.community.model.service.CommunityService;
import com.movinial.member.model.vo.LikesCommunity;

/**
 * Servlet implementation class AjaxSelectLikesCommunityController
 */
@WebServlet("/chklike.cm")
public class AjaxSelectLikesCommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSelectLikesCommunityController() {
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
		
		// 회원번호를 가지고 게시글 좋아요 테이블을 조회하여 온다
		LikesCommunity lc = new CommunityService().selectCommunityLikes(memberNo);
		
		// GSON 사용해서 응답하기 => lc를 자바스크립트 객체형태로 변환
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(lc, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
