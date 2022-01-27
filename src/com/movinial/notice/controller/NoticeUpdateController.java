package com.movinial.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.notice.model.service.NoticeService;
import com.movinial.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

				request.setCharacterEncoding("UTF-8");

				int noticeNo = Integer.parseInt(request.getParameter("nno"));
				String noticeTitle = request.getParameter("noticeTitle"); // : String
				String noticeContent = request.getParameter("noticeContent"); // : String
				
				Notice n = new Notice();
				
				n.setNoticeNo(noticeNo);
				n.setNoticeTitle(noticeTitle);
				n.setNoticeContent(noticeContent);
				
				int result = new NoticeService().updateNotice(n);
				
				if(result > 0) { 
					
					request.getSession().setAttribute("alertMsg", "성공적으로 글 수정이 되었습니다.");
					response.sendRedirect(request.getContextPath() + "/noticeDetail.no?nno="+noticeNo);
					
				}else { 
					request.setAttribute("errorMsg", "글 수정에 실패했습니다.");
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
