package com.movinial.community.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.community.model.service.CommunityService;
import com.movinial.community.model.vo.Community;
import com.movinial.community.model.vo.CommunityFile;

/**
 * Servlet implementation class CommunityDetailController
 */
@WebServlet("/detail.cm")
public class CommunityDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// GET 방식 -> 인코딩 X
		
		//  request로 부터 값 뽑기
		int communityNo = Integer.parseInt(request.getParameter("cno")); // 글번호
		
		// Service단으로 요청 보내기 -> 조회수 증가처리
		CommunityService cService = new CommunityService();
		
		int result = cService.increaseView(communityNo);
		
		// 조회수  증가가 성공하면 => Community, CommunityFile 조회
		if(result > 0) {
			// Community 조회
			Community c = cService.selectCommunity(communityNo);
			
			// file 조회
			CommunityFile cf = cService.selectCommunityFile(communityNo);
			
			// 조회한 c(게시글)와 list(첨부파일) 넘기기
			request.setAttribute("c", c);
			request.setAttribute("cf", cf);
			
			if(request.getSession().getAttribute("loginUser") == null) { // 로그인 없이 주소 이용하여 접근하려 하면 강제로 메인 페이지로 이동시키기
				
				response.sendRedirect(request.getContextPath()+"/login.me"); // 강제로 로그인 화면으로 이동
				
			} else { // 정상적으로 로그인 해서 게시글 열람을 요청할 경우에는 포워딩으로 게시글 상세화면 보여주기
				
				request.getRequestDispatcher("views/community/communityDetailView.jsp").forward(request, response);
			}
		} else { // 실패 시 에러 페이지로 넘기기
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
