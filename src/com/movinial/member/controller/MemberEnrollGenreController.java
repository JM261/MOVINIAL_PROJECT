package com.movinial.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movinial.member.model.service.MemberService;
import com.movinial.member.model.vo.Member;
import com.movinial.member.model.vo.MemberGenre;

/**
 * Servlet implementation class MemberEnrollGenreController
 */
@WebServlet("/GenreNext.me")
public class MemberEnrollGenreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollGenreController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post 방식이므로 인코딩
		request.setCharacterEncoding("UTF-8");
		
		//세션 객체 생성해서 세션에 정보값을 저장 후 마지막 insertController 에서 꺼내서 같이 insert 하는 방향
		HttpSession session = request.getSession();
		session.setAttribute("memberId", request.getParameter("memberId"));
		session.setAttribute("memberPwd", request.getParameter("memberPwd"));
		session.setAttribute("memberName", request.getParameter("memberName"));
		session.setAttribute("nickName", request.getParameter("nickName"));
		session.setAttribute("email", request.getParameter("email"));
		session.setAttribute("phone", request.getParameter("phone1") + request.getParameter("phone2"));
		
		
		//장르 조회
		ArrayList<MemberGenre> memberGenreList = new MemberService().selectGenreList();//서비스
		//장르별 영화 목록 조회
		ArrayList<MemberGenre> memberGenreMovieList = new MemberService().selectGenreMoiveList();//서비스
		
		request.setAttribute("memberGenreList",memberGenreList);
		request.setAttribute("memberGenreMovieList",memberGenreMovieList);
		
		request.getRequestDispatcher("views/member/memberEnrollGenre.jsp").forward(request, response);
		
		
		/*
		 * 아이디 중복체크
		 */
		   // GET
	      
//	      // 2) request로 부터 값 뽑기
//	      String checkId = request.getParameter("checkId");
//	      
//	      // 3) VO 가공 => 패스~
//	      
//	      // 4) Service단으로 토스~ (MemberService)
//	      int count = new MemberService().idCheck(checkId);
//	      // 중복확인은 SELECT문이지만 굳이 정보를 다담아서 넘길 필요가 없기 때문에 숫자로 반환 받았다.
//	      
//	      // 5) 결과에 따른 응답뷰 지정 => 화면이 깜빡
//	      
//	      // 형식과 인코딩 먼저 지정
//	      response.setContentType("text/html; charset=UTF-8");
//	      
//	      // AJAX는 결과물만 내보낸다 => response.getWriter().print();
//	      // "NNNNN" 중복값이 있을 때 (count == 1)
//	      // "NNNNY" 중복값이 없을 때 (count == 0)
//	      if(count > 0) { // 존재하는 아이디가 이미 있을 경우 => "NNNNN"
//	         response.getWriter().print("NNNNN");
//	      } else { // 아이디가 존재하지 않을 경우
//	         response.getWriter().print("NNNNY");
//	      }

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
