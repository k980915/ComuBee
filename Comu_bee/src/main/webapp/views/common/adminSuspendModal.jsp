<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.user.model.vo.User"%>
	<%
	//로그인 정보 추출하기 
	User listInfo = (User)session.getAttribute("listInfo");
	%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminSuspendModal</title>
</head>
<body>

	
		<!-- Button to Open the Modal -->
		<button align="center" type="button" class="btn btn-primary" id="listInfo"
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
					
				<!-- list에 값 더 담아 오기 -->
					<div class="modal-body">  
						<p>아이디 : ${li.userId}</p> 
						<br>
						<p>이 름 : ${listInfo.userName}</p> 
						<br>
						<p>가입일 : asd</p>
						<br>
						<p>이메일 : asd</p>
						<br>
						<p>포인트 : asd</p>
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

	<script>
	
	
		function suspendDays() {
			var susDays = $("#suspendDay").val();
			var userIdval = ${li.userId};
			$.ajax({
				url : "suspendDays.ad" ,
				data : {
					susDays : susDays,
					userIdval : userIdval
				},
				error : function() {
					console.log("처리 실패");
				},
				success : function(result) {
					if(result>0){
						alert(userIdval+"님을 "+susDays+"정지했습니다.")
					}else{
						alert("정지를 실패했습니다.")
					}
				}
			});
		}
		

		
	</script>

</body>
</html>