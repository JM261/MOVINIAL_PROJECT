package com.movinial.community.controller;


import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.movinial.common.MyFileRenamePolicy;
import com.movinial.community.model.service.CommunityService;
import com.movinial.community.model.vo.Community;
import com.movinial.community.model.vo.CommunityFile;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class CommunityInsertController
 */
@WebServlet("/insert.cm")
public class CommunityInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST방식 -> 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 요청시 넘겨받은 값 뽑기
		
		// form태그 값 전송할 때 일반방식이 아닌 multipart/form-data방식으로 전송하는 경우 // null
		
		// request.getParameter로 리퀘스트 객체에서 값 뽑기 *불가능
		
		// => multipart라는 객체에 값을 옮겨서 다뤄야 함.
		
		// enctype이 multipart/form-data로 잘 전송되었을 경우
		//					전반적인 내용들이 수정되도록 조건을 걸어줌
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10; // 10Mbyte - > 파일 업로드 제한 용량
			
			// 입력받은 첨부파일을 저장할 서버의 폴더 경로 찾아서, 변수에 저장
			String savePath = request.getSession().getServletContext().getRealPath("/resources/community_upfiles/");
			
			// 전달된 파일명 수정 및 서버에 업로드 작업
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String communityTitle = multiRequest.getParameter("title"); // 글제목
			String category =  multiRequest.getParameter("category"); // 글 카테고리
			String communityWriter = multiRequest.getParameter("memberNo"); // 글 작성자(회원번호)
			String communityContent = multiRequest.getParameter("content"); // 글 내용,본문
			String spoiler =  multiRequest.getParameter("spoiler"); // 스포일러 포함여부
			int isNotice = 0; // 공지사항여부
			
			if(spoiler != null) { // 스포일러 값이 비어 있지 않으면, 'Y'로 값 대입
				spoiler = "Y";
			} else { // 스포일러 값이 비어 있으면, 'N'로 값 대입
				spoiler = "N";
			}
			
			if(category.equals("공지")) { // 글 카테고리가 "공지" 라면
				isNotice = 1;
			}
			
			// VO 객체로 가공 => Community 객체로.
			Community c = new Community(communityTitle,category,communityWriter,communityContent,spoiler,isNotice);
			
			// 두번째 INSERT => 선택적(첨부파일이 있을 경우에만 INSERT)
			CommunityFile cf = null;
			
			// 원본명, 수정파일명, 파일경로
			
			// 첨부파일 유무를 가려내는 메소드(원본파일명이 존재하는지 안하는지)
			// multiRequest.getOriginalFileName("키값");
			// => 첨부파일이 있을 경우 "원본파일명" / 첨부파일이 없을 경우 null 리턴
			if(multiRequest.getOriginalFileName("upfile") != null) {
				
				// 첨부파일이 있다면 VO 객체로 가공
				cf = new CommunityFile();
				cf.setOriginName(multiRequest.getOriginalFileName("upfile")); // 원본명
				
				// 수정파일명 알아오기 : 실제 서버에 업로드된 파일의 이름을 리턴해주는 메소드
				// multiRequest.getFilesystemName("키값");
				cf.setChangeName(multiRequest.getFilesystemName("upfile")); // 수정파일명
				
				// 파일경로
				cf.setFilePath("/resources/community_upfiles/");

			}
			
			// Service 단으로 요청 보내기
			int result = new CommunityService().insertCommunity(c, cf);
			
			// 처리 결과에 따른 응답 뷰 지정
			if(result > 0) { // 커뮤니티 글 등록 성공 -> 알림 띄우고 커뮤니티 메인으로 이동
				
				request.getSession().setAttribute("alertMsg", "게시글이 등록 되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.cm?currentPage=1");
				
			} else { // 커뮤니티 글 등록 실패 => 저장한 첨부파일 삭제 후 에러페이지로 이동
				
				if(cf != null) { // 첨부파일이 있었을 경우 이미 업로드된 첨부파일을 굳이 서버에 저장해둘 필요가 없음
					new File(savePath + cf.getChangeName()).delete(); // File 클래스의 delete 메소드 호출
				} 				
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
