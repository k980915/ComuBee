package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class BoardCreatePostController
 */
@WebServlet("/create.bo")
public class BoardCreatePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCreatePostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String category = request.getParameter("category");
		request.setAttribute("category", category);
		request.getRequestDispatcher("views/board/createPost.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
/*			
		request.setCharacterEncoding("UTF-8");
		// 카테고리 번호지만 vo에서 String으로 정의했기 때문에 문자열로 받아 주기
//		String category = request.getParameter("category");
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		String uploadFile = request.getParameter("uploadFile");
//		
//		System.out.println(category);
//		System.out.println(title);
//		System.out.println(content);
//		System.out.println(uploadFile);
//		
		
		// form에서 multipart 형식으로 전송을 하면 일반 request 요청 객체에서 데이터를 전달받을 수 없다.
		// multipart 형식으로 변경하여 전달받아야 한다.
		
		// 지금 요청이 multipart 형식인지 판별하여 작업하기
		
		if(ServletFileUpload.isMultipartContent(request)) {
//			System.out.println("멀티파트 맞아요");
			// 파일 업로드를 위한 라이브러리 cos.jar 등록
			
			// 1. 전송되는 파일을 처리할 작업 내용(전송되는 파일의 용량 제한, 전달된 파일을 저장할 경로)
			// 1-1. 전송 파일 용량 제한 (byte)
			
			int maxSize = 10 * 1024 * 1024;
			
			// 1-2. 전달된 파일을 저장할 서버의 경로를 알아내기
			// session 객체에서 애플리케이션 객체 얻어오고, 해당 객체에 있는 getRealPath() 메소드를 이용하여 경로 알아내기
			// 현재 구동되고 있는 웹 애플리케이션을 기준으로 경로를 잡아 주어야 한다.
//			request.getSession().getServletContext().getRealPath("/");
//			System.out.println(request.getSession().getServletContext().getRealPath("/resources/uploadFiles"));
			String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadFiles");
			
			// 1-3. 기존 request 객체로는 파일 전달을 받을 수 없으니 MultipartRequest 객체로 변환하는 작업을 수행한다.
			// [표현법] MultipartRequest multiRequest = new MultipartRequest(request,저장경로,파일최대사이즈,인코딩,파일명객체);
			// 서버에 업로드되는 파일명이 같다면 덮어쓰기가 되기 때문에 파일명을 중복되지 않도록 작업해야 한다.
			// 사용자는 알 수 없으니 서버에서 직접 파일명 변경 처리해주기
			// new DefaultFileRenamePolicy() : cos.jar에서 제공하는 기본 파일명 변경 객체 (파일명에 숫자를 부여해준다)
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"UTF-8", new MyFileRenamePolicy());
			
			// 2. DB에 저장할 데이터 추출하기
			// 게시글 정보는 Board에, 첨부파일에 대한 정보는 Attachment에 담아서 전달하기
			// 기존 request 객체에서는 전달데이터 추출 불가
			// multiRequest에서 추출해야 한다.
			String category = multiRequest.getParameter("category");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String boardWriter = multiRequest.getParameter("userNo");
			
			Board b = new Board();
			b.setCategory(category);
			b.setBoardContent(content);
			b.setBoardTitle(title);
			b.setBoardWriter(boardWriter);
			// 게시글 정보는 Board 테이블에 insert
			// 첨부파일 정보는 Attachment 테이블에 insert
			
			// 첨부파일이 없을 경우에 대비하여 있을 때 생성해서 전달하기
			Attachment at = null; 
			// 첨부파일이 있는지 없는지 판별하기
			if(multiRequest.getOriginalFileName("uploadFile")!=null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("uploadFile"));
				at.setChangeName(multiRequest.getFilesystemName("uploadFile"));
				at.setFilePath("/resources/uploadFiles/");
			}
			
			// 게시글 정보와 첨부파일 정보를 담았으니 서비스 요청하기
			int result = new BoardService().insertBoard(b,at);
			HttpSession session = request.getSession();
			if(result>0) {
				// 세션에 게시글 등록 성공 메시지 담고
				// 게시판 목록으로 이동시키기
				session.setAttribute("alertMsg", "게시글 등록 성공");
				response.sendRedirect(request.getContextPath()+"/list.bo?currentPage=1");
			}else {
				// 세션에 게시글 등록 실패 메시지 담고
				// 게시판 목록으로 이동시키기
				// 만약 첨부파일이 있다면 해당 파일 서버에서 삭제하기
				if(at!=null) {
					//삭제하고자 하는 파일 경로로 파일 객체 연결한 뒤 삭제 메소드 실행
					
					new File(savePath+at.getChangeName()).delete();
				}
				session.setAttribute("alertMsg", "게시글 등록 실패");
				response.sendRedirect(request.getContextPath()+"/list.bo?currentPage=1");
			}
*/		}
	
	}




