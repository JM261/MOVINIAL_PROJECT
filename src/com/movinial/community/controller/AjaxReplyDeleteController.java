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
 * Servlet implementation class AjaxReplyDeleteController
 */
@WebServlet("/rdelete.cm")
public class AjaxReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// GET 방식 -> 인코딩 X
		
		// AJAX 요청시 넘겨 받은 값 뽑기
		int communityNo = Integer.parseInt(request.getParameter("cno")); // 글번호
		int replyNo = Integer.parseInt(request.getParameter("rno")); // 댓글번호
		
		int result = 0; // 댓글 작성 결과 담아서 반환할 변수 선언 및 초기화
		
		// Service단 호출
		int result1 = new CommunityService().deleteReply(replyNo);
		
		response.setContentType("text/html; charset=UTF-8"); // 처리 형식 , 인코딩 지정
		
		response.getWriter().print(result); // 응답 , 값 넘기기
		
		if(result1 > 0) { // 댓글 insert 성공시 글에 달린 댓글 개수 증가 요청
			
			int result2 = new CommunityService().decreaseReplyCount(communityNo);
			
			result = result1 * result2; // 댓글 작성 결과  * 댓글 개수 증가 결과 
		}
		
		response.setContentType("text/html; charset=UTF-8"); // 처리 형식 , 인코딩 지정
		
		response.getWriter().print(result); // 응답 , 값 넘기기
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
