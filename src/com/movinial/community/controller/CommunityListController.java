package com.movinial.community.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.common.model.vo.PageInfo;
import com.movinial.community.model.service.CommunityService;
import com.movinial.community.model.vo.Community;


/**
 * Servlet implementation class CommunityListController
 */
@WebServlet("/list.cm")
public class CommunityListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		// 쿼리스트링으로 요청 /jsp/list.bo => GET 인코딩 X
		
		// 2) request로 부터 값 뽑기
		
		// ------- 페이징처리 -------
		// 필요한 변수들
		int listCount; // 현재 일반게시판의 게시글 총 갯수 => BOARD 테이블로부터 조회 COUNT(*)활용
		int currentPage; // 현재페이지(사용자가 요청한 페이지)
		int pageLimit; // 페이지 하단에 보여질 페이징바의 최대 갯수 = 10개
		int boardLimit; // 한 페이지에 보여질 게시글 최대 갯수 => 10개
		
		int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (== 총 페이지 갯수)
		int startPage; // 페이지 하단에 보여질 첫번째 페이징바
		int endPage; // 페이지 하단에 보여질 마지막 페이징바
		
		// *listCount : 총 게시글 갯수
		listCount = new CommunityService().selectListCount();
		
		// * currentPage : 현재페이지 (== 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage")); // : String
		
		// * pageLimit : 페이징바의 최대 갯수
		pageLimit = 10;
		
		// * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수
		boardLimit = 30;
		
		// * maxPage : 가장 마지막 페이지가 몇번 페이지 인지 (총 페이지의 갯수)
		
		/*
		 * listCount, boardLimit에 영향을 받음
		 * 
		 * - 공식을 한번 생각해보자
		 * 단, boardLimit은 10이라는 가정하에 규칙을 구해보자!
		 * 
		 * 총갯수(listCount)			boardLimit(10개)			maxPage(마지막페이지)
		 * 100개 						10개						10번 페이지
		 * 101개							10개						11번 페이지
		 * 105개							10개						11번 페이지
		 * 109개							10개						11번 페이지
		 * 110개							10개						11번 페이지
		 * 111개							10개						12번 페이지
		 * => 나눗셈 결과(listCount / boardLimit)를 올림처리해서 maxPage를 만들어주자
		 * 
		 * 스텝
		 * 1) listCount를 double로 형변환
		 * 2) listCount / boardLimit
		 * 3) 결과에 올림처리 => Math.ceil()
		 * 4) 결과값을 int로 형변환
		 */
		 maxPage = (int)Math.ceil((double)listCount / boardLimit);
		 
		 //System.out.println(maxPage); // 11
		 
		 // * startPage : 페이지 하단에 보여질 페이징바의 시작수
		 /* 
		  * pageLimit, currentPage에 영향을 받음
		  * 
		  * - 공식 구하기
		  * 단, pageLimit 10이라는 가정하에 규칙을 구해보자!
		  * 
		  * startPage : 1, 11, 21, 31, 41 ... => n * 10 + 1
		  * 
		  * 만약에 pageLimit이 5라면??
		  * startPage : 1, 6, 11 16 ... => n * 5 + 1
		  * 
		  * 즉, startPage = n * pageLimit + 1
		  * 
		  * currentPage					startPage
		  * 1								1
		  * 5								1
		  * 10								1
		  * 11								11
		  * 
		  * =>  1 ~ 10 : n * 10 + 1 =  1 => n = 0
		  * => 11 ~ 20 : n * 10 + 1 = 11 => n = 1
		  * => 21 ~ 30 : n * 10 + 1 = 21 => n = 2
		  * .........
		  * 
		  * 
		  * n을 구하려면
		  * 
		  * 	n = (currentPage - 1) / pageLimit
		  * 		0 ~ 9 / 10 = 0
		  * 	  10 ~ 19 / 10 = 1
		  * 	  20 ~ 29 / 10 = 2
		  * 		    .........
		  * 
		  * startPage = (currentPage - 1 ) / pageLimit * pageLimit + 1
		  */
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endpage : 페이지 하단에 보여질 페이징바의 끝 수
		/*
		 * startPage, pageLimit에 영향을 받음
		 * 
		 * - 공식 구하기 
		 * 	  단, pageLimit이 10이라는 가정하에 구해보자!
		 * 
		 * startPage :  1 => endPage : 10
		 * startPage : 11 => endPage : 20
		 * startPage : 21 => endPage : 30
		 * ....
		 * => endPage = startPage + PageLimit - 1
		 * 
		 * + 선택적으로(if문) 마지막 페이징바에 대해서는 maxPage까지만 보이게끔 하겠다.
		 */
		endPage = startPage + pageLimit - 1;
		
		//startPage가 11이어서 endPage가 20이 돠어야 하는데
		// maxPage가 11까지 밖에 없다면???
		// => endPage를 maxPage로 변경
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 여기까지 총 7개의 변수를 할당했음
		// 7개의 변수를 가지고 해당되는 범위에 따른 게시글 10개씩만
		// Service단으로 토스 => 7개의 변수
		// com.kh.common.model.vo.PageInfo
		
		// 3) VO로 가공
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 4) Service 단으로 토스
		ArrayList<Community> list = new CommunityService().selectList(pi);
		
		// 5) 응답 뷰 지정 => list, pi를 넘기자
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		// views/board/boardListView.jsp로 포워딩~
		request.getRequestDispatcher("views/community/communityListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
