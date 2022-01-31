package com.movinial.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.notice.model.service.NoticeService;
import com.movinial.notice.model.vo.Qfile;
import com.movinial.notice.model.vo.Question;

/**
 * Servlet implementation class QuestionDetailManagementController
 */
@WebServlet("/questionDetailManagement.no")
public class QuestionDetailManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDetailManagementController() {
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
				
				// 3) 가공 패스
				
				// 4) Service단으로 전달 
				// question 조회
				Question q = new NoticeService().selectQuestionManagement(questionNo);
				// Qfile 조회
				Qfile at = new NoticeService().selectQfileManagement(questionNo);
					
				// q, at 넘기기
				request.setAttribute("q", q);
				request.setAttribute("at", at);
					
				// 화면 => 포워딩
				request.getRequestDispatcher("/views/notice/QuestionDetailManagementView.jsp").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
