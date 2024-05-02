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
	<div class="center"></div>
	<h2 align="center">회원가입</h2>
	<form id="enroll-form" action="<%=contextPath%>/insert.us "
		method="post">
		<table>
			<!-- (tr>td*3)*8 -->
			<tr>
				<td>* 아이디</td>
				<td><input type="text" name="userId" id="userId" required
					placeholder="아이디를 입력해주세요."></td>
				<td><button type="button" onclick="idCheck();">중복확인</button></td>



			</tr>
			<tr>
				<td>* 비밀번호</td>
				<td><input type="password" name="userPwd" required
					></td>
				<td></td>
			</tr>
			<tr>
				<td>* 비밀번호확인</td>
				<td><input type="password" id="pwChk" required></td>
				<td></td>
			</tr>
			<tr>
				<td>* 이름</td>
				<td><input type="text" name="userName" required></td>
				<td></td>
			</tr>

			<tr>
				<td>*이메일</td>
				<td><input type="email" name="email"></td>
				<td></td>
			</tr>

			<tr>
				<td>*생년월일</td>
				<td><input type="text" name="birth" placeholder="8자리를 입력하세요" required></td>
				<td></td>
			</tr>
		<tr>
			<td id="gender">성별 <input type="radio" name="gender" id="M"
				value="M"> <label for="M">남자</label> <input type="radio"
				name="gender" id="F" value="F"> <label for="F">여자</label>
			</td>
		</tr>

		
		<tr>
			<td>추천인 <input type="text" id="recommender">
			</td>
		</tr>
		</table>

		<br> <br>

		<div align="center">
			<button type="submit" disabled>회원가입</button>
			<button type="reset">초기화</button>
		</div>




	</form>

	<script>
		function idCheck() {

			var inputId = $("#userId").val();

			$.ajax({
				url : "${contextPath}/idCheck.us",
				data : {
					inputId : inputId
				},
				success : function(result) {
					console.log("결과:" + result);
					if (result == "NNNNN") {

						alert("이미 존재하는 아이디입니다.")
					} else {
						if (confirm("정말 사용하시겠습니까?")) {

							$("#enroll-form :submit").removeAttr("disabled"); //비활성화
							$("#userId").attr("readonly", true); //아이디 수집 못하도록 변경
						} else {
							$("#userId").focus();
						}
					}
				},
				error : function() {
				}

			});
		}
	</script>

</body>
</html>