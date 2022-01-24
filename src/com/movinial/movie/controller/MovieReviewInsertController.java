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
		
		// POST UTF-8 인코딩
		request.setCharacterEncoding("UTF-8");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo")); // 회원 번호
		int movieNo = Integer.parseInt(request.getParameter("movieNo")); // 영화 번호
		String reviewContent = request.getParameter("reviewContent"); // 리뷰 내용
		String reviewShow = request.getParameter("reviewShow"); // 리뷰 공개 여부
		
		// 영화 상세정보에서 작성시 기본 제목 생성용
		String memberNickname = request.getParameter("Nickname"); // 회원 닉네임
		String movieNameKr = request.getParameter("movieNameKr"); // 영화 이름 한국어
		
		String reviewTitle = memberNickname + "의 " + movieNameKr + " 리뷰"; // 기본 생성 제목
		
		
		int result = new ReviewService().insertMovieReview(memberNo, movieNo, reviewContent, reviewShow, reviewTitle);
		
		if(result > 0) { // 성공
			
			request.setAttribute("", );
			
		}
		
		
		
		
		
//        <!-- 리뷰 작성 -->
//        <form action="/insertReview.mo" method="post" class="enroll-form">
//        	<!-- 해당 영화 번호 전송 -->
//        	<input type="hidden" name="movieNo" value="<%= movieNo%>">
//            <textarea class="form-control" name="reviewContent" cols="200" rows="7" placeholder="해당 영화에 관련된 리뷰만 작성하시기 바랍니다.&#13;&#10;광고성 글, 비방글, 욕설 등 부적절한 내용이 포함될 시 신고 될 수 있으며, 부적절한 컨텐츠로 판단되면 별도의 안내없이 삭제 조치 될 수 있습니다."></textarea>
//
//            <br>
//            <div>
//                <div class="form-check">
//                    <label class="form-check-label">
//                        <input type="radio" class="form-check-input" name="reviewShow" value="Y" id="public">
//                        <label for="public">공개</label>
//                    </label>
//                </div>
//            </div>
//            <div>
//                <div class="form-check">
//                    <label class="form-check-label">
//                        <input type="radio" class="form-check-input" name="reviewShow" value="N" id="private">
//                        <label for="private">비공개</label>
//                    </label>
//                </div>
//            </div>
//
//                <button type="submit" class="btn btn-sm btn-secondary" align="right">등록</button>
//        </form>
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
