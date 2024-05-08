package com.kh.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.user.model.service.UserService;

/**
 * Servlet implementation class UserDeleteController
 */
@WebServlet("/delete.us")
public class UserDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId=request.getParameter("userId");
		int result = new UserService().deleteUser(userId);
		
		HttpSession session = request.getSession();
		
		if(result>0) {//성공
			//로그인정보 지워주기
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "그동안 사이트를 이용해주셔서 감사합니다.");
			
			//메인페이지로 재요청보내기
			response.sendRedirect(request.getContextPath());
			
		}else {//실패 
			session.setAttribute("alertMsg", "회원탈퇴 실패");
			//마이페이지 띄우는 요청 보내기
			response.sendRedirect(request.getContextPath()+"/myPage.us");
		}
	}

}
