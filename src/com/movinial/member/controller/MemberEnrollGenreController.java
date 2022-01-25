package com.movinial.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberEnrollGenreController
 */
@WebServlet("/GenreNext.me")
public class MemberEnrollGenreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollGenreController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post 방식이므로 인코딩
		request.setCharacterEncoding("UTF-8");
		
		//세션 객체 생성해서 세션에 정보값을 저장 후 마지막 insertController 에서 꺼내서 같이 insert 하는 방향
		HttpSession session = request.getSession();
		session.setAttribute("memberId", request.getParameter("memberId"));
		session.setAttribute("memberPwd", request.getParameter("memberPwd"));
		session.setAttribute("memberName", request.getParameter("memberName"));
		session.setAttribute("nickName", request.getParameter("nickName"));
		session.setAttribute("email", request.getParameter("email"));
		session.setAttribute("phone", request.getParameter("phone1") + request.getParameter("phone2"));
		
		
		request.getRequestDispatcher("views/member/memberEnrollGenre.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
