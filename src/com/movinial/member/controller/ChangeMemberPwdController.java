package com.movinial.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.member.model.service.MemberService;
import com.movinial.member.model.vo.Member;

/**
 * Servlet implementation class ChangeMemberPwdController
 */
@WebServlet("/pwd_change.me")
public class ChangeMemberPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeMemberPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//1.인코딩
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String phone = request.getParameter("phone1") +"-" +request.getParameter("phone2") + "-" +request.getParameter("phone3");
		
		Member m = new MemberService().forgotPwd(memberId, memberName, phone); 
		System.out.println(m);
		if( m.getMemberId() == null  ) {	//인증 성공시
		
			request.setAttribute("errorMsg", "회원정보를 잘못 입력하셨습니다.");
			request.getRequestDispatcher("views/member/pwd_find.jsp").forward(request, response);
			
		} else {	//인증 성공시
			request.setAttribute("memberInfo", m);	
			request.getRequestDispatcher("views/member/pwd_change.jsp").forward(request, response);

//			response.sendRedirect("views/member/pwd_change.jsp");
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
