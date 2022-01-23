package com.movinial.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.notice.model.service.NoticeService;
import com.movinial.notice.model.vo.Question;

/**
 * Servlet implementation class QuestionListController
 */
@WebServlet("/questionList.no")
public class QuestionListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 쿼리스트링으로 요청 => get=> 인코딩 X
		// 2) request로 부터 값뽑기
		// --- 페이징 처리
		// 필요한 변수들
		// 필요한 변수들 
		int listCount; // 현재 일반게시판의 게시글 총 개수 => BOARD 테이블로부터 조회 COUNT(*)활용
		int currentPage; // 현재 페이지 (사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 개수 => 10개
		int boardLimit; // 한 페이지에 보여질 게시글 최대 개수 => 10개
				
		int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (== 총 페이지의 개수)
		int startPage; // 페이지 하단에 보여질 첫번째 페이징바
		int endPage; // 페이지 하단에 보여질 마지막 페이징바
		
		// * listCount : 총 게시글 개수
		listCount = new NoticeService().selectListCount();
				
		// * currentPage : 현재페이지 ( == 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage")); // : String
				
		// * pageLimit : 페이징바의 최대 개수
		pageLimit = 10;
				
		// * boardLimit : 한 페이지에 보여질 게시글의 최대 개수
		boardLimit = 5;
		
		// * maxPage : 가장 마지막 페이지가 몇번 페이지인지 (총 페이지의 개수)
		maxPage = (int)Math.ceil((double)listCount / boardLimit); 
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작수
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 페이지 하단에 보여질 페이징바의 끝 수
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		//3) VO가공
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//Service단으로 토스
		ArrayList<Question> list = new NoticeService().selectList(pi);
		
		// 5) 응답 뷰 지정 => list, pi를 넘기자
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		
		// views/notice/QuestionListView.jsp 포워딩
		request.getRequestDispatcher("views/notice/QuestionListView.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
