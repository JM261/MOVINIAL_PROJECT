package com.movinial.community.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.community.model.service.CommunityService;
import com.movinial.community.model.vo.Community;

/**
 * Servlet implementation class CommunitySearchController
 */
@WebServlet("/search.cm")
public class CommunitySearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunitySearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) 쿼리스트링 (키=밸류)으로 넘겨받아 GET방식 => 인코딩 X
		
		// ------- 페이징 처리 -------
		// 필요한 변수들
		int listCount; // 현재 커뮤니티 게시글 총 갯수 => COMMUNITY 테이블로부터 조회 COUNT(*)활용
		int currentPage; // 현재페이지(사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 갯수 = 10개
		int boardLimit; // 한 페이지에 보여질 게시글 최대 갯수 => 30개
		
		int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (== 총 페이지 갯수)
		int startPage; // 페이지 하단에 보여질 첫번째 페이징바
		int endPage; // 페이지 하단에 보여질 마지막 페이징바
		
		// *listCount : 총 게시글 갯수
		listCount = new CommunityService().selectListCount();
		
		// * currentPage : 현재페이지 (== 사용자가 요청한 페이지)
//		currentPage = Integer.parseInt(request.getParameter("currentPage")); // : String
		
		currentPage = 1;
		
		// * pageLimit : 페이징바의 최대 갯수
		pageLimit = 10;
		
		// * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수
		boardLimit = 30;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit); // * maxPage : 가장 마지막 페이지가 몇번 페이지 인지 (총 페이지의 갯수)
		 
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1; // 조건문으로 마지막 페이징바에 대해서는 maxPage까지만 보여지게.
		
		//startPage가 11이어서 endPage가 20이 돠어야 하는데
		// maxPage가 11까지 밖에 없다면???
		// => endPage를 maxPage로 변경
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 2) 값 뽑기
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		// 3) 가공
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		// 4) Service 단으로 토스
		ArrayList<Community> list = new CommunityService().selectList(pi, searchType, keyword);
		list.get(0).setCommunityCategory("전체");
		
		// 5) 응답 뷰 지정 => list, pi를 넘기자
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		// views/board/boardListView.jsp로 포워딩~
		request.getRequestDispatcher("views/community/communityListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
