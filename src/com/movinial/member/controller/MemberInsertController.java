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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		// POST
		// 1) 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		 String memberId = (String)request.getSession().getAttribute("memberId");
	     String memberPwd = (String)request.getSession().getAttribute("memberPwd"); // 필수입력사항
		 String memberName = (String)request.getSession().getAttribute("memberName"); // 필수입력사항
		 String nickName = (String)request.getSession().getAttribute("nickName"); // 필수입력사항
		 String email = (String)request.getSession().getAttribute("email"); // 빈 문자열이 들어갈 수 있음
		 String phone = (String)request.getSession().getAttribute("phone");
		 String Prefergenre = (String)request.getSession().getAttribute("Prefergenre");
		 
		 //선호 장르는 여기다가 추가
		// 2) request객체로부터 요청 시 전달값을 get해버리기
		 
		// 3) 매개변수 생성자를 이용해서 Member객체에 담기
		Member m = new Member(memberId, memberPwd, memberName, nickName, email, phone, Prefergenre);
		
		// 4) 요청처리(Service단으로 토스~)
		int result = new MemberService().insertMember(m);
		
		request.getSession().invalidate();
		// 5) 처리결과를 가지고 사용자가 보게 될 응답화면 지정
		if(result > 0) { // 성공 => jsp요청 => url재요청방식(sendRedirect)
			
			request.getSession().setAttribute("alertMsg", "회원가입에 성공했습니다.");
			
//			response.sendRedirect(request.getContextPath());
			response.sendRedirect("views/member/memberInsertComplete.jsp");
		}else { // 실패 => 에러페이지
			
			request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
			
			RequestDispatcher view = request.getRequestDispatcher("views/member/memberInsertComplete.jsp");
			view.forward(request, response);
			
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
