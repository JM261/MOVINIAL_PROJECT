package com.movinial.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.community.model.service.CommunityService;

/**
 * Servlet implementation class AjaxReplyUpdateController
 */
@WebServlet("/rupdate.cm")
public class AjaxReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST방식 -> 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// AJAX 요청시 넘겨 받은 값 뽑기
		int replyNo = Integer.parseInt(request.getParameter("rno")); // 댓글번호
		String replyContent = request.getParameter("content"); // 댓글내용
		
		// Service단 호출
		int result = new CommunityService().updateReply(replyNo, replyContent);
		
		response.setContentType("text/html; charset=UTF-8"); // 처리 형식 , 인코딩 지정
		
		response.getWriter().print(result); // 응답, 값 넘기기
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
