<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>

<style>
* {
	margin: 6px;
	color: black;
}

table {
	margin: 0 auto;
}

#userId {
	width: 175px;
	height: 40px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

#userPwd {
	width: 175px;
	height: 40px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

#pwChk {
	width: 175px;
	height: 40px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

#userName {
	width: 175px;
	height: 40px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

#email {
	width: 175px;
	height: 40px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

#birth {
	width: 175px;
	height: 40px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

#recommender {
	width: 175px;
	height: 40px;
	font-size: 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}

.radio_box {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	position: relative;
	padding-left: 25px;
	margin-right: 10px;
	cursor: pointer;
	font-size: 14px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.gradient-btn {
	display: inline-block;
	padding: 1em 2em;
	border-radius: 20px;
	color: #b2876f;
	margin-top: 2rem;
	font-weight: bold;
	font-size: 20;
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
}
</style>
<body>
	<%@ include file="/views/common/header.jsp"%>



	<div class="center">
		<h2 align="center" style="color: black;">회원가입</h2>
		<br> <br>
		<form id="enroll-form" action="<%=contextPath%>/insert.us "
			method="post">
			<table>

				<tr>
					<td>* 아이디</td>
					<td><input type="text" name="userId" id="userId" required
						placeholder="아이디를 입력해주세요."></td>
					<td>&nbsp; &nbsp;</td>
					<td><button type="button" onclick="idCheck();"
							class="btn btn-outline-dark">중복확인</button></td>

				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" name="userPwd" id="userPwd" oninput="pwCheck()"
						required></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				<tr>
					<td>* 비밀번호 확인</td>
					<td><input type="password" name="pwChk" id="pwChk"  required></td>
					<td></td>
					<td> <span id="pwConfirm"></span></td>
				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="userName" id="userName" required></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				<tr>
					<td>*이메일</td>
					<td><input type="email" name="email" id="email"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				<tr>
					<td>*생년월일</td>
					<td><input type="text" name="birth" id="birth"
						placeholder="8자리를 입력하세요" maxlength="8" required></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				<tr>
					<td id="gender">성별</td>
					<td><input type="radio"
						style="width: 20px; height: 20px; border: 1px; accent-color: black;"
						name="gender" id="M" value="M" checked><label for="M">남자</label>
						<input type="radio" name="gender"
						style="width: 20px; height: 20px; border: 1px; accent-color: black;"
						id="F" value="F"> <label for="F">여자</label></td>
				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				<tr>
					<td>추천인</td>
					<td><input type="text" id="recommender" name="recommender">
						<button type="button" onclick="recomCheck();"
							class="btn btn-outline-dark">확 인</button></td>
				</tr>
			</table>
			<br> <br>
			<div align="center">
				<button id="sign" type="submit" class="gradient-btn" disabled>회원가입</button>
				<button type="reset" class="gradient-btn">초기화</button>
			</div>
			<br> <br> <br> <br>
		</form>

	</div>



	<script>
		function idCheck() {
			var inputId = $("#userId").val();
			
			
		        
			console.log(inputId);
			
			
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
						if (confirm("사용할 수 있는 아이디입니다")) {
							$("#sign").removeAttr("disabled"); //비활성화
							$("#userId").attr("readonly", true); //아이디 수집 못하도록 변경
						} else {
							$("#userId").focus();
						}
					}
				}
			});

		}
	</script>
		


	<script>
		function recomCheck() {
			var recommender = $("#recommender").val();
			$.ajax({
				url : "${contextPath}/recomCheck.us",
				data : {
					recommender : recommender
				},
				success : function(result) {
					console.log("결과:" + result);
					if (result == "NNNNN") {
						alert("추천인이 존재합니다.")
						$("#recommender").attr("readonly", true); //변경 못하도록
					} else {
						if (confirm("해당 아이디를 가진 추천인이 없습니다.")) {
						} else {
							$("#recommender").focus();
						}
					}
				},
				error : function() {

				}
			});
		}
	</script>
	
	<script>
	
	function pwChk(){
	    if($('#userPwd').val() == $('#pwChk').val()){
	        $('#pwConfirm').text('비밀번호 일치').css('color', 'green')
	    }else{
	        $('#pwConfirm').text('비밀번호 불일치').css('color', 'red')
	    }
	}
	</script>


</body>
</html>









