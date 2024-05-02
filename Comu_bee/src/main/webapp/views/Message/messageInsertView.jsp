<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%@ include file="/views/common/menubar.jsp"%>
<%
	//menubar에 loginUser변수가 이미 있기때문에 중복된다.
	//로그인 되어있는 회원정보를 화면에 보여주기 
	//session 영역에 담겨있는 loginUser 정보를 추출하기 
	//Member loginUser = (Member)session.getAttribute("loginUser");
	String userId = loginUser.getUserId();
	String userName = loginUser.getUserName();
	int userNo=loginUser.getUserNo();
	
	
	
	//아래에 있는 데이터는 필수 입력요소가 아니기 때문에 해당 데이터가 존재하지 않을 수 있음 null일수있음
	//삼항연산자를 이용해서 처리해주기 
	String phone = loginUser.getPhone() == null? "" :loginUser.getPhone();
	String email = loginUser.getEmail() == null? "" : loginUser.getEmail();
	String address = loginUser.getAddress() == null? "" : loginUser.getAddress();
	String interest = loginUser.getInterest() ==null? "" : loginUser.getInterest();//운동,게임,영화
	%>    	 --%>


<form action="/messageService.ms" method="post">
	<div class="message-input">
		<label for="name">name</label>
		<input type="hidden" name="senderId" <%-- value="<%=userId%>" --%>>
		<input type="text" id="name" placeholder="받는사람 닉네임" name="receiverId">
	</div>
	<div class="message-input">
		<label for="message">Message</label>
		<textarea id="message" rows="6" name="message"></textarea>
	</div>
	<ul class="action">
		<li><input type="submit" value="sendMessage"/></li>
		<li><input type="reset" value="clear"></li>
	</ul>
</form>
</body>
</html>