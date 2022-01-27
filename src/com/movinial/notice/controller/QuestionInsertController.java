package com.movinial.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.movinial.common.MyFileRenamePolicy;
import com.movinial.notice.model.service.NoticeService;
import com.movinial.notice.model.vo.Qfile;
import com.movinial.notice.model.vo.Question;
import com.oreilly.servlet.MultipartRequest;

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
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10; // 10Mbyte 전송되는 파일 용량제한
			//전달된 파일에 저장할 서버의 폴더 경로 
			String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_upfiles/");
		
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
			String category = multiRequest.getParameter("category");
			String qnaWriter = multiRequest.getParameter("memberNo"); // "1" :String
			String qnaTitle = multiRequest.getParameter("title");
			String qnaContent = multiRequest.getParameter("content");
						
		// 3) VO객체로 가공
		Question q = new Question();
		q.setCategory(category);
		q.setQnaWriter(qnaWriter);
		q.setQnaTitle(qnaTitle);
		q.setQnaContent(qnaContent);
		
		// 두번째 INSERT => 선택적(첨부파일이 있을 경우에만 INSERT)
		Qfile at = null;// null로 초기화, 첨부파일이 있으면 그때 객체 생성
		
		// 첨부파일 유무를 가려내는 메소드(원본파일명이 존재하는지 안하는지)
		// multiRequest.getOriginalFileName("키값");
		// => 첨부파일이 있을 경우, "원본파일명"   /  첨부파일이 없을 경우, null 리턴
					
	   if(multiRequest.getOriginalFileName("upfile") != null) {
			// 첨부파일이 있다면 VO 객체로 가공
			at = new Qfile();
			at.setOriginName(multiRequest.getOriginalFileName("upfile"));  // 원본명
						
			// 수정파일명 알아오기 : 실제서버에 업로드된 파일의 이름을 리턴해주는 메소드
			// multiRequest.getFilesystemName("키값");
			at.setChangeName(multiRequest.getFilesystemName("upfile")); // 수정파일명
						
			// 파일경로
			at.setFilePath("/resources/notice_upfiles/");
					}
		
		
		
		// 4) 서비스 요청
		int result = new NoticeService().insertQuestion(q,at);
				
		// 5) 결과에따른 응답페이지를 지정
		if(result > 0) { // 성공 => 문의 리스트가 보이게끔 넘겨주자 => localhost:8001/jsp/list.no (alert띄우고나서 이동)
			request.getSession().setAttribute("alertMsg", "문의사항이 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/questionList.no?currentPage=1");
		}else { // 실패 => 에러페이지로 보내자
			
			if(at != null) {
				//delete메소드 호출
				new File(savePath + at.getChangeName()).delete();
			}
			//request.setAttribute("errorMsg", "문의사항 등록 실패");
			//request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}		
							
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
