

package com.movinial.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet("/logout.me")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그아웃 요청에 따라 처리르 해주겠다 => session을 만료시키겠다 ( 무효화한다 )
		// 무효화 메소드 : invalidate() => session에서 제공하는 메소드
		//HttpSession session = request.getSession();
		//session.invalidate();
		request.getSession().invalidate();
		
		// 응답페이지 => sendRedirect방식
		// index.jsp가 보여지게끔 => localhost:8001/jsp
		// response.sendRedirect("/jsp"); // 경로 하드코딩 X
		
		
		// 앞으로는 응답페이지 요청 시 contextPath를 직접 작성하는것이 아니라
		// request.getContextPath() : contextPath (== contextRoot)가 나옴
		// 메소드 호출해서 쓰곘음!!!
		response.sendRedirect(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
