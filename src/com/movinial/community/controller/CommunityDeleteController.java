package com.movinial.community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.community.model.service.CommunityService;

/**
 * Servlet implementation class CommunityDeleteController
 */
@WebServlet("/delete.cm")
public class CommunityDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1) GET방식 => 인코딩 생략
		
		// 2) 값 뽑기
		int communityNo = Integer.parseInt(request.getParameter("cno"));
		
		// 3) VO 가공 패스~
		
		// 4) Service단으로 토스~
		int result = new CommunityService().deleteCommunity(communityNo);
		
		// 5) 결과에 따른 응답 뷰 지정
		if(result > 0) { // 성공 => alert띄워주고 공지사항 리스트 화면으로 응답
//			request.getSession().setAttribute("alertMsg", "게시글이 삭제 되었습니다.");
			response.sendRedirect(request.getContextPath()+ "/list.cm?currentPage=1");
		} else { // 실패시 에러페이지로 이동
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
