package com.movinial.movie.controller;

import static com.movinial.common.MovieTemplate.getMovieDetail;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

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
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		
		// 해당 영화 DB 정보 가져오기
		Movie m = new MovieService().selectMovieDetail(movieNo);
		
		// TMDB 해당 영화 상세정보 가져오기
		JSONObject movieDetail = getMovieDetail(m.getMovieId());
		
		// 해당 영화 리뷰 정보 받아오기
		ArrayList<Review> list = new ReviewService().selectMovieReview(movieNo);
		
		// 값 담기
		request.setAttribute("m", m);
		request.setAttribute("movieDetail", movieDetail);
		request.setAttribute("list", list);
		
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
