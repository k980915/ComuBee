<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.button-container {
	text-align: center; /* Center-align the container */
}

.button-container .button {
	margin-left: 20px;
	/* Adjust the margin to push the buttons to the right */
}
.slide{
	float:right;
}


</style>
</head>
<body>
	<%-- <%@ include file="/views/common/menubar.jsp"%> --%>
	
	<button id="sendView" onclick="sendList();" >내가 보낸 쪽지 </button>
	<button id="receiveView" onclick="receiveList();">내가 받은 쪽지</button>
	<button id="scrabView" onclick="scrabList();">보관함</button>
	<div id="detail-area"></div>
	<div id="messages-area">
		<table border="1" align="center">
			<thead>
				<tr>
					<td>쪽지 번호</td>
					<td>작성자</td>
					<td>받는이</td>
					<td>내용</td>
					<td>작성일</td>
					<td>보관</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<!-- 조회된 데이터가 없을때 -->
						<tr>
							<td colspan="5">새로운 쪽지가 없습니다 </td>
						</tr>
					</c:when>
					<c:otherwise>
						<!-- 조회된 데이터가 있을때 -->
						<c:forEach var="m" items="${list}">
							<tr>
								<td>${m.mNo}</td>
								<td>${m.sendName }</td>
								<td>${m.receiveName}</td>
								<td>${m.messageContent }</td>
								<td>${m.sendDate }</td>
								<td>${m.readCheck }</td>
							</tr>
						</c:forEach> 
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<div>
		<form action="/insertMessage.ms" method="post">
			<div class="message-input-area">
				<label for="name">name</label> 
				<input type="hidden" name="senderId"value="${loginUser.userId}"> 
				<input type="text" id="name" placeholder="받는사람 닉네임" name="receiverId">
			</div>
			<div class="message-input">
				<label for="message">Message</label>
				<textarea id="message" rows="6" name="message"></textarea>
			</div>
			<ul class="action">
				<li><input type="submit" value="sendMessage" /></li>
				<li><input type="reset" value="clear"></li>
			</ul>
		</form>
	</div>
	<br>
	<br>
	<script>	
		function sendList(){
			
			$.ajax({
				url : "selectList.ms",
				type:"post",
				data:{
					decide : "sendView",
					userId : "${loginUser.userId}"
				},
				success : function(list){
					console.log("성공");
					$("#messages-area tbody>tr").remove();
					//전부 추가하기
					var tr = "";
					var div ="";
					console.log(list);
					//전부 추가하기
					for(var i in list){
						tr +="<tr>"
							+"<td>"+ list[i].mNo +"</td>"
							+"<td>"+ list[i].sendName +"</td>"
							+"<td>"+ list[i].receiveName +"</td>"
							+"<td>"+ list[i].messageContent +"</td>"
							+"<td>"+ list[i].sendDate +"</td>"
							+"<td>"+ list[i].scrabCheck +"</td>"
							+"</tr>";
					}
					$("#messages-area tbody").html(tr);
				},
				error : function(){
					console.log("통신오류");
				}
				
			});
		}
		
		function receiveList(){
			
			$.ajax({
				url : "selectList.ms",
				type:"post",
				data:{
					decide : "receiveView",
					userId : "${loginUser.userId}"
				},
				success : function(list){
					console.log("성공");
					$("#messages-area tbody>tr").remove();
					//전부 추가하기
					var tr = "";
					console.log(list);
					//전부 추가하기
					for(var i in list){
						tr +="<tr>"
							+"<td>"+ list[i].mNo +"</td>"
							+"<td>"+ list[i].sendName +"</td>"
							+"<td>"+ list[i].receiveName +"</td>"
							+"<td>"+ list[i].messageContent +"</td>"
							+"<td>"+ list[i].sendDate +"</td>"
							+"<td>"+ list[i].scrabCheck +"</td>"
							+"</tr>";
					}
					
					$("#messages-area tbody").html(tr);
				},
				error : function(){
					console.log("통신오류");
				}
				
			});
		}
		
function scrabList(){
			
			$.ajax({
				url : "selectList.ms",
				type:"post",
				data:{
					decide : "scrabView",
					userId : "${loginUser.userId}"
				},
				success : function(list){
					console.log("성공");
					$("#messages-area tbody>tr").remove();
					//전부 추가하기
					var tr = "";
					console.log(list);
					//전부 추가하기
					for(var i in list){
						tr +="<tr>"
							+"<td>"+ list[i].mNo +"</td>"
							+"<td>"+ list[i].sendName +"</td>"
							+"<td>"+ list[i].receiveName +"</td>"
							+"<td>"+ list[i].messageContent +"</td>"
							+"<td>"+ list[i].sendDate +"</td>"
							+"<td>"+ list[i].scrabCheck +"</td>"
							+"</tr>";
					}
					
					$("#messages-area tbody").html(tr);
				},
				error : function(){
					console.log("통신오류");
				}
				
			});
		}
		$(function(){
			$("table").on("click","tbody>tr",function(){
				
            });
		})
		
	
	</script>
</body>
</html>