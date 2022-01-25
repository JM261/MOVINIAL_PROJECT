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
		
		// 1) 게시글작성 내용 POST 방식으로 전달 -> 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기
		// 폼 전송할 때 일반방식이 아닌 multipart/form-data방식으로 전송하는 경우 // null
		// request.getParameter로 리퀘스트 객체에서 값 뽑기가 불가능!!
		// => multipart라는 객체에 값을 이관시켜서 다뤄야 한다.
		
		// 스텝 0) enctype이 multipart/form-data로 잘 전송되었을 경우
		//					전반적인 내용들이 수정되도록 조건을 걸어줌
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 파일 업로드를 위한 라이브러리 다운로드(http://www.servlets.com/)
			// 파일 업로드를 위한 라이브러리명 : cos.jar(com.oreilly.servlet의 약자)
			
			// 스텝 1) 전송되는 파일의 처리할 작업내용
			// 		(용량 제한, 전달된 파일을 저장할 경로)
			// 1_1. 전송파일 용량 제한
			//			(int maxSize => 10Mbyte로 제한)
			/*
			 * 단위 정리 (2의 10승(1024) 단위로 변경)
			 * Byte -> Kbyte -> Mbyte -> Gbyte -> Tbyte -> ...
			 * 
			 * 환산
			 * 1Kbyte == 1024byte(2의 10승)
			 * 1Mbyte == 1024Kbyte == 1024 * 1024 Byte(2의 20승)
			 * 
			 * 
			 * 
			 */
			int maxSize = 1024 * 1024 * 10; // 10Mbyte
			
			// 1_2. 전달된 파일을 저장할 서버의 폴더 경로 알아내기
			//			 (String savePath)
			// => getRealPath메소드를 통해 알아내기
			// 		다만 인자로 WebContent 폴더로부터 board_upfiles 폴더까지의 경로를 제시
			
			// ServletContext application
			// HttpSession session
			// HttpServletRequest request
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/community_upfiles/");
			
			// 스텝 2) 전달된 파일명 수정 및 서버에 업로드 작업
			/*
			 * - HttpServletRequest request => MultipartRequest multiRequest 객체로 변환
			 * 
			 * MultipartRequest객체 생성 방법 : 매개변수 생성자로 생성(cos.jar 에서 제공)
			 * 
			 * [ 표현법 ]
			 * MultipartRequest multiRequest
			 * 				= new MultipartRequest(request, 파일이 저정될 물리적 경로);
			 * 									   ,파일최대용량, 인코딩
			 * 									   ,파일명을 수정시켜주는 객체);
			 * 
			 * 위 구문 한줄 실행만으로 넘어온 첨부파일이 해당 폴더에 그대로 무조건 업로드 됨!!!!!!
			 * 그리고 사용자가 올린 파일명은 그대로 해당 폴더에 업로드 하지 않는 것이 일반적이다
			 * 그래서 파일명을 수정시켜주는 객체를 생성!!!!!!!(내맘대로)
			 * 
			 * Q) 파일명을 수정하는 이유??
			 * A) 같은 파일명 있을 경우를 대비해서
			 * 	파일명에 한글 / 특수문자 / 띄어쓰기가 포함된 경우 서버에 따라 문제가 발생할 수 있기 떄문에
			 * 
			 * 
			 * 기본적으로 파일명을 수정시켜주는 객체 => DefaultFileRenamePolicy객체(cos.jar에서 제공)
			 * => 내부적으로 rename()이라는 메소드를 실행시키면서 파일명 수정 됨
			 * => 기본적으로 동일한 파일명이 존재할 경우 뒤에 숫자를 붙여줌
			 * ex) aaa.jpg, aaa1.jpg, aaa2.jpg
			 * 
			 * 너무 성의가 없음 --
			 * 
			 * 우리 입맛대로 파일명을 수정해서 절대 파일명이 겹치지 않도록 rename 해볼 것.
			 * > DefaultFileRenamePolicy를 이용하지 않을 것,
			 * > 우리만의 파일 생성 규칙을 만들자!
			 * ex) kakaotalk_yyyymmdd_hhmmssRRR카카오톡
			 * 
			 * com.kh.common.MyFileRenamePolicy라는 클래스를 만들어보자
			 */
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 스포일러포함여부, 제목, 카테고리, 내용, 회원번호  Community 객체로 가공 => INSERT
			String communityTitle = multiRequest.getParameter("title");
			String category =  multiRequest.getParameter("category");
			String communityWriter = multiRequest.getParameter("memberNo");
			String communityContent = multiRequest.getParameter("content");
			String spoiler =  multiRequest.getParameter("spoiler");
			
			if(spoiler != null) {
				spoiler = "Y";
			} else {
				spoiler = "N";
			}
			
			// 3) VO 객체로 가공 => Community 객체로 만들자
			Community c = new Community(communityTitle,category,communityWriter,communityContent,spoiler);
			
			// 두번째 INSERT => 선택적(첨부파일이 있을 경우에만 INSERT)
			CommunityFile cf = null; // null로 초기화, 첨부파일이 있으면 그 때 객체 생성
			
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
			
			// 4) Service 단으로 토스
			int result = new CommunityService().insertCommunity(c, cf);
			
			// 5) 응답페이지 결정
			if(result > 0) { // 성공 => list.bo?currentPage=1 요청 (가장 최신글이므로)
				
//				request.getSession().setAttribute("alertMsg", "게시글 작성 성공");
				response.sendRedirect(request.getContextPath() + "/list.cm?currentPage=1");
				
			} else { // 실패
				// => 첨부파일이 있었을 경우 이미 업로드된 첨부파일을 굳이 서버에 보관할 이유가 없다! (용량만 차지)
				if(cf != null) {
					new File(savePath + cf.getChangeName()).delete(); // File 클래스의 delete 메소드 호출
				}
				
//				request.setAttribute("errerMsg", "게시글 작성 실패");
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
