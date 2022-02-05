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
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
			
		String memberPwd = request.getParameter("memberPwd");
				
		//세션에 담겨있는 기존의 로그인된 사용자의 정보를 얻는다
		HttpSession session = request.getSession();
				
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();

		int result = new MemberService().deleteMember(memberId, memberPwd);
				
				// 5) 결과에 따른 응답페이지 지정
				
				if(result>0) { 
					session.removeAttribute("loginUser");
					request.getSession().setAttribute("alertMsg", "회원 탈퇴 되었습니다. 이용해주셔서 감사합니다");
					request.getRequestDispatcher("views/common/headerSidebarAlert.jsp").forward(request, response);
				
				} else { 
					request.getSession().setAttribute("alertMsg", "회원탈퇴에 실패했습니다");
					request.getRequestDispatcher("views/common/headerSidebarAlert.jsp").forward(request, response);

					
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
