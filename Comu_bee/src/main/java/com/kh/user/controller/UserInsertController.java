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
@WebServlet("/login.us")
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
		String gender = request.getParameter("gender");
		int userBirth = Integer.parseInt(request.getParameter("userBirth"));
		String userEmail = request.getParameter("userEmail");
		int point = Integer.parseInt(request.getParameter("point"));

		User u = new User(userId, userName, userPwd, gender, userBirth, userEmail, point);

		int result = new UserService().insertUser(u);

		if (result > 0) {// 성공시 화면
			// 성공 메세지와 함께 메인페이지로 재요청
			// 메인페이지에서 알림메세지를 확인해야하니 session영역에 담아주기
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입 성공.");

			// 메인페이지로 재요청( /jsp )
			response.sendRedirect(request.getContextPath());

		} else { // 실패시 화면
			// 실패 메세지와 함께 에러페이지로 포워딩(위임)
			request.setAttribute("errorMsg", "회원가입 실패");
			// 에러페이지 경로를 넣어 dispatcher 객체 생성후 위임하기
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

		}

	}
}
