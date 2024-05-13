<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/board/board-css/BoardDetail.css">


</head>
<body>
	<%@ include file="/views/board/boardMenuBar.jsp" %>
	
	<div class="boardOuter">
		
		<div class="boardBody">
			<div class="boardMenuBar">
				<h3>${category}게시판</h3>
				<!-- 게시판 용 메뉴바가 필요하지 않을까 싶은? -->
			</div>
			<div class="boardMain">
				<div class="boardTitle">
					<table border="1px solid black">  
						<thead>
							<tr>
								<c:if test="${category ne 'REVIEW'}">
									<td class="boardCategory">[카테고리]</td>
									<td class="boardFreeTitle" colspan="2">제목</td>
								</c:if>
								<td class="boardCreateDate">작성일 : ${b.createDate}</td>
								<!-- 관리자 or 작성자라면 게시글 수정/삭제 버튼이 보이게 처리하기 -->
								<c:if test="${loginUser.userId eq 'admin' or loginUser.userId eq b.userId}">
									<td>
										<button type="button" onclick="updateBoard();">수정</button><button type="button" onclick="deleteYN();">삭제</button>
											<script>
												function updateBoard(){
													var bno=${b.boardNo};
													location.href="${contextPath}/update.bo?bno=${b.boardNo}"
												}
												function deleteYN(){
													var result=window.confirm("정말 삭제하시겠습니까?");
													if(result){
														location.href='${contextPath}/delete.bo?bno=${b.boardNo}';
													}
												}
											</script>
									</td>
								</c:if>
							</tr>
							<tr>
								<td>작성자 : </td>
								<td class="boardWriter" width="300">"${b.userId}"</td>
								<td class="boardCount" width="150">조회수 : ${b.count}</td>
								<td class="boardLike" width="100">추천수 : ${b.boardLike}</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="boardContent" height="400" colspan="4">
									<span>${b.boardContent }</span>
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td> <button onclick="recommendBoard();">추천하기</button> </td>
								<td> <button onclick="scrab();">찜해놓기</button></td>
							</tr>
							<tr>
								<td class="boardSearchTag" colspan="4">
									태그 : 관련검색어 본인이 입력할 수 있게?
								</td>
								<c:if test="${b.category eq 'RECOMMEND'}">
									<td class="boardToContent" onclick="${contextPath}/">
										${b.contentsId} 보러가기
									</td> 
								</c:if>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="boardReply">							
					<table border="1" align="center">
						<c:choose>
							<c:when test="${not empty loginUser}">
								<tr>
									<th>댓글작성</th>
									<td>
										<textarea id="replyContent" rows="3" cols="50" style="resize:none;"></textarea>
									</td>
									<td>
										<button onclick="insertReply();">댓글작성</button>
									</td>
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
					</table>
					<table border="1" align="center" class="writtenReply">
						<thead>
							<tr>
								<td class="replyWriter">작성자</td>
								<td class="replyContent">내용</td>
								<td class="replyDate">작성일</td>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${rList}" var="r">
							<tr>
								<td>${r.userId}</td>
								<td>${r.replyContent}</td>
								<td>${r.createDate}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
						
				</div>
			
			
				<div class="boardList">
					<form class="boardListToolBar" action="">
						<!--  검색 기능, 카테고리 별 조회, 추천수 많은 글 조회 등 조회내용 전송용 공간 -->
						<!-- 카테고리 항목 선택 시 해당 카테고리 조회 결과 리스트 조회(비동기통신 이용할 듯) -->
						<select name="categoryList">
							<c:forEach var="c" items="${cList}">
								<option value="${c.categoryNo}">"${c.categoryName}"</option>
							</c:forEach>
						</select>
					</form>
					<%@ include file="/views/board/listSample.jsp" %>
				</div>
			</div>
		</div>
		
		<div class="boardSide">
			<div class="contentPopUp">
				<h3>컨텐츠</h3>
				<table class="popUp">
					<thead>
						<tr>
							<th onclick="searchBestCont();">추천</th>
							<th onclick="searchNewCont();">최신</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${bestContList}">
							<tr>
								<td> <input type=hidden value='${p.contentsId}'> </td>
								<td>

								</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>		
			</div>
			<div class="bestPopUp">
				<h3>인기 게시글</h3>
				<table class="popUp">
					<thead>
						<tr>
							<c:forEach var="c" items="${cList}">
								<th onclick="searchBestCat();">${c.categoryName}<th>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${bestPopList}">
							<tr>
								<td> <input type=hidden value='${p.boardNo}'> </td>
								<td>${p.title}</td>
								<td>(${p.like})</td><!-- 추천수 표시 -->
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
			<div class="newPopUp">
				<h3>신규 게시글</h3>
				<table class="popUp">
					<thead>
						<tr>
							<c:forEach var="c" items="${cList}">
								<th onclick="searchNewCat();">${c.categoryName}<th>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${newPopList}">
							<tr>
								<td> <input type=hidden value='${p.boardNo}'> </td>
								<td>${p.title}</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
