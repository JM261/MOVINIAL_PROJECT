package com.movinial.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.community.model.service.CommunityService;
import com.movinial.community.model.vo.Reply;
import com.movinial.member.model.vo.Member;

/**
 * Servlet implementation class AjaxReplyInsertController
 */
@WebServlet("/rinsert.cm")
public class AjaxReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// POST방식 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// request로 부터 값뽑기
		String replyContent = request.getParameter("content");
		int comminityNo = Integer.parseInt(request.getParameter("cno"));

		// 로그인한 회원 정보
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		// VO로 가공 => Reply
		Reply r = new Reply(comminityNo,String.valueOf(memberNo),replyContent);
		
		// Service단 호출
		int result = new CommunityService().insertReply(r);
		
		// Gson, Json => 넘겨야할 값이 여러개일때 묶을 때
		
		// result1 개 이므로 그냥 넘기기
		response.setContentType("text/html; charset=UTF-8");
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
