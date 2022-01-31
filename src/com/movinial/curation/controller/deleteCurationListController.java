package com.movinial.curation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.curation.model.service.CurationService;

/**
 * Servlet implementation class deleteCurationListController
 */
@WebServlet("/delete.cu")
public class deleteCurationListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCurationListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listNo = Integer.parseInt(request.getParameter("cno"));
		
		int result = new CurationService().deleteCuration(listNo); 
		
		if(result > 0) {
			
			request.getSession().setAttribute("alertMsg", "성공적으로 삭제 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.cu");
		
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
