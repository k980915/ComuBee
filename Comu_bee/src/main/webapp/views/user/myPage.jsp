<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/views/common/admin-css/AdminMyPage.css">

<style>
table.type03 {	
	text-align: left;
	margin: 0px auto;
	color: black;
}

table.type03 th {
	width: 147px;
	padding: 10px;
	font-weight: bold;
	
	color: black;
}

table.type03 td {
	width: 220px;
	padding: 10px;
	vertical-align: top;
}

#input1 {
	width: 200px;
	height: 50px;
	font-size: 15px;
	border: none;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
}
#fst {
    background-color: #8F684F;
    color: black;
    width: 367px;
    text-align: center;
    margin: 0 auto;
    border :1px solid black;
}
.type03, .type03 td, .type03 tr{
	background-color: #FAF0E0;
	border:1.5px solid brown;
}
.type03 th{
	text-align:center;
}

</style>

</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<%
	//menubar에 loginUser변수가 이미 있기때문에 중복된다.
	//로그인 되어있는 회원정보를 화면에 보여주기  
	//session 영역에 담겨있는  loginUser 정보를 추출하기 
	//Member loginUser = (Member)session.getAttribute("loginUser");
	String userId = loginUser.getUserId();
	String userName = loginUser.getUserName();
	%>

	<div class="outer">
		<br>
		<div id="fst">
			<h2>마이페이지</h2>
		</div>
		

		<form id="myPage-form" action="${contextPath}/update.us" method="post">
			<!-- 아이디,비밀번호,이름,전화번호,주소,취미,이메일 -->
			<table class="type03" align="center">
				<tr>
					<th scope="row">아 이 디</th>
					<td><input id="input1" type="text" name="userId"
						value="${loginUser.userId}"></td>
				</tr>
				<tr>
					<th scope="row">이 름</th>
					<td><input id="input1" type="text" name="userName"
						value="${loginUser.userName}"></td>
				</tr>
				<tr>
					<th scope="row">성 별</th>
					<td><input id="input1" type="text" name="gender"
						value="${loginUser.userGender}"></td>
				</tr>
				<tr>
					<th scope="row">생 일</th>
					<td><input id="input1" type="text" name="birth"
						value="${loginUser.userBirth}" readonly></td>
				</tr>
				<tr>
					<th scope="row">이 메 일</th>
					<td><input id="input1" type="email" name="email"
						value="${loginUser.userEmail}"></td>
				</tr>
				<tr>
					<th scope="row">가 입 일</th>
					<td><input id="input1" type="text" name="joinDate"
						value="${loginUser.joinDate}" readonly></td>
				</tr>
				<tr>
				<th scope="row">포 인 트</th>
					<td>
						<h4>${userPoint}</h4>
					</td>
				</tr>
			</table>
			<br> <br>

			<div align="center">
				<button type="submit" class="btn btn-light">정보변경</button>
				<button type="button" class="btn btn-light" data-toggle="modal"
					data-target="#updatePwdForm">비밀번호변경</button>
				<button type="button" class="btn btn-light" data-toggle="modal"
					data-target="#deleteForm">회원탈퇴</button>
					<br><br>
					<a href="${contextPath}/myBoardList.us?myBoardCurrentPage=1&userId=${loginUser.userId}" style="color:black;"> 내가 쓴 글 &nbsp;</a><label style="color:black;">&nbsp; | &nbsp;</label> 
					<a href="${contextPath}/myReplylist.us?myReplyCurrentPage=1&userId=${loginUser.userId}" style="color:black;"> 내가 쓴 댓글 &nbsp;</a><label style="color:black;">&nbsp; | &nbsp;</label>
					<a href="${contextPath}/messageMain.ms?messageNewCurrentPage=1&userId=${loginUser.userId}" style="color:black;"> 쪽 지 &nbsp;</a><label style="color:black;">&nbsp; | &nbsp;</label>
					<a href="${contextPath}/scrabList.sc?myScrabCurrentPage=1&userId=${loginUser.userId}" style="color:black;"> 찜	목 록 &nbsp;</a><label style="color:black;">&nbsp; | &nbsp;</label>
		
			</div>
		</form>
		<br>
	</div>




	<!-- admin 제한 설정 -->
	<%
	if ((loginUser != null) && loginUser.getUserId().equals("admin")) {
	%>
	<%@ include file="/views/common/myPageadmin.jsp"%><br>
	<%@ include file="/views/common/hitsGraph.jsp"%>
	<%
	}
	%>

	<div class="modal" id="updatePwdForm">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">비밀번호 변경</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<!-- 요청 매핑주소 : updatePwd.me 
	      	   컨트롤러 : PwdUpdateController
	      	   메소드명 : updatePwd()
	      	   변경할 비밀번호와 변경할 비밀번호 확인이 일치할때만 서버에 전송될수있도록 함수작성
	      	   변경해야할 회원의 식별자가 있어야만 해당 회원 비밀번호 변경가능
	      	   방법 2가지 
	      	   1번. form에 숨겨서 보내기 (type="hidden")
	      	   2번. 컨트롤러에서 로그인정보에서 꺼내기 (session에서 loginUser)
	       -->
				<div class="modal-body" align="center">
					<form action="${contextPath}/updatePwd.us" method="post">
						<!-- 현재 비밀번호,변경할 비밀번호,변경할 비밀번호 재입력 -->
						<!-- 회원의 아이디를 전송하기 (hidden) - 식별자용도 -->
						<!-- 사용자에겐 보이지 않지만 서버엔 전송될수 있는 타입 -->
						<input type="hidden" name="userId" value="${loginUser.userId }">

						<table>
							<tr>
								<td>현재 비밀번호</td>
								<td><input type="password" name="userPwd" required>
								</td>
							</tr>
							<tr>
								<td>변경할 비밀번호</td>
								<td><input type="password" name="updatePwd" required>
								</td>
							</tr>
							<tr>
								<td>변경할 비밀번호 확인</td>
								<td><input type="password" id="chkPwd" required></td>
							</tr>
						</table>
						<br>
						<button type="submit" class="btn btn-secondary"
							onclick="return checkPwd();">비밀번호 변경</button>
					</form>

				</div>

				<script>
	      		function checkPwd(){
	      			//변경할 비밀번호와 비밀번호 확인이 일치하는지 체크하기
	      			var updatePwd = $("input[name=updatePwd]").val();
	      			var checkPwd = $("#chkPwd").val();
	      			  
	      			//비교후 같으면 true 다르면 false 를 반환하여 기본이벤트 막아주기
	      			
	      			if(updatePwd != checkPwd){
	      				alert("변경할 비밀번호와 확인이 일치하지 않습니다.");
	      				return false;
	      			}
	      		}
	      </script>

				<!--  Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>


	<!-- 회원탈퇴 모달용 영역 -->
	<div class="modal" id="deleteForm">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" align="center">회원 탈퇴</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body" align="center">
					<form action="${contextPath}/delete.us" method="post">
						<!-- 식별자용 아이디 전달하기 -->
						<input type="hidden" name="userId" value="${loginUser.userId}">
						<table>
							<tr>
								<td>현재 비밀번호 :</td>
								<td><input type="password" id="deletePwd" required>
								</td>
							</tr>
						</table>
						<br>
						<button type="submit" class="btn btn-danger"
							onclick="return deleteMember();">회원탈퇴</button>
					</form>
				</div>

				<script>
	      		function deleteMember(){
	      			//현재 입력한 비밀번호와 세션에 담겨있던 비밀번호가 일치한다면 
	      			//정말 탈퇴할것인지 물어보고 그에 따른 처리하기 
	      			var inputPwd = $("#deletePwd").val();
	      			var userPwd = "<%=loginUser.getUserPwd()%>";
					

						//사용자가 입력한 비밀번호랑 세션 로그인정보에 있는 비밀번호와 일치한다면 
						if (inputPwd == userPwd) {

							//var flag = confirm("정말로 탈퇴하실건가요? 탈퇴 후 복구는 불가능합니다.");

							// 	      				if(!flag){
							// 	      					return false;
							// 	      				}
							// 					  return flag?true:false;

							return confirm("정말로 탈퇴하실건가요? 탈퇴 후 복구는 불가능합니다.");
						} else {
							alert("비밀번호가 일치하지 않습니다.");
							return false;
						}

					}
				</script>


				<!--  Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

</body>
</html>