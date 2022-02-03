package com.movinial.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movinial.member.model.service.MemberService;
import com.movinial.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateFormCotroller
 */
@WebServlet("/updateForm.me")
public class MemberUpdateCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateCotroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String memberId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		String memberNickname = request.getParameter("memberNickname");
		String email = request.getParameter("email");
		String phone = request.getParameter("mobile1") + "-"
					+ request.getParameter("mobile2");
		String[] preferGenreArr = request.getParameterValues("preferGenre");
		
		String preferGenre = "";
		if(preferGenreArr != null) {
			preferGenre = String.join(",", preferGenreArr);
		}
		
		Member m = new Member(memberId, memberNickname, email, phone, preferGenre);
		
		Member updateMem = new MemberService().updateMember(m);
		
		if(updateMem == null) {
			request.setAttribute("alertMsg", "회원정보 수정에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem);
		
			response.sendRedirect(request.getContextPath() + "/myPage.me");
			request.getSession().setAttribute("alertMsg", "회원정보가 변경되었습니다.");

		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
