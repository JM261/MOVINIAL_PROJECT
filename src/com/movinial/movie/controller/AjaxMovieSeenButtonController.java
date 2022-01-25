package com.movinial.movie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.movie.model.service.MovieService;

/**
 * Servlet implementation class AjaxMovieSeenButtonController
 */
@WebServlet("/movieSeenBtn.mo")
public class AjaxMovieSeenButtonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMovieSeenButtonController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 값 추출
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
	
		System.out.println(movieNo);
		
		int result = 0;
		
		// 봤어요 카운트 올려주기
		result = new MovieService().increaseMovieSeen(movieNo);
		
		// 봤어요 카운트 내려주기
		//result = new MovieService().decreaseMovieSeen(movieNo);
		
		
		if(result > 0) {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(result);
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
