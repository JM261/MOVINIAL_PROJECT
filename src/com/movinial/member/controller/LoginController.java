package com.movinial.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movinial.member.model.service.MemberService;
import com.movinial.member.model.vo.Member;

/** 
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
	
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		if( userId == null || userPwd == null) {
			RequestDispatcher view = request.getRequestDispatcher("views/common/login.jsp");
			//				
			//				// 스텝3. forward
			view.forward(request, response);
		}else {	
			
			Member loginUser = new MemberService().loginMember(userId, userPwd);//서비스
			
		
			if(loginUser == null) { // 로그인 실패 => 에러페이지 응답
				System.out.println("아니야~~");
				
				// 에러메시지 넘기기
				// 스텝 1. request의 Attribute영역에 메시지 담기
				request.setAttribute("errorMsg", "로그인에 실패했습니다.");
//				response.sendRedirect("/jsp");
				
				// 스텝 2. RequestDispatcher 객체 생성
				RequestDispatcher view = request.getRequestDispatcher("views/common/login.jsp");
//				
//				// 스텝3. forward
				view.forward(request, response);
			} else {
				
				// 사용자의 정보 넘기기
				// 스텝 1. session의 attribute 영역에 사용자 정보 담기
				
				// 로그인 한 회원의 정보를 로그아웃 하기 전까지 계속 가져다가 쓸것이기 때문에 session에 담기
				
				// Servlet에서 JSP내장 객체인 session에 접근하려면 (session객체를 사용하려면)
				// 우선적으로 session객체를 얻어와야함
				// => session 객체의 type : HttpSession
				// => session 객체 생성 방법 : request.getSession();
				HttpSession session = request.getSession();
				
				session.setAttribute("loginUser", loginUser);
				
//				session.setAttribute("alertMsg", "성공적으로 로그인 하셨습니다.");
				
				response.sendRedirect("mainPage.jsp");
//				RequestDispatcher view = request.getRequestDispatcher("movinial/mainPage.jsp");
//				view.forward(request, response); //  index로 가는 주소 재지정할것!!!
			}
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
