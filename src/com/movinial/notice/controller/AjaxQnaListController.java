package com.movinial.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.movinial.notice.model.service.NoticeService;
import com.movinial.notice.model.vo.Answer;

/**
 * Servlet implementation class AjaxQnaListController
 */
@WebServlet("/rlist.no")
public class AjaxQnaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxQnaListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 값 뽑기
		int qnaNo = Integer.parseInt(request.getParameter("qno"));
				
		// VO 가공 => 패스
		// Service단으로 토스 => 게시판 관련 기능
		ArrayList<Answer> list = new NoticeService().selectAnswerList(qnaNo);
				
		
		
		// 응답
		// GSON 이용 => ArrayList를 자바스크립트의 배열형태로 변환
		// 형식, 인코딩 지정
		response.setContentType("application/json; charset=UTF-8");
				
		new Gson().toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
