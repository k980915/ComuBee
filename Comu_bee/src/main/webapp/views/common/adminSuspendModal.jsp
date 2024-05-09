<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminSuspendModal</title>
</head>
<body>
	<div align="center">
		<!-- Button to Open the Modal -->
		<button align="center" type="button" class="btn btn-primary"
			data-toggle="modal" data-target="#myModal">회원 정보</button>

		<!-- The Modal -->

		<div class="modal" id="myModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">회원 정보</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<p>이름 : ${list.userName}</p> 
						<br>
						<p>가입일 : ${list.joinDate}</p>
						<br>
						<p>이메일 : ${list.userEmail}</p>
						<br>
						<p>포인트 : ${list.point}</p>
						<br>
						<p>회원 정지 기간</p>
						<form id="suspendDay">
							<!-- Timer를 걸고 진행해야함 -->
							<input type="radio" name="Suspend" id="3day" value="3일" checked>
							<label for="3day"> 3일</label> <br>
							<input type="radio"	name="Suspend" id="10day" value="10일">
							<label for="10day"> 10일 </label> <br>
							<input type="radio"	name="Suspend" id="30day" value="30일">
							<label for="30day">30일 </label> <br>
						</form>
					</div>
					<button type="button" class="btn btn-info" data-dismiss="modal"
						onclick="();">쿠폰 <br>발급</button>
					<br>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" onclick="();">강 제 <br>탈 퇴</button> <br>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal"
							onclick="suspendDays();">정 지</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취	소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function suspendDays() {
			var susDays = $("#suspendDay").val();
			$.ajax({
				url : "suspendDays.ad" ,
				data : {
					susDays : susDays
				},
				error : function() {
					console.log("처리 실패");
				},
				success : function(/* status Timer값 */) {
					
				}
			});
		}
	</script>
</body>
</html>