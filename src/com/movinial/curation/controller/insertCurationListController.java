package com.movinial.curation.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.curation.model.service.CurationService;
import com.movinial.curation.model.vo.CurationList;

/**
 * Servlet implementation class insertCurationListController
 */
@WebServlet("/insertList.cu")
public class insertCurationListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertCurationListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String listName = (String)request.getParameter("listName");
		String[] listMovieIdArr = request.getParameterValues("listMovieId");
		String[] posterPathArr = request.getParameterValues("posterPath");
		String[] listMovieNoArr = request.getParameterValues("listMovieNo");
		
		
		/*
			System.out.println(request.getParameter("listName"));
			System.out.println(listMovieNoArr[1]); // 첫번째로 선택한 영화 번호
			System.out.println(listMovieNoArr[2]); // 두번째로 선택한 영화 번호
			System.out.println(listMovieNoArr[3]); // 세번째로 선택한 영화 번호
			System.out.println(listMovieNoArr[4]); // 네번째로 선택한 영화 번호
			System.out.println(listMovieNoArr[5]); // 다섯번째로 선택한 영화 번호
			System.out.println(listMovieNoArr[6]); // 여섯번째로 선택한 영화 번호
		*/
		
		String listMovieId = "";
		String posterPath = "";
		String listMovieNo = "";
		
		if(listMovieIdArr != null) {
			listMovieId = String.join(",", listMovieIdArr);
		}
		if(posterPathArr != null) {
			posterPath = String.join(",", posterPathArr);
		}
		if(listMovieNoArr != null) {
			listMovieNo = String.join(",", listMovieNoArr);
		}
		
		CurationList cl = new CurationList(listName, listMovieId, posterPath, listMovieNo);
		
		int result = new CurationService().insertCurationList(cl);
		
		// 완료시 이동 메세지등
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 추가 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.cu");
		}else {  
			request.setAttribute("errorMsg", "큐레이션 추가 실패");
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
