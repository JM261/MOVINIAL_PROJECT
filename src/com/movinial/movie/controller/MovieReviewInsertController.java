package com.movinial.movie.controller;

import java.io.IOException;
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
 * Servlet implementation class MovieReviewInsertController
 */
@WebServlet("/insertReview.mo")
public class MovieReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("?");
		
		// POST UTF-8 인코딩
		request.setCharacterEncoding("UTF-8");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo")); // 회원 번호
		int movieNo = Integer.parseInt(request.getParameter("movieNo")); // 영화 번호
		String reviewContent = request.getParameter("reviewContent"); // 리뷰 내용
		String reviewShow = request.getParameter("reviewShow"); // 리뷰 공개 여부
		
		// 영화 상세정보에서 작성시 기본 제목 생성용
		String memberNickname = request.getParameter("memberNickname"); // 회원 닉네임
		String movieNameKr = request.getParameter("movieNameKr"); // 영화 이름 한국어
		
		String reviewTitle = memberNickname + "의 " + movieNameKr + " 리뷰"; // 기본 생성 제목
		
		int result = new ReviewService().insertMovieReview(memberNo, movieNo, reviewContent, reviewShow, reviewTitle);
		
		System.out.println(result);
		
		// <%= contextPath %>/reviewList.mo?currentPage=1&mno=<%= movieNo %>
		
		if(result > 0) { // 성공
			
			request.setAttribute("alertMsg", "리뷰가 정상적으로 작성되었습니다.");
			request.getRequestDispatcher("/reviewList.mo?currentPage=1&mno=" + movieNo).forward(request, response);
		} else {
			
			request.setAttribute("alertMsg", "리뷰 작성에 실패했습니다.");
			request.getRequestDispatcher("/reviewList.mo?currentPage=1&mno=" + movieNo).forward(request, response);
			
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
