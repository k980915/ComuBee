package com.kh.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.message.model.service.MessageService;
import com.kh.message.model.vo.Message;

/**
 * Servlet implementation class MessageSendListController
 */
@WebServlet("/receiveList.ms")
public class MessageReceiveListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageReceiveListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount; //내가 쓴 댓글 총 개수 
		int currentPage; //현재 페이지
		int pageLimit; //페이지 하단에 보여질 페이징바에 최대 개수
		int boardLimit; //한 페이지에 보여줄 댓글 개수
		
		int maxPage; //가장 마지막 페이징바가 몇번인지 (총 페이지 개수)
		int startPage; //페이지 하단에 보여질 페이징바의 시작수
		int endPage; //페이지 하단에 보여질 페이징바의 끝수
		
		String userId=request.getParameter("userId");
		listCount = new MessageService().receiveMessageCount(userId);
		//currentPage 현재 페이지정보 
		currentPage = Integer.parseInt(request.getParameter("receiveListCurrentPage"));
		
		//페이지 하단에 보여질 페이징바 최대 개수
		pageLimit = 10;
				//한 페이지에서 보여줄 게시글 개수
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage-1)/pageLimit * pageLimit+1;
		
		endPage = startPage+pageLimit-1;
		
		if(endPage>maxPage) {
			endPage = maxPage; //maxPage값을 endPage변수에 대입해주기
		}
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		
		ArrayList<Message> list = new MessageService().selectReceiveMessage(pi,userId);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.getRequestDispatcher("views/message/receiveMessageView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
