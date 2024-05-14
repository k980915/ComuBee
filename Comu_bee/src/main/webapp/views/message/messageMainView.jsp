<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/board/board-css/ListSample.css">
	<title>Insert title here</title>
	<style>
		.button-container {
				text-align: center; /* Center-align the container */
			}

		.button-container .button {
				margin-left: 20px;
				/* Adjust the margin to push the buttons to the right */
			}

		.slide {
				float: right;
			}
		.pagination a {
            	color: black; 
        	}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>

	<button class="btn btn-outline-secondary create-post-button" id="sendView" onclick="sendList();">내가 보낸 쪽지</button>
	<button class="btn btn-outline-secondary create-post-button" id="receiveView" onclick="receiveList();">내가 받은 쪽지</button>
	<!-- <button id="scrabView" onclick="scrabList();">보관함</button> -->	
	<div id="messages-area" class="table-responsive small">
		<table border="1" align="center" class="table table-striped table-sm table-hover">

			<thead>
				<tr>
					<td>쪽지 번호</td>
					<td>작성자</td>
					<td>받는이</td>
					<td>내용</td>
					<td>작성일</td>
					<td>확인여부</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<!-- 조회된 데이터가 없을때 -->
						<tr>
							<td colspan="5">새로운 쪽지가 없습니다</td>
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
		<form action="<%=contextPath%>/sendMessage.ms" method="post">
			<div class="message-input-area">
				<label for="name">name</label> <input type="hidden" name="senderId"
					value="${loginUser.userId}"> <input type="text" id="name"
					placeholder="받는사람 닉네임" name="receiverId">
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
		function sendList() {

			$.ajax({
				url : "selectList.ms",
				type : "post",
				data : {
					decide : "sendView",
					userId : "${loginUser.userId}"
				},
				success : function(list) {
					console.log("성공");
					//전부 추가하기
					var tr = "";
					var div = "";
					console.log(list);
					//전부 추가하기

					for ( var i in list) {
						tr += "<tr>" + "<td>" + list[i].mNo + "</td>" + "<td>"
								+ list[i].sendName + "</td>" + "<td>"
								+ list[i].receiveName + "</td>" + "<td>"
								+ list[i].messageContent + "</td>" + "<td>"
								+ list[i].sendDate + "</td>" + "<td>"
								+ list[i].readCheck + "</td>" + "</tr>";
					}
					$("#messages-area tbody").html(tr);
				},
				error : function() {
					console.log("통신오류");
				}

			});
		}

		function receiveList() {

			$
					.ajax({
						url : "selectList.ms",
						type : "post",
						data : {
							decide : "receiveView",
							userId : "${loginUser.userId}"
						},
						success : function(list) {
							console.log("성공");
							$("#messages-area tbody>tr").remove();
							var tr = "";
							if (list == null) {
								tr += "<tr>" + "<td>" + "조회된 메시지가 없습니다"
										+ "</td>"
							} else {
								console.log(list);
								//전부 추가하기
								for ( var i in list) {
									var messageContent = list[i].messageContent.length > 10 ? list[i].messageContent
											.substring(0, 10)
											+ "..."
											: list[i].messageContent;
									tr += "<tr>" + "<td>" + list[i].mNo
											+ "</td>" + "<td>"
											+ list[i].sendName + "</td>"
											+ "<td>" + list[i].receiveName
											+ "</td>" + "<td>" + messageContent
											+ "</td>" + "<td>"
											+ list[i].sendDate + "</td>"
											+ "<td>" + list[i].readCheck
											+ "</td>" + "</tr>";
								}

								$("#messages-area tbody").html(tr);
							}

						},
						error : function() {
							console.log("통신오류");
						}

					});
		}

		/* function scrabList(){
		
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
		 var messageContent = list[i].messageContent.length > 10 ? list[i].messageContent.substring(0, 10) + "..." : list[i].messageContent;
		 tr +="<tr>"
		 +"<td>"+ list[i].mNo +"</td>"
		 +"<td>"+ list[i].sendName +"</td>"
		 +"<td>"+ list[i].receiveName +"</td>"
		 +"<td>"+ messageContent +"</td>"
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
		 } */
		$("table").on(
				"click",
				"tbody>tr",
				function(event) {
					if ($(event.target).is('td')
							&& $(event.target).index() >= 0
							&& $(event.target).index() <= 4) {
						var messageId = $(this).find("td:first").text();
						var check = $(this);
						$.ajax({
							url : "updateReadCheck.ms",
							type : "post",
							data : {
								messageId : messageId,
								userId : "${loginUser.userId}"
							},
							success : function(result) {
								// 업데이트가 성공하면 필요에 따라 여기서 추가 작업을 수행할 수 있습니다
								if (result > 0) {
									check.remove();
								}
							},
							error : function() {

							}
						});
					}
				});

		$("table").on("click", "tbody>tr", function(event) {
			if ($(event.target).is('td') && $(event.target).index() >= 5) {
				var messageId = $(this).find("td:first").text();
				var scrabCheck = $(this).find("td:last").text();
				var check = $(this);
				$.ajax({
					url : "updateScrabCheck.ms",
					type : "post",
					data : {
						messageId : messageId,
						userId : "${loginUser.userId}",
						scrabCheck : scrabCheck
					},
					success : function(result) {
						// 업데이트가 성공하면 필요에 따라 여기서 추가 작업을 수행할 수 있습니다
						if (result > 0) {
							check.remove();
						}
					},
					error : function() {

					}
				});
			}
		});

		
	</script>
</body>
</html>
