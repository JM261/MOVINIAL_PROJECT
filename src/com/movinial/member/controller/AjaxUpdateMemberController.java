package com.movinial.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.member.model.service.MemberService;

/**
 * Servlet implementation class AjaxUpdateMemberController
 */
@WebServlet("/nickCheck.me")
public class AjaxUpdateMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdateMemberController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nicknameUp = request.getParameter("nicknameUp");
		
		int count = new MemberService().nicknameCheck(nicknameUp);
	
		response.setContentType("text/html; charset=UTF-8");

		if(count > 0) {// 존재하는 닉네임이 이미 있으면 
			response.getWriter().print("NNNNN");
		
		} else { //존재하는 닉네임이 존재하지않으면
			response.getWriter().print("NNNNY");
		
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
