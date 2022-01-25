package com.movinial.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.notice.model.service.NoticeService;
import com.movinial.notice.model.vo.Notice;

/**
 * Servlet implementation class FAQListController
 */
@WebServlet("/FAQList.no")
public class FAQListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAQListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// Service단으로
		//ArrayList<Notice> list = new NoticeService().selectNoticeList();
		
		// 뽑아온 list를 응답페이지로 보내기
		//request.setAttribute("list", list);
		
		// views/notice/QuestionListView.jsp 포워딩
		
		request.getRequestDispatcher("views/notice/FAQListView.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
