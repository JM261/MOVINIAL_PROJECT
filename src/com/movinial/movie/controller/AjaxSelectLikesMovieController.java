package com.movinial.movie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.movinial.member.model.vo.LikesMovie;
import com.movinial.movie.model.service.MovieService;

/**
 * Servlet implementation class AjaxSelectLikesMovieController
 */
@WebServlet("/chklike.mo")
public class AjaxSelectLikesMovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxSelectLikesMovieController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberNo = Integer.parseInt(request.getParameter("mno")); // 회원 번호
		
		// 회원 번호로 '영화 좋아요' 테이블 '좋아요' 컬럼 조회		
		LikesMovie lm = new MovieService().selectLikesMovie(memberNo);
		
		// JSON 객체 GSON으로 넘기기
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(lm, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
