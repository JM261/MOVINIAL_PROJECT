package com.movinial.movie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.movinial.member.model.vo.Member;
import com.movinial.movie.model.service.MovieService;
import com.movinial.movie.model.vo.Movie;

import static com.movinial.common.MovieTemplate.*;

/**
 * Servlet implementation class RecommendGenreMovieController
 */
@WebServlet("/recommendMovie.mo")
public class RecommendMovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendMovieController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo(); // 회원 번호
		
		// 회원 선호 장르 가져오기
		String result = new MovieService().selectMemberPreferGenre(memberNo);
		
		String regExpGenre = result.replace(',', '|'); // 회원 선호 장르 정규식
		
		// 회원 선호 장르 기반 추천 영화 가져오기 (5개)
		ArrayList<Movie> list = new MovieService().selectMemberRecommendMovie(regExpGenre);
		
		// 포스터 URL 처리
		ArrayList<Movie> recommendList = new ArrayList<Movie>();
		
		for(Movie m: list) {
			recommendList.add(new Movie(m.getMovieNo(), m.getTitle(), getMoviePosterPath(m.getMovieId(), "w500")));
		}
		
		// 값 넘기기
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(recommendList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
