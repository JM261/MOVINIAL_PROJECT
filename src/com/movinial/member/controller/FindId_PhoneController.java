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
 * Servlet implementation class FindId_PhoneController
 */
@WebServlet("/Fine_id_Phone.me")
public class FindId_PhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindId_PhoneController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("UTF-8");
		
		//2. 넘겨 받은 값을 가공한다
		String memberName = request.getParameter("memberName");
		String phone = request.getParameter("phone1") +"-" +request.getParameter("phone2") + "-" +request.getParameter("phone3");
	
		//3. 서비스 호출 (가공한 데이터를 같이 넘긴다)
		// 결과값을 생각하면서 호출하기(UPDATE, DELETE, INSERT -> int로 반환해준다)
		// SELECT 같은 경우 객체(즉VO) 가 여러개일경우 ArrayList<vo> 로받아야하고
		// 단일 일땐 VO로 받을것을 생각한다
		// memberId 단일 문자열
		
		String memberId = new MemberService().findId(memberName, phone); 
		request.setAttribute("memberId", memberId);
		
		
		request.getRequestDispatcher("views/member/id_search.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
