package com.movinial.movie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.movinial.movie.model.service.MovieService;
import com.movinial.movie.model.vo.Movie;

import static com.movinial.common.MovieTemplate.*;

/**
 * Servlet implementation class AjaxMainBackgroundImageController
 */
@WebServlet("/mainBackground.mo")
public class AjaxMainBackgroundImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMainBackgroundImageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 메인화면 영화 배경이미지 가져오기
		Movie m = new MovieService().selectMaingBackgroundImage();
		
		// backdropPath를 완전한 url로 변경
		m.setBackdropPath(getMovieBackdropPath(m.getMovieId(), "original"));
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(m, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
