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
import com.movinial.movie.model.vo.Movie;

/**
 * Servlet implementation class MyMovieSeenList
 */
@WebServlet("/myMovie.Seen")
public class MyMovieSeenListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyMovieSeenListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int listCount; 
		int currentPage; 
		int pageLimit; 
		int boardLimit; 
		
		int maxPage;
		int startPage; 
		int endPage; 

		currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
		
		pageLimit = 10;
		
		boardLimit = 15;
		
		ArrayList<Movie> list = new ArrayList<>();
		
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		listCount = new MemberService().selectMyMovieSeenCount(memberNo);
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		if(endPage>maxPage) {
			endPage = maxPage;
		} 
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		list = new MemberService().myMovieSeenList(pi, memberNo);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);

		
		request.getRequestDispatcher("views/member/myMovieSeenListView.jsp").forward(request, response);

	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
