package com.movinial.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.member.model.service.MemberService;

/**
 * Servlet implementation class memberManagementDeleteController
 */
@WebServlet("/delete.mem")
public class MemberManagementDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberManagementDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 변수
		String[] memberNo = request.getParameterValues("check");
		int result = 1;		
		
		if(memberNo != null) {			
				
			for(int i=0; i < memberNo.length; i++) {
					
				result *= new MemberService().deleteMember(memberNo[i]);
				
				if(result > 0) {
					
					request.getSession().setAttribute("alertMsg", "삭제 되었습니다.");
					response.sendRedirect(request.getContextPath() + "/manage.mem?currentPage=1");
				}
			}
		}else {
			request.getSession().setAttribute("alertMsg", "삭제할 회원을 선택해주세요.");
			response.sendRedirect(request.getContextPath() + "/manage.mem?currentPage=1");
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
