<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.user.model.dao.UserDao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

#fuserName {
	width: 175px;
	height: 35px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

#fuserEmail {
	width: 175px;
	height: 35px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

.gradient-btn {
	display: inline-block;
	padding: 1em 2em;
	border-radius: 20px;
	color: #b2876f;
	margin-top: 2rem;
	font-weight: bold;
	font-size: 15px;
	letter-spacing: 2px;
	text-transform: uppercase;
	text-decoration: none;
	background: linear-gradient(to right, rgba(#b2876f, 0) 25%,
		rgba(#b2876f, .8) 75%);
	background-position: 1% 50%;
	background-size: 400% 300%;
	border: 1px solid #b2876f; @ include transition; &: hover { color :
	white;
	color: #fff;
	background-position: 99% 50%;
	width: 100px;
}

	
</style>

	

<body>
	<%@ include file="/views/common/header.jsp"%>
	<table align="center">
		<tbody>
			<h4 align="center">아이디 찾기</h4> <br>
			<tr>
				<th>이름 &nbsp;</th>
				<td><input type="text" id="fuserName" required></td> 
			</tr>
			<tr>
				<td>&emsp;</td>
			</tr>
			
			
			<tr>
				<th>이메일 &nbsp;</th>
				<td><input type="email" id="fuserEmail" required></td>
			</tr>
			
		 	
			<tr>
				<td align="center" colspan="2">
						<br>
					<button type="button" id="findUserId" onclick="findUserId();" style="border:none;" class="gradient-btn">
						<span">아이디 찾기</span>
					</button>
				</td>
			</tr>

		
	</table>

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	


	<script>
		function findUserId() {
			var findUserName = $("#fuserName").val();
			var findUserEmail = $("#fuserEmail").val();
			console.log(findUserName);
			console.log(findUserEmail);

			$.ajax({
				url : "${contextPath}/findId.us",
				type : "post",
				data : {

					findUserName : findUserName,
					findUserEmail : findUserEmail
				},
				success : function(userId) {

					console.log("통신 성공");

					var alertMessage = "사용자 아이디는 " + userId + "입니다";

					alert(alertMessage);

				},
				error : function() {
					alert("다시 입력하세요");
				}
			});
		}
	</script>



</body>
</html>