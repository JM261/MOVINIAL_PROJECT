package com.movinial.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.community.model.service.CommunityService;
import com.movinial.community.model.vo.Community;
import com.movinial.community.model.vo.CommunityFile;

/**
 * Servlet implementation class CommunityUpdateFormController
 */
@WebServlet("/updateForm.cm")
public class CommunityUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 수정할 게시글 글번호 (cno로 넘긴 값)
		int communityNo = Integer.parseInt(request.getParameter("cno"));
		
		// Community - 글번호, 글제목, 작성자, 카테고리, 글내용, 작성일
		Community c = new CommunityService().selectCommunity(communityNo);
		
		// CommunityFile - 원본명, 수정명, 파일경로
		CommunityFile cf = new CommunityService().selectCommunityFile(communityNo);
		
		// 게시글 수정 form 페이지로 값 넘기기
		request.setAttribute("c", c);
		request.setAttribute("cf", cf);
		
		// 포워딩
		request.getRequestDispatcher("views/community/communityUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
