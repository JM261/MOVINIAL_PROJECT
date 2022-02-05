package com.movinial.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movinial.member.model.service.MemberService;

/**
 * Servlet implementation class MemberUpdatePwdController
 */
@WebServlet("/updateNewPwd.me")
public class UpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberController() {
         super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		System.out.println("실행");
		String newPwd 	= request.getParameter("newPwd");
		String memberId = request.getParameter("memberId");
		int memberNo 	= Integer.parseInt(request.getParameter("memberNo"));
		System.out.println(newPwd);
		System.out.println(memberId);
		System.out.println(memberNo);
		//4) Service 단으로 토스
		
		int result = new MemberService().updateMemberPwd(newPwd,memberId,memberNo);
		
		 //5) 결과값을 통해 성공 실패 여부에 따른 응답화면 지정
		 
		 HttpSession session = request.getSession();
	
		 if(result == 0) { //실패했을때
			 request.setAttribute("alertMsg", "비밀번호가 변경되지 않았습니다. 다시 시도해주세요.");
			request.getRequestDispatcher("views/member/pwd_change.jsp").forward(request, response);
		 } else { //성공했을때
//			 request.setAttribute("alertMsg", "비밀번호가 변경되었습니다");
//			session.setAttribute("loginUser", updateMem);
			 response.sendRedirect("views/member/pwd_update.jsp");
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