 package com.movinial.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.member.model.service.MemberService;
import com.movinial.member.model.vo.Member;
import com.movinial.movie.model.vo.Movie;
import com.movinial.review.model.service.ReviewService;

/**
 * Servlet implementation class MovieReivewEnrollFormController
 */
@WebServlet("/reviewEnroll.my")
public class MyMovieReviewEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyMovieReviewEnrollFormController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String movieKeyword = request.getParameter("movieKeyword");
		int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();

		ArrayList<Movie> seenList = new MemberService().searchSeenMovie(memberNo);
		
		request.setAttribute("seenList", seenList);

		request.getRequestDispatcher("views/member/myMovieReviewEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// POST UTF-8 인코딩
		request.setCharacterEncoding("UTF-8");

		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		String movieTitle = request.getParameter("movieTitle");
		String reviewContent = request.getParameter("reviewContent");
		String reviewShow = request.getParameter("reviewShow");
		String reviewTitle = loginUser.getMemberNickname() + "의 <" + movieTitle + "> 리뷰"; // 기본 생성 제목
		
		
		int result = new ReviewService().insertMovieReview(memberNo, movieNo, reviewContent, reviewShow, reviewTitle);
		
		if(result > 0) { // 성공
			request.getSession().setAttribute("alertMsg", "리뷰가 정상적으로 작성되었습니다");
			request.getRequestDispatcher("/myMovieReviews.bo").forward(request, response);
			
		} else { // 실패
			
			request.getSession().setAttribute("alertMsg", "리뷰 작성에 실패했습니다");
			request.getRequestDispatcher("/myMovieReviews.bo").forward(request, response);
			
		}
	}

}
