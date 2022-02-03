package com.movinial.community.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.movinial.community.model.service.CommunityService;
import com.movinial.community.model.vo.Reply;

/**
 * Servlet implementation class AjaxRereplyListController
 */
@WebServlet("/rrlist.cm")
public class AjaxReplyOfReplyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyOfReplyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// GET 방식 -> 인코딩 X
		
		// AJAX 요청시 넘겨 받은 값 뽑기
		int replyNo = Integer.parseInt(request.getParameter("rno")); // 대댓글 번호
		
		// Service단 호출
		ArrayList<Reply> list = new CommunityService().selectReplyOfReplyList(replyNo);
		
		response.setContentType("application/json; charset=UTF-8"); // 처리 형식, 인코딩 지정
		
		// GSON 사용해서 응답하기 => ArrayList를 자바스크립트의 배열형태로 변환
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
