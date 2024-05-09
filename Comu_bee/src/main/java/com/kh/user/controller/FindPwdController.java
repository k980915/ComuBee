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
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");

		User u = new UserService().findPwd(userId, userName, userEmail);

		if (u != null) {
			String userPwd = u.getUserPwd();
			if (u.getUserId().equals(userId)&& 
					u.getUserName().equals(userName)
					&& u.getUserEmail().equals(userEmail)) {

				  request.setAttribute("finduserPwd", userPwd);
			        System.out.println(userPwd);
			        request.getRequestDispatcher("/views/user/findUserPwd.jsp").forward(request, response);
				

			}else {
				request.setAttribute("errorMsg", "사용자 정보가 일치하지 않습니다.");
			    request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

}
