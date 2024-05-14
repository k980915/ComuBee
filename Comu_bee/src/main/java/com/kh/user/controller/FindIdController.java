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
 * Servlet implementation class FindIdController
 */
@WebServlet("/findId.us")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindIdController() {
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

		String userName = request.getParameter("findUserName");
		String userEmail = request.getParameter("findUserEmail");
		System.out.println(userName);
		System.out.println(userEmail);

		User u = new UserService().findId(userName,userEmail);

		if (u != null) {

			String userId = u.getUserId();

			if (u.getUserName().equals(userName) && u.getUserEmail().equals(userEmail)) {

				response.setContentType("text/html;charset=UTF-8");
		
				response.getWriter().print(userId);

			}
		} else {

			request.setAttribute("errorMsg", "사용자 정보를 가져올 수 없습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}
}
