package com.movinial.curation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.curation.model.service.CurationService;
import com.movinial.curation.model.vo.CurationList;

/**
 * Servlet implementation class CurationListController
 */
@WebServlet("/list.cu")
public class CurationListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurationListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<CurationList> list = new CurationService().selectCurationList();
		// 큐레이션 번호, 큐레이션에 담긴 영화(6개)의 번호
		// 큐레이션에 담긴 영화(6개)의 번호는 split으로 처리 후에 다시 쿼리문을 돌려서 영화의 이미지를 가져와야한다.
		
		/////// 영화의 번호에서 영화의 아이디로 수정햇음 => 영화의 아이디로 MovieTemplate를 써서 경로를 가져올거기때문에
		// 큐레이션 이름
		
		/*
			for(int i=0; i<list.size(); i++) {
				String[] movieId = list.get(i).getListMovieId().split(",");
				
			}
		*/
		
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/curation/curation.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
