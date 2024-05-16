package com.kh.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.model.service.UserService;
import com.kh.user.model.vo.User;

/**
 * Servlet implementation class FindPwdController
 */
@WebServlet("/findPwd.us")
public class FindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindPwdController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("findUserId");
		String userName = request.getParameter("findUserName");
		String userEmail = request.getParameter("findUserEmail");

		User u = new UserService().findPwd(userId, userName, userEmail);
		String userPwd = u.getUserEmail();
		String userEmail2 = u.getUserPwd();
		
		System.out.println(userPwd);


			if (u!=null &&u.getUserId().equals(userId)&& u.getUserName().equals(userName) && u.getUserPwd().equals(userEmail2)) {
				
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().print(userPwd);

				System.out.println(userPwd);

			} 
			
		}

	}

