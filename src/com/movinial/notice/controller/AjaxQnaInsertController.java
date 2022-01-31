package com.movinial.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.member.model.vo.Member;
import com.movinial.notice.model.service.NoticeService;
import com.movinial.notice.model.vo.Answer;

/**
 * Servlet implementation class AjaxQnaInsertController
 */
@WebServlet("/rinsert.no")
public class AjaxQnaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxQnaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	    // POST 인코딩
				request.setCharacterEncoding("UTF-8");
				
				// request로부터 값뽑기
				String answerContent = request.getParameter("content");
				int qnaNo = Integer.parseInt(request.getParameter("qno"));
				
				// 로그인한 회원 정보
				int memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
				
				// VO 가공 => Reply
				Answer a = new Answer();
				a.setRefQno(qnaNo);
				a.setAnswerContent(answerContent);
				a.setAnswerWriter(String.valueOf(memberNo));
				
				// Service단 호출
				int result = new NoticeService().insertAnswer(a);
				
				// Gson, Json => 넘겨야 할 값이 여러개일 때, 묶을 때
				
				// result 1개이므로 그냥 넘기기
				response.setContentType("text/html; charset=UTF-8");
				
				response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
