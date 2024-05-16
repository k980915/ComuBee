package com.kh.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.user.model.service.UserService;
import com.kh.user.model.vo.User;

/**
 * Servlet implementation class UserInsertController
 */
@WebServlet("/insert.us")
public class UserInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserInsertController() {
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
		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String userGender = request.getParameter("gender");
		String userBirth = request.getParameter("birth");
		String userEmail = request.getParameter("email");
		String recommender = request.getParameter("recommender");
		

		User u = new User(userId, userName, userPwd, userEmail, userBirth, userGender);
		

		int result = new UserService().insertUser(u);

		if (result > 0) {
		
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입 성공.");

			
			response.sendRedirect(request.getContextPath());

		} else {
			
			request.setAttribute("errorMsg", "회원가입 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

		}

	}
}
