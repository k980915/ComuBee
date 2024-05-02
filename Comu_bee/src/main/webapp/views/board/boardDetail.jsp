<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.boardBody>div{
	float:left;
	border:1px solid black;
	}

</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
<div class="outer">

	<div class="boardMenuBar">
		<h3>게시판</h3>
		<!-- 게시판 용 메뉴바가 필요하지 않을까 싶은? -->
	</div>
	
	<div class="boardBody">
		<div class="boardMain">
			<div class="boardTitle">
				<table border="1px solid black">
					<thead>
						<tr>
							<td class="boardCategory">[카테고리]</td>
							<td class="boardFreeTitle" colspan="2">제목</td>
							<!-- 관리자 or 작성자라면 게시글 수정/삭제 버튼이 보이게 처리하기 -->
							<c:if test="${loginUser.userId eq admin or loginUser.userId eq b.userId}">
								<td>
									<button type="button" onclick="">수정</button><button type="button" onclick="deleteYN();">삭제</button>
								</td>
							</c:if>
						</tr>
						<tr>
							<td>작성자 : </td>
							<td class="boardWriter" width="300">작성자 아이디</td>
							<td class="boardCount" width="150">조회수 : </td>
							<td class="boardLike" width="100">추천수 : </td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="boardContent" height="400" colspan="4">
								작성내용
							</td>
						</tr>
						<tr>
							<td class="boardSearchTag" colspan="4">
								태그 : 관련검색어 본인이 입력할 수 있게?
							</td>
							<c:if test="${b.category eq 'recommend'}">
								관련 컨텐츠 제목 선택할 수 있는 영역 만들기
							</c:if>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="boardReply">
							
				<table border="1" align="center">
					<thead>
						<c:choose>
							<c:when test="${not empty loginUser}">
								<tr>
									<th>댓글작성</th>
									<td>
										<textarea id="replyContent" rows="3" cols="50" style="resize:none;"></textarea>
									</td>
									<td><button onclick="insertReply();">댓글작성</button></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th>댓글작성</th>
									<td>
										<textarea readonly rows="3" cols="50" style="resize:none;">로그인 후 이용 가능한 서비스입니다.</textarea>
									</td>
									<td><button disabled>댓글작성</button></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</thead>
					<tbody>
						<tr>
							<td>작성자</td>
							<td>내용</td>
							<td>작성일</td>
						</tr>
					
					</tbody>
				</table>
					<script>
						function insertReply(){
							
							$.ajax({
								url : "insertReply.bo",
								type : "post",
								data : {
									content : $("#replyContent").val(),
									bno : ${b.boardNo},
									userNo : "${loginUser.userNo}"
								},
								success : function(result){
									if(result>0){
										alert("댓글 작성 성공");	
										replyList();
									}else{
										alert("작성실패");
									}
									$("#replyContent").val("");
								},
								error : function(){
									console.log("통신 오류")
								}
							
							});
							$(function(){
								replyList();
							});
								
						}
						function replyList(){
							$.ajax({
								url : "replyList.bo",
								data : {
									bno : ${b.boardNo}
								},
								success : function(){
									var tr = "";
									for(var i in rList){
										tr+="<tr>"
											+"<td>"+"<input type='hidden' class='likeCheck' value='0'>"+"</td>"
											+"<td>"+rList[i].replyWriter+"</td>"
											+"<td>"+rList[i].replyContent+"</td>"
											+"<td>"+rList[i].createDate+"</td>"
											+"<td>"+"<button onclick='replyLike();'>"+List[i].like+"</button>"+"</td>"
											+"<td>"+"<button onclick='replyHate();'>"+List[i].hate+"</button>"+"</td>"
											+"</tr>";
									}
									$("#reply-area tbody").html(tr);
								},
								error : function(){
									console.log("통신 오류")
								}
								
							});
							
						}
						function replyLike(){
							var likeCheck = ${this.children().first().val()}
							$.ajax({
								url : "likeReply.bo",
								data : { likeCheck
								},
								success : function(){
									if(likeCheck!=0){
										
									}else{
										
									}
								},
								error : function(){
									colsole.log("통신 오류")
								}
							});
							
						}; 
						function replyUpdate(){
							$.ajax({
								url : "updateReply.bo",
								data : {
									
								}
							})
						}
					</script>
			</div>
		
		
			<div class="boardList">
				<form class="boardListToolBar" action="">
					<!--  검색 기능, 카테고리 별 조회, 추천수 많은 글 조회 등 조회내용 전송용 공간 -->
					<!-- 카테고리 항목 선택 시 해당 카테고리 조회 결과 리스트 조회(비동기통신 이용할 듯) -->
					<select name="categoryList">
						<c:forEach var="c" items="${category}">
							<option value="${c.categoryNo}">"${c.categoryName}"</option>
						</c:forEach>
					</select>
				</form>
				<table border="1px solid black">
					<thead class="boardListToolBar"> 
						<tr>
							<td>
								
							</td>
							<td colspan="6">
							</td>
						</tr>
						<tr>
							<td colspan="6">
								한줄이면 심심하니까 두줄로 예시
							</td>
						</tr>
					</thead>
					<tbody class="boardList">
						<!-- 반복문 활용해서 양식에 따라 자동 작성 -->
						<tr>
							<td>카테고리</td>
							<td>글제목</td>
							<td>작성자</td>
							<td>조회수</td>
							<td>추천</td>
							<td>작성일</td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td>글제목</td>
							<td>작성자</td>
							<td>조회수</td>
							<td>추천</td>
							<td>작성일</td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td>글제목</td>
							<td>작성자</td>
							<td>조회수</td>
							<td>추천</td>
							<td>작성일</td>
						</tr>
					</tbody>
					
				</table>
					
			</div>
		</div>
	</div>
	<div class="boardSide">
		<div class="contentPopUp">
		</div>
		<div class="boardPopUp">
			<h3>신규 게시글</h3>
			<table class="popUp">
				<thead>
					<tr>
						<c:forEach var="c" items="${category}">
							<th>${c.categoryName}<th>
						</c:forEach>
					</tr>
				</thead>
				<tbody>
					<tr></tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- footer 있으면 그대로 다시 따오기 -->

</div>	
</body>
</html>