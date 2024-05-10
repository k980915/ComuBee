<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.user.model.dao.UserDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/views/common/header.jsp"%>

	

		<table border="1">
			<tbody>
				<h4>비밀번호 찾기</h4>
				<tr>
					<th>아이디</th>
					<td> <input type="text" id="userIdf" required></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="userNamef" required></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" id="userEmailf" required></td>
				</tr>
			<tfoot>
				<tr>
					<td align="center" colspan="2">
						<button type="button" id="findUserPwd" onclick="findUserPwd();">
							<span>비밀번호 찾기</span>
						</button>
					</td>
				</tr>
			</tfoot>
		</table>
		
		
		<Script>
			function findUserPwd(){
				
				var findUserId =$("#userIdf").val();
				var findUserName=$("#userNamef").val();
				var findUserEmail=$("#userEmailf").val();
				console.log(findUserId);
				console.log(findUserName);
				console.log(findUserEmail);
				
				$.ajax({
					url:"${contextPath}/findPwd.us",
					type:"post",
					data:{
						findUserId: findUserId,
						findUserName: findUserName,
						findUserEmail: findUserEmail
					},
					success: function(u){
						
						console.log("통신 성공");
						
						
						alert("사용자의 비밀번호는 "+u+"입니다");
						
					},
					error: function(){
						alert("에러");
					}
					
				});
			}
		
		</Script>

</body>
</html>