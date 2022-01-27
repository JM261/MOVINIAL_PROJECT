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
 * Servlet implementation class CommunityFormController
 */
@WebServlet("/update.cm")
public class CommunityUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1) POST 방식 => 인코딩설정
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기 => 파일이 전송될 것인가 <<< 파악하고 난 뒤에
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 파일 내려받기 => 2가지 설정
			int maxSize = 1024 * 1024 * 10; // 1. 전송파일 용량 제한 10Mbyte
			
			// 2. 전달될 파일 저장시킬 서버폴더의 물리적인 경로를 알아내기 String savePath
			String savePath = request.getSession().getServletContext().getRealPath("/resources/community_upfiles/");
			
			// 전달될 파일명 수정 후 서버에 업로드
			// MultipartRequest객체를 생성함으로써 서버에 파일이 잘감
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// Update Community
			
			// 2) 값뽑기 request => mutiRequest
			int communityNo = Integer.parseInt(multiRequest.getParameter("cno"));
			String category = multiRequest.getParameter("category");
			String communityTitle = multiRequest.getParameter("title");
			String communityContent = multiRequest.getParameter("content");
			String spoiler =  multiRequest.getParameter("spoiler");
			
			if(spoiler != null) {
				spoiler = "Y";
			} else {
				spoiler = "N";
			}
			
			// 3) VO 가공 - Community 관련
			Community c = new Community();
			c.setCommunityNo(communityNo);
			c.setCommunityCategory(category);
			c.setCommunityTitle(communityTitle);
			c.setCommounityContent(communityContent);
			c.setSpoiler(spoiler);
			
			// Attachment 와 관련된 것도 처리하고 토스~
			// Attachment 객체 선언만(null)
			// 실제 첨부파일이 있다면 => 객체 생성
			// 없다면 => null
			CommunityFile cf = null;
			
			// 새로운 첨부파일명을 리턴해주는 메소드를 이용해서 첨부파일이 있는지 확인
			
			if(multiRequest.getOriginalFileName("reUpfile") != null ) {
				
				// 새로운 파일명이 존해한다면 객체 생성 후 원본이름, 수정이름 , 파일경로
				cf = new CommunityFile();
				cf.setOriginName(multiRequest.getOriginalFileName("reUpfile"));
				cf.setChangeName(multiRequest.getFilesystemName("reUpfile"));
				cf.setFilePath("/resources/community_upfiles/");
				// => 여기까지는 새롭게 업로드한 새로운 첨부파일에 대한 내용 (SET절)
				
				// 첨부파일이 있었을 경우 + 원본파일도 있을 경우
				// 원본 파일의 파일번호, 수정명 필요
				
				if(multiRequest.getParameter("originFileNo") != null) {
					
					// 기존 파일이 있었다면
					// 기존 파일에 대한 파일번호를 at에 담을 것(WHERE절)
					cf.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					// 기존에 서버에 존재하던 첨부파일 삭제!!!
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
				} else {
						// 새로운 첨부파일이 넘어왔지만, 기존 파일이 없는 경우 => INSERT
						// + 어느 게시글의 첨부파일인지 boardNo (REF_BNO컬럼)
					cf.setRefNo(communityNo);
				}
			}
			
			// 4) Service 단으로 토스
			
			// Service 단 작성 전 나올 수 있는 경우의 수 정리
			// case 1 : 새로운 첨부파일이 X => b, null => BOARD UPDATE
			// case 2 : 새로운 첨부파일이 O, 기존 첨부파일도 O => BOARD UPDATE, ATTACHMENT UPDATE
			// case 3 : 새로운 첨부파일 O , 기존 첨부파일은 X =>  BOARD UPDATE, ATTACHMENT INSERT
			// 경우를 모두 따져서 트랜잭션 처리
			
			int result = new CommunityService().updateCommunity(c, cf);
			
			// 5) 결과에 따른 응답뷰 지정
			if(result > 0) {// 성공 => 상세보기 페이지 이동
//				request.getSession().setAttribute("alertMsg", "게시글 수정이 완료 되었습니다.");
				response.sendRedirect(request.getContextPath()+ "/detail.cm?cno=" + communityNo);
				
			} else { // 실패 => 에러페이지로 이동
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
