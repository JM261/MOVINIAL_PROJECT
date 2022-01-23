package com.movinial.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movinial.notice.model.service.NoticeService;
import com.movinial.notice.model.vo.Question;

/**
 * Servlet implementation class QuestionInsertController
 */
@WebServlet("/questionInsert.no")
public class QuestionInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기
		String memberNo = request.getParameter("memberNo"); // "1" :String
		String qnaTitle = request.getParameter("title");
		String qnaContent = request.getParameter("content");
					
		// 3) VO객체로 가공
		Question q = new Question();
		q.setQnaWriter(memberNo);
		q.setQnaTitle(qnaTitle);
		q.setQnaContent(qnaContent);
		
		// 4) Service단으로 토스 ~
		int result = new NoticeService().insertQuestion(q);
				
		// 5) 결과에따른 응답페이지를 지정
		if(result > 0) { // 성공 => 공지사항 리스트가 보이게끔 넘겨주자 => localhost:8001/jsp/list.no (alert띄우고나서 이동)
			request.getSession().setAttribute("alertMsg", "문의사항이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/questionList.no");
		}else { // 실패 => 에러페이지로 보내자
			//request.setAttribute("errorMsg", "문의사항 등록 실패");
			//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
