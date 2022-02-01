package com.movinial.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movinial.member.model.service.MemberService;
import com.movinial.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class MemberUpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		//2) request로 부터 값을 추출(아이디(식별용), 패스워드랑 변경할 비밀번호만)
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String updatePwd = request.getParameter("updatePwd");

		//4) Service 단으로 토스
		
		 Member updateMem = new MemberService().updatePwdMember(memberId, memberPwd, updatePwd);
		
		 //5) 결과값을 통해 성공 실패 여부에 따른 응답화면 지정
		 
		 HttpSession session = request.getSession();
	
		 if(updateMem == null) { //실패했을때
			session.setAttribute("alertMsg", "비밀번호가 변경되지 않았습니다. 다시 시도해주세요."); 
		 } else { //성공했을때
			session.setAttribute("alertMsg", "비밀번호가 변경되었습니다.");
			session.setAttribute("loginUser", updateMem);
		 }
			
		 response.sendRedirect(request.getContextPath() + "/myPage.me");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
