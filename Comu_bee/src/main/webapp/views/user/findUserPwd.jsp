<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/views/common/header.jsp"%>

	<form action="<%=contextPath%>/findPwd.us" method="post">

		<table border="1">
			<tbody>
				<h4>비밀번호 찾기</h4>
				<tr>
					<th>아이디</th>
					<td> <input type="text" id="userId" required></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="userName" required></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="userEmail" required></td>
				</tr>
			<tfoot>
				<tr>
					<td align="center" colspan="2">
						<button type="submit" id="findUserId" onclick="findUserId()">
							<span>비밀번호 찾기</span>
						</button>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>

</body>
</html>