package com.kh.user.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Reply;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.user.model.dao.UserDao;
import com.kh.user.model.vo.User;

//회원가입
public class UserService {

	public int insertUser(User u) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().insertUser(conn,u);
		
		if (result > 0) { // 성공시 확정
			JDBCTemplate.commit(conn);
		} else {// 실패시 되돌리기
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
	//로그인
	public User loginUser(String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		User u = new UserDao().loginUser(userId, userPwd, conn);
		
		JDBCTemplate.close(conn);
		
		return u;
	}
	
	public Boolean checkId(String inputId) {
		Connection conn = JDBCTemplate.getConnection();
		
		Boolean flag = new UserDao().checkId(inputId,conn);
		
		
		JDBCTemplate.close(conn);
		return flag;
	}
	
	public User updateUser(User u) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new UserDao().updateUser(conn, u);
		System.out.println("서비스에서 result : "+result);
		User updateUser = null;
		
		if (result > 0) {// 성공
			JDBCTemplate.commit(conn);
			// 갱신된 회원의 정보를 조회하여 반환하기
			// selectMember 메소드를 이용해서 userId만 가지고 회원정보 조회해오기
			updateUser = new UserDao().selectUser(conn, u.getUserId());

		} else { // 실패
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return updateUser;
	}
	
	public int updatePwd(String userId,String userPwd,String updatePwd) {
		//연결객체 얻어오기
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().updatePwd(conn,userId,userPwd,updatePwd);
		
		//dml구문이니 트랜잭션처리할것
		if(result>0) {//성공시 확정
			JDBCTemplate.commit(conn); 
		}else {//실패시 되돌리기
			JDBCTemplate.rollback(conn);
		}
	
		//자원반납
		JDBCTemplate.close(conn); 
		
		return result;
	}
	
	public int deleteUser(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().deleteUser(conn, userId);
		if(result>0) {//성공시 확정
			JDBCTemplate.commit(conn); 
		}else {//실패시 되돌리기
			JDBCTemplate.rollback(conn);
		}
	
		//자원반납
		JDBCTemplate.close(conn); 
		
		return result;
	}
	
	
	//내가 쓴 글  갯수 가져오기 
	public int myBoardListCount(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new UserDao().myBoardListCount(conn,userId);
		JDBCTemplate.close(conn);
		
		return listCount;
	}
	
	//내가 쓴 글들 가져오기 
	public ArrayList<Board> myBoardSelectList(PageInfo pi,String userId) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new UserDao().myBoardSelectList(conn,pi,userId);
		
		//select 구문은 트랜잭션처리 필요없으니 자원반납만 하면 된다
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	//내가 쓴 댓글 개수  가져오기 
	public int myReplyListCount( String userId){
		Connection conn = JDBCTemplate.getConnection();
		int listCount = new UserDao().myReplyListCount(conn,userId);
		JDBCTemplate.close(conn);
		return listCount;
	}
	//아이디찾기
	public User findId(String userName, String userEmail) {
		Connection conn = JDBCTemplate.getConnection();
		User u = new UserDao().findId(userName,userEmail,conn);
		
		JDBCTemplate.close(conn);
		
		return u;
	}
	//비밀번호 찾기
	public User findPwd(String userId, String userName, String userEmail) {
		Connection conn = JDBCTemplate.getConnection();
		User u = new UserDao().findPwd(userId,userName,userEmail,conn);
		
		JDBCTemplate.close(conn);
		return u;
	}
	
	
	//내가 쓴 댓글 가져오기 
	public ArrayList<Reply> myReplySelectList(PageInfo pi,String userId) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Reply> list = new UserDao().myReplySelectList(conn,pi,userId);
		
		//select 구문은 트랜잭션처리 필요없으니 자원반납만 하면 된다
		JDBCTemplate.close(conn);
		
		return list;
	}
	//추천인 제도 구문
	public int recomCheck(String recommender) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new UserDao().recomCheck(recommender,conn);
		
		
		JDBCTemplate.close(conn);
		return result;
	}
	public int boardPointCheck(String boardWriter) {
		Connection conn = JDBCTemplate.getConnection();
		

		int boardPointChecksu = new UserDao().boardPointCheck(boardWriter,conn);
		
		
		if(boardPointChecksu>0) {//성공시 확정
			JDBCTemplate.commit(conn); 
		}else {//실패시 되돌리기
			JDBCTemplate.rollback(conn);
		}
		
		
		JDBCTemplate.close(conn);
		return boardPointChecksu;
	}
	public int replyPoint(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		

		int result = new UserDao().replyPoint(userId,conn);
		
		
		if(result>0) {//성공시 확정
			JDBCTemplate.commit(conn); 
		}else {//실패시 되돌리기
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		System.out.println(result+"Ser");
		return result;
	}
	public int getUserPoint(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int userPoint = new UserDao().getUserPoint(conn, userId);
		
		
		JDBCTemplate.close(conn);
		return userPoint;
	}

	
	
	
	
	
	
	

}
