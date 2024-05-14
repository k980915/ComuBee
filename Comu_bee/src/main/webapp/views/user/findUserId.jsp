<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.user.model.dao.UserDao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<Style>

	
</Style>
	

<body>
	<%@ include file="/views/common/header.jsp"%>
	<table align="center">
		<tbody>
			<h4 align="center">아이디 찾기</h4>
			<tr>
				<th>이름</th>
				<td><input type="text" id="fuserName" required></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" id="fuserEmail" required></td>
			</tr>
		<tfoot>
			<tr>
				<td align="center" colspan="2">

					<button border="none;" type="button" id="findUserId" onclick="findUserId();">
						<span>아이디 찾기</span>
					</button>
				</td>
			</tr>

		</tfoot>
	</table>




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