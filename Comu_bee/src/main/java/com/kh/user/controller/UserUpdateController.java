package com.kh.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.user.model.service.UserService;
import com.kh.user.model.vo.User;

/**
 * Servlet implementation class UserUpdateController
 */
@WebServlet("/update.us")
public class UserUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateController() {
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
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String gender= request.getParameter("gender");
		String email = request.getParameter("email");
		
		User u = new User(userId,userName, gender, email);
		System.out.println("입력받은상태"+u);
		
		User updateUser = new UserService().updateUser(u);
		System.out.println("업데이트된 상태"+updateUser);
		
		if(updateUser == null) {
			request.setAttribute("errorMsg", "정보수정실패");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			//포워딩하기 (위임)
			view.forward(request, response);
			System.out.println("정보수정 실패");
		}else {
			//정보수정 성공시 - 마이페이지로 재요청 
			//정보수정된 회원정보를 로그인정보에 갱신시켜주기 위해 재조회해오기 
			HttpSession session = request.getSession();
			
			//조회해온 갱신데이터 session에 갱신시켜주기
			session.setAttribute("alertMsg", "정보수정성공");
			session.setAttribute("loginUser",updateUser);
			//마이페이지 요청매핑을 이용해서 페이지 재요청하기
			System.out.println("정보수정 성공");
			response.sendRedirect(request.getContextPath()+"/myPage.us");
			
		}
		
	}

}
