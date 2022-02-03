package com.movinial.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxMemberIdCheckController
 */
@WebServlet("/idCheck.me")
public class AjaxMemberIdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxMemberIdCheckController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String checkId = request.getParameter("checkId");
		// 3) VO 가공 => 패스~
		
		// 4) Service단으로 토스~ (MemberService)
		int count = new MemberService().idCheck(checkId);
		// 중복확인은 SELECT문이지만 굳이 정보를 다담아서 넘길 필요가 없기 때문에 숫자로 반환 받았다.
		// 5) 결과에 따른 응답뷰 지정 => 화면이 깜빡

		// 형식과 인코딩 먼저 지정
		response.setContentType("text/html; charset=UTF-8");

		// AJAX는 결과물만 내보낸다 => response.getWriter().print();
		// "NNNNN" 중복값이 있을 때 (count == 1)
		// "NNNNY" 중복값이 없을 때 (count == 0)
		if (count > 0) { // 존재하는 아이디가 이미 있을 경우 => "NNNNN"
			response.getWriter().print("NNNNN");
		} else { // 아이디가 존재하지 않을 경우
			response.getWriter().print("NNNNY");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
