package com.movinial.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.community.model.vo.Community;
import com.movinial.community.model.vo.Reply;
import com.movinial.member.model.service.MemberService;
import com.movinial.member.model.vo.Member;

/**
 * Servlet implementation class MyListController
 */
@WebServlet("/mylist.bo")
public class MyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; //현재 일반게시판의 게시글 총 갯수 => board테이블로부터 조회 count(*)활용
		int currentPage; //현재페이지(사용자가 요청한 페이지)
		int pageLimit; //페이지 하단에 보여질 페이징바의 최대 갯수(버튼 몇개나올건지 =>10개)
		int boardLimit; // 한페이지에 보여질 게시글 최대 갯수( => 10개)
		
		int maxPage; //가장 마지막 페이지가 몇번 페이지인지(==총페이지의 갯수)
		int startPage; //페이지 하단에 보여질 첫번째 페이지
		int endPage; // 페이지 하단에 보여질 마지막 페이징바

		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		
		pageLimit = 10;
		
		boardLimit = 15;
		
		ArrayList<Community> list = new ArrayList<>();
		
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		
		listCount = new MemberService().selectListCount(memberNo);
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
	
		endPage = startPage + pageLimit -1;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		if(endPage>maxPage) {
			endPage = maxPage;
		} 
		
		//3) vo로 가공
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//글
		list = new MemberService().selectList(pi, memberNo);
		
		//글
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		//views/board/boardListView.jsp 로 포워딩
		request.getRequestDispatcher("views/member/myListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
