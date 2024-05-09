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
				<h4>아이디 찾기</h4>
				<tr>
					<th>이름</th>
					<td><input type="text" id="fuserName"  required></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" id="fuserEmail" required></td>
				</tr>
			<tfoot>
				<tr>
					<td align="center" colspan="2">
					
						<button type="button" id="findUserPwd" onclick="findUserPwd();">
							<span>아이디 찾기</span>
						</button>
					</td>
				</tr>

			</tfoot>
		</table>




	<script>
		function findUserPwd() {

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
				success : function(result) {

					console.log("통신 성공");
					alert("사용자 아이디는 "+result+"입니다");

				},
				error : function() {
					alert("오류 발생");
				}
			});
		}
	</script>



</body>
</html>