<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.user.model.vo.User"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminSuspendModal</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background-color:  #E6D5B5;
	font-family: Arial, sans-serif;
}

.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
}

h3 {
	margin-top: 20px;
	margin-bottom: 20px;
	color: #007bff;
}

button {
	margin-top: 10px;
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button.cpCreate {
	background-color: #007bff;
	color: #fff;
}

button.cpCreate:hover {
	background-color: #0056b3;
}

button.suspendUser {
	background-color: #dc3545;
	color: #fff;
}

button.suspendUser:hover {
	background-color: #c82333;
}

button.suspendDays {
	background-color: #ffc107;
	color: #212529;
}

button.suspendDays:hover {
	background-color: #e0a800;
}

button.goBack {
	background-color: #6c757d;
	color: #fff;
}

button.goBack:hover {
	background-color: #5a6268;
}

p {
	margin-bottom: 10px;
	line-height: 1.5;
}

table {
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #dddddd;
}

label {
	font-size: 18px;
	line-height: 2rem;
	padding: 0.2em 0.4em;
}

[type="radio"], span {
	vertical-align: middle;
}

[type="radio"] {
	appearance: none;
	border: max(2px, 0.1em) solid gray;
	border-radius: 50%;
	width: 1.25em;
	height: 1.25em;
	transition: border 0.5s ease-in-out;
}

[type="radio"]:checked {
	border: 0.4em solid tomato;
}

[type="radio"]:focus-visible {
	outline-offset: max(2px, 0.1em);
	outline: max(2px, 0.1em) dotted tomato;
}

[type="radio"]:hover {
	box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
}
</style>
</head>
<body>
	<div class="container">
		<div align="center">
			<h3>회원 정보</h3>

			<!-- list에 값 더 담아 오기 -->
			<table>
				<tr>
					<td align="center">아 이 디</td>
					<td>${listInfo.userId}</td>
				</tr>
				<tr>
					<td align="center">이 름</td>
					<td>${listInfo.userName}</td>
				</tr>
				<tr>
					<td align="center">가 입 일</td>
					<td>${listInfo.joinDate}</td>
				</tr>
				<tr>
					<td align="center">이 메 일</td>
					<td>${listInfo.userEmail}</td>
				</tr>
				<tr>
					<td align="center">포 인 트</td>
					<td>${listInfo.point}</td>
				</tr>
			</table>
			<br>
			<p>회원 정지 기간</p>
			<form id="suspendDay">
				<!-- Timer를 걸고 진행해야함 -->
				<input type="radio" name="Suspend" id="3day" value="3day" checked>
				<label for="3day"> 3일</label><br> <input type="radio"
					name="Suspend" id="10day" value="10day"> <label for="10day">10일
				</label><br> <input type="radio" name="Suspend" id="30day"
					value="30day"> <label for="30day">30일</label><br>
			</form>
			<br> <br>

			<button type="button" class="cpCreate">
				쿠폰 <br>발급
			</button>


			<button style="margin-left: 50px" type="button" class="suspendUser"
				onclick="suspendUser();">
				강 제 <br>탈 퇴
			</button>

			<button style="margin-left: 50px" type="button" class="suspendDays"
				onclick="suspendDays();">
				회 원 <br>정 지
			</button>

			<button style="margin-left: 50px" type="button" class="goBack"
				onclick="history.back();">
				뒤 로 <br>가 기
			</button>
			<br>

		</div>
	</div>

	<script>
		function suspendDays() {

			var susDays = $("input[name='Suspend']:checked").val();
			var userIdval = "${listInfo.userId}";
			//console.log(susDays, userIdval);

			$.ajax({
				url : "suspendDays.ad",
				data : {
					susDays : susDays,
					userIdval : userIdval
				},
				error : function() {
					console.log("처리 실패");
				},
				success : function(result) {
					if (result > 0) {
						alert(userIdval + "님을 " + susDays + "동안 정지시켰습니다.")
					} else {
						alert("정지를 실패했습니다.")
					}
				}
			});
		}

		function suspendUser() {

			var userIdval = "${listInfo.userId}";
			console.log(userIdval);

			$.ajax({
				url : "suspend.ad",
				data : {
					userIdval : userIdval
				},
				error : function() {
					console.log("처리 실패");
				},
				success : function(result) {
					if (result > 0) {
						alert(userIdval + "님을 강제 탈퇴 시켰습니다.")
					} else {
						alert("강제 탈퇴를 실패했습니다.")
					}
				}
			});
		}

		$(".cpCreate")
				.click(
						function() {
							var userIdval = "${listInfo.userId}";
							var couponStr = "7Lg7Yw7J2AIOyXhuyKteuLiOuLpC4=";
							var str = "운영자가 " + userIdval
									+ "님에게 500포인트를 차감하고 쿠폰을 보냈습니다. 쿠폰번호 : "
									+ couponStr;
							var newUrl = '/Comu_bee/cpCreate.ad';
							$.ajax({
								url : "cpCreate.ad",
								data : {
									userIdval : userIdval,
								},
								error : function() {
									//console.log("포인트 차감 에러");

								},
								success : function(result) {
									//console.log("포인트 차감 성공");
									if (result > 0) {
										console.log("result:" + result)
										cpCreatea(userIdval, str);

									} else {
										alert(userIdval + "님의 포인트가 부족합니다.")
										console.log(result);

									}
								}

							});
						});

		function cpCreatea(userIdval, str) {
			var result = 1;
			$.ajax({
				url : "sendMessage.ms",
				type : "post",
				data : {
					senderId : "${loginUser.userId}",
					receiverId : userIdval,
					message : str
				},
				error : function() {
					console.log("쿠폰 쪽지 발급 에러");
					alert(userIdval + "님에게 " + "쿠폰을 발급 에러")
				},
				success : function() {
					if (result > 0) {
						console.log("쿠폰 쪽지 지급 성공" + result);
						alert(userIdval + "님에게 " + "쿠폰을 발급 성공 했습니다.")
					}
				}
			});
		}
	</script>

</body>
</html>