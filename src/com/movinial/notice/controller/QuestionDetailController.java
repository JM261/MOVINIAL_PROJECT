package com.movinial.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.notice.model.service.NoticeService;
import com.movinial.notice.model.vo.Question;

/**
 * Servlet implementation class QuestionDetailController
 */
@WebServlet("/questionDetail.no")
public class QuestionDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// localhost:8001/jsp/detail.no?nno=글번호
		// 2) request로부터 값 뽑기
		int questionNo = Integer.parseInt(request.getParameter("qno")); // : String형
		
		// 3) 가공 패싱 ~
		
		// 4) Service단으로 전달 -1(클릭했을 때 공지사항 글번호를 UPDATE)
		//int result = new NoticeService().increaseCount(noticeNo);
		
		// 4) Service단으로 전달 -2(UPDATE가 성공했다면 상세조회 요청)
		
			
			Question q = new NoticeService().selectQuestion(questionNo);
			
			request.setAttribute("q", q);
			request.getRequestDispatcher("/views/notice/QuestionDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
