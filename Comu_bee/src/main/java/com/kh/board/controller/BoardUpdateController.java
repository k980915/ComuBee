package com.kh.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int bno = Integer.parseInt(request.getParameter("bno"));

		//수정페이지로 전달하기
		// 게시글 정보
		// 카테고리 목록
		// 첨부 파일 정보
		Board b = new BoardService().selectBoard(bno);
		Attachment at = new BoardService().selectAttachment(bno);
		// 출력문으로 출력해서 확인
		request.setAttribute("b", b);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/board/boardUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize= 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadFiles");
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8", new MyFileRenamePolicy());

			int boardNo=Integer.parseInt(multiRequest.getParameter("boardNo"));
			String title=multiRequest.getParameter("title");
			String content=multiRequest.getParameter("content");
			Board b = new Board();
			b.setBoardNo(boardNo);
			b.setTitle(title);
			b.setBoardContent(content);
			Attachment at=null;
			
			if(multiRequest.getOriginalFileName("reUploadFile")!=null) {
				at=new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("reUploadFile"));
				at.setChangeName(multiRequest.getFilesystemName("reUploadFile"));
				at.setAtFilePath("resources/uploadFiles");
			}
	
			if(multiRequest.getParameter("originFileNo")!=null) {
				at.setAtNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));				
			}
			int result=new BoardService().updateBoard(b, at);
			HttpSession session = request.getSession();
			if(result>0) {
				if(at!=null) {
						if(at!=null && at.getAtNo()!=0) {
					// 기존 파일 삭제(파일 경로+원본파일(업로드된 이름)).delete
							new File(savePath+multiRequest.getParameter("originFileName")).delete();					
							}
						}

					session.setAttribute("alertMsg", "게시글 수정완료");
				}else {
					session.setAttribute("alertMsg", "게시글 수정실패");
				}
				response.sendRedirect(request.getContextPath()+"/detail.bo?bno="+boardNo);

			}
		}


}