<%--				<script>
				function searchBestCont(){
					$.ajax({
						url : "bestPopUp.co",
						success : function(list){
							var str = "";
							for var(i=0;i<list.length;i++){
								str+="<tr>"
								+"<td>"+list[i].title+"</td>"
								+"</tr>"
							}
							${".contentPopUp thead"}.html(str);
						},
						error : function(){
							console.log("통신오류")
						}
						
					});
				}
				function searchNewCont(){
					$.ajax({
						url : "newPopUp.co",
						success : function(list){
							var str = "";
							for var(i=0;i<list.length;i++){
								str+="<tr>"
								+"<td>"+list[i].title+"</td>"
								+"</tr>"
							}
							${".contentPopUp thead"}.html(str);
						},
						error : function(){
							console.log("통신오류")
						}
						
					});
				}
				function searchNewCat(){
					$.ajax({
						url : "newPopUp.bo",
						success : function(list){
							var str = "";
							for var(i=0;i<list.length;i++){
								str+="<tr>"
								+"<td>"+list[i].title+"</td>"
								+"</tr>"
							}
							${".newPopUp thead"}.html(str);
						},
						error : function(){
							console.log("통신오류")
						}
						
					});
				}
				function searchBestCat(){
					$.ajax({
						url : "bestPopUp.bo",
						success : function(list){
							var str = "";
							for var(i=0;i<list.length;i++){
								str+="<tr>"
								+"<td>"+list[i].title+"</td>"
								+"</tr>"
							}
							${".bestPopUp thead"}.html(str);
						},
						error : function(){
							console.log("통신오류")
						}
						
					});
				}
					
					$(".popUp>tbody>tr").click(function(){
						var bno = $(this).children.eq(0).text();
						location.href='<%=contextPath%>/detail.bo?bno='+bno;
						})

				</script>
--%>
			</div>
		</div>
		<!-- footer 있으면 그대로 다시 따오기 -->
	
	</div>	
	
	<script>
							function insertReply(){
								
								$.ajax({
									url : "insertReply.bo",
									type : "post",
									data : {
										content : $("#replyContent").val(),
										bno : ${b.boardNo},
										userId : "${loginUser.userId}"
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
								var tr="";
								$.ajax({
									url : "replyList.bo",
									data : {
										bno : ${b.boardNo}
									},
									success : function(rList){
										if(${empty rList}){
											tr="<tr>"
												+"<td span='3'>"
												+"현재 댓글이 없습니다."
												+"</td>"
												+"</tr>";
										}else{
											for(var i in rList){
												tr+="<tr>"
													+"<td>"+rList[i].userId+"</td>"
													+"<td>"+rList[i].replyContent+"</td>"
													+"<td>"+rList[i].createDate+"</td>"
													+"</tr>";
										}
									}
										$(".writtenReply tbody").html(tr);
										},
									error : function(){
										console.log("통신 오류")
									}
									
								});
								
							}
							
							function scrab(){
								$.ajax({
									url : "insertScrab.sc",
									type:"post",
									data : {
										bno : ${b.boardNo}, 
										userId :"${loginUser.userId}"
									},
									success : function(str){
										console.log(str)
										},
									error : function(){
										console.log("통신 오류")
									}
									
								});
								
							}

						</script>
</body>
</html>