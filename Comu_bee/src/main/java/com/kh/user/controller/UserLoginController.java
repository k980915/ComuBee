package com.kh.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.user.model.service.UserService;
import com.kh.user.model.vo.User;

/**
 * Servlet implementation class UserLoginController
 */
@WebServlet("/login.us")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		
		Cookie cookie = null;
		
		String saveId = request.getParameter("saveId");
		
		User u = new UserService().loginUser(userId, userPwd);
		
		if(saveId!=null) {
			cookie= new Cookie("userId",userId);
			
			cookie.setMaxAge(60*60*24);
			
			response.addCookie(cookie);
		}else {
			cookie = new Cookie("userId",null);
			cookie.setMaxAge(0);
		
			response.addCookie(cookie);
	}
		HttpSession session = request.getSession();
		
		if(u.getUserId()==null) {
			
			session.setAttribute("alertMsg", "로그인 실패!");
			response.sendRedirect(request.getHeader("referer"));
			
		}else {
			session.setAttribute("loginUser", u);
			session.setAttribute("alertMsg", "로그인 성공!");
		
		
			response.sendRedirect(request.getHeader("referer"));
		}
		
	}

}
