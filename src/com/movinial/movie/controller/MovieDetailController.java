package com.movinial.movie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.movie.model.service.MovieService;
import com.movinial.movie.model.vo.Movie;

/**
 * Servlet implementation class MovieDetailController
 */
@WebServlet("/detail.mo")
public class MovieDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 쿼리스트링 request 값 뽑기
		int movieNo = Integer.parseInt(request.getParameter("mno"));
		
		System.out.println("mno");
		
		Movie m = new MovieService().selectMovieDetail(movieNo);
		
		System.out.println("Ddd");
		
		if(m != null) {
			request.setAttribute("m", m);
			request.getRequestDispatcher("view/movie/movieDetailView.jsp").forward(request, response);
			
			System.out.println("rr");
			
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
