package com.movinial.movie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.movie.model.service.MovieService;
import com.movinial.movie.model.vo.Movie;
import com.movinial.review.model.service.ReviewService;
import com.movinial.review.model.vo.Review;

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
		
		// 해당 영화 정보 받아오기
		Movie m = new MovieService().selectMovieDetail(movieNo);
		
		// 해당 영화의 리뷰 정보 받아오기
		ArrayList<Review> list = new ReviewService().selectMovieReview(movieNo);
		
		if(m != null) { // 해당 영화 정보가 있음
			
			request.setAttribute("m", m);
			
			if(list != null) { // 해당 영화 정보의 리뷰가 있음
				request.setAttribute("list", list);
			}
			
		}
		
		request.getRequestDispatcher("views/movie/movieDetailView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
