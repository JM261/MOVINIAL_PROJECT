package com.movinial.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.member.model.service.MemberService;
import com.movinial.member.model.vo.Member;

/**
 * Servlet implementation class MemberManagementController
 */
@WebServlet("/manage.mem")
public class MemberManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberManagementController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount; // 현재 일반게시판의 게시글 총 갯수 => BOARD 테이블로부터 조회
		int currentPage; // 현재 페이지(사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 갯수 => 10개
		int boardLimit; // 한 페이지에 보여질 게시글 최대 갯수 => 10개
		
		int maxPage; // 가장 마지막 페이지가 몇 번 페이지인지 (== 총 페이지의 갯수)
		int startPage; // 페이지 하단에 보여질 첫번째 페이징바
		int endPage; // 페이지 하단에 보여질 마지막 페이징바
		
		listCount = new MemberService().selectMemberCount();  // 전체 멤버 수
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 10;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		System.out.println(endPage);
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 4) Service단으로 토스
		ArrayList<Member> list = new MemberService().selectMember(pi); // 변경
		
		// 5) 응답 뷰 지정 => list, pi를 넘기자
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		// views/board/boardListView.jsp로 포워딩
		request.getRequestDispatcher("views/member/memberManagement.jsp").forward(request, response);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
