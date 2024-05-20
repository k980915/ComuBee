<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/views/board/board-css/ListSample.css">
<title>Insert title here</title>
<style>
.button-container {
	text-align: center; /* Center-align the container */
}

.button-container .button {
	margin-left: 20px;
	/* Adjust the margin to push the buttons to the right */
}

.readCheck:hover {
	cursor: pointer;
}

.slide {
	float: right;
}

.pagination a {
	color: black;
}

#messages-area-1, #messages-area-2 {
	margin-bottom: 0; /* 두 번째 테이블과의 하단 간격 제거 */
}

#tarea {
	padding: 10px;
	color: #666;
	border: 1px solid #ddd;
	background-color: #FAF0E0;
}


</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	<div class="container mt-4">
		<button class="btn btn-outline-secondary create-post-button"
			id="sendView" onclick="sendList();">내가 보낸 쪽지</button>
		<button class="btn btn-outline-secondary create-post-button"
			id="receiveView" onclick="receiveList();">내가 받은 쪽지</button>
		<button class="btn btn-outline-secondary create-post-button"
			id="writeMessage" onclick="writeMessage();">쪽지 쓰기</button>

		<div id="messages-area-1" class="table-responsive small">
			<table border="1" align="center"
				class="table table-striped table-sm table-hover">

				<thead>
					<tr>
						<th>쪽지 번호</th>
						<th>작성자</th>
						<th>받는이</th>
						<th>작성일</th>
						<th>확인여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text-center">${ms.mNo}</td>
						<td class="boardListTitle">${ms.sendName }</td>
						<td>${ms.receiveName}</td>
						<td>${ms.sendDate }</td>
						<td class="readCheck">${ms.readCheck }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="messages-area-2" class="table-responsive small"
			style="white-space: pre-line;" align="center">
			${ms.messageContent}</div>
		<script>
			$(".readCheck").click(function() {
				var messageId = ${ms.mNo};
				var check = $(this);
				$.ajax({
					url : "updateReadCheck.ms",
					type : "post",
					data : {
						messageId : messageId,
						userId : "${loginUser.userId}"
					},
					success : function(result) {
						console.log("업데이트성공");
						// 업데이트가 성공하면 필요에 따라 여기서 추가 작업을 수행할 수 있습니다
						if (result > 0) {
							// 'Y'로 값을 변경합니다.
							check.text('Y');
						}
					},
					error : function() {
						// 에러 처리
					}
				});
			});
			function sendList() {
				location.href = 'sendList.ms?userId=${loginUser.userId}&sendListCurrentPage=1';
			}
			function receiveList() {
				location.href = 'receiveList.ms?userId=${loginUser.userId}&receiveListCurrentPage=1';
			}
			function writeMessage() {
				location.href = 'goSendMessageForm.ms?userId=${loginUser.userId}';
			}
		</script>
		<br> <br> <br> <br> <br> <br>
		<div align="center">
			<a
				href="${contextPath}/myBoardList.us?myBoardCurrentPage=1&userId=${loginUser.userId}"
				style="color: white;"> 내가 쓴 글 &nbsp;</a><label style="color: white;">&nbsp;
				| &nbsp;</label> <a
				href="${contextPath}/myReplylist.us?myReplyCurrentPage=1&userId=${loginUser.userId}"
				style="color: white;"> 내가 쓴 댓글 &nbsp;</a><label
				style="color: white;">&nbsp; | &nbsp;</label> <a
				href="${contextPath}/messageMain.ms?messageNewCurrentPage=1&userId=${loginUser.userId}"
				style="color: white;"> 쪽 지 &nbsp;</a><label style="color: white;">&nbsp;
				| &nbsp;</label> <a
				href="${contextPath}/scrabList.sc?myScrabCurrentPage=1&userId=${loginUser.userId}"
				style="color: white;"> 찜 목 록 &nbsp;</a><label style="color: white;">&nbsp;
				| &nbsp;</label>
		</div>
		</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
</body>
</html>
