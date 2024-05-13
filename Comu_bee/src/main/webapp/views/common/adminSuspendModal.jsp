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


</head>
<body>

<!-- <script>
	$("tbody tr").click(function(){
		var userId = $(this).children().eq(2).text();
			console.log(userId);
			location.href='${contextPath}/userInfoList.ad?userId='+userId;
			
	});

	</script> -->
		<div align="center">
					<h4>회원 정보</h4>

				<!-- list에 값 더 담아 오기 -->
					<p>아이디 : ${listInfo.userId}</p>
					<br>					
					<p>이 름 : ${listInfo.userName}</p>
					<br>
					<p>가입일 : ${listInfo.joinDate}</p>
					<br>
					<p>이메일 : ${listInfo.userEmail}</p>
					<br>
					<p>포인트 : ${listInfo.point}</p>
					<br>
					<p>회원 정지 기간</p>
					<form id="suspendDay">
						<!-- Timer를 걸고 진행해야함 -->
						<input type="radio" name="Suspend" id="3day" value="3day" checked>
						<label for="3day"> 3일</label> <br>
						<input type="radio"name="Suspend" id="10day" value="10day">
						<label for="10day">10일 </label> <br>
						<input type="radio" name="Suspend" id="30day" value="30day">
						<label for="30day">30일 </label> <br>
					</form>
					<br><br>
					
				<button type="button" class="cpCreate">
					쿠폰 <br>발급
				</button>
				<br><br>
				
				<button type="button" onclick="();">
					100포인트 <br>지급
				</button>
				<br><br>
				
				<button type="button" onclick="suspendUser();">
					강 제 <br>탈 퇴
				</button>
				<br><br>
				
				<button type="button" onclick="suspendDays();">
					회 원 <br>정 지
				</button>
				<br><br>
				
				<button type="button" onclick="history.back();">
					뒤 로 <br>가 기
				</button>
				<br>
				
	</div>
	

	<script>
	
	
		function suspendDays() {
			
			var susDays = $("input[name='Suspend']:checked").val();
		    var userIdval = "${listInfo.userId}";
		    //console.log(susDays, userIdval);
		    
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
						alert(userIdval+"님을 "+susDays+"동안 정지시켰습니다.")
					}else{
						alert("정지를 실패했습니다.")
					}
				}
			});
		}
		

		function suspendUser() {
			
		    var userIdval = "${listInfo.userId}";
		    console.log(userIdval);
		    
			$.ajax({
				url : "suspend.ad" ,
				data : {
					userIdval : userIdval
				},
				error : function() {
					console.log("처리 실패");
				},
				success : function(result) {
					if(result>0){
						alert(userIdval+"님을 강제 탈퇴 시켰습니다.")
					}else{
						alert("강제 탈퇴를 실패했습니다.")
					}
				}
			});
		}
		/* function createCoupon() {
			var userIdval = "${listInfo.userId}";
			var couponStr = "7L+g7Y+w7J2AIOyXhuyKteuLiOuLpC4="
			location.href='/Comu_bee/messageMain.ms?userId='+'admin';
			console.log(userIdval,couponStr);
		} */
		/* function createCoupon() {
		    // userIdval 및 couponStr 값 설정
		    var userIdval = "${listInfo.userId}";
		    var couponStr = "7L+g7Y+w7J2AIOyXhuyKteuLiOuLpC4=";

		    // 새로운 URL 생성
		    var newUrl = '/Comu_bee/messageMain.ms?userId=admin&userIdval=' + userIdval + '&couponStr=' + couponStr;
		
		    // 새로운 URL로 이동
		    location.href = newUrl;
		    redirectToSendMessagePage();
		} */
		$(".cpCreate").click(function () {
			var userIdval = "${listInfo.userId}";
		    var couponStr = "7Lg7Yw7J2AIOyXhuyKteuLiOuLpC4=";

		    // 새로운 URL 생성
		    var newUrl = '/Comu_bee/cpCreate.ad?userId=admin&userIdval=' + userIdval + '&couponStr=' + couponStr;
		    location.href = newUrl;
		})

	</script>

</body>
</html>