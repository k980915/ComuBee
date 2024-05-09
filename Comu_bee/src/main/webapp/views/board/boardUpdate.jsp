<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.boardOuter{
		width:100%;
		}
	.boardOuter>div{
		display:inline;
		border:1px solid black;
		float:left;
		box-sizing:border-box;
		margin:0px;
		padding:0px;
	}

	.boardMain>*{
		width:100%;
		margin:0px;
		padding:0px;
	}
	.boardBody{
		width:70%
	}
	.boardSide{
		width:30%;
	}


</style>
</head>
<body>
	<%@ include file="/views/board/boardMenuBar.jsp" %>
	
	<div class="boardOuter">
		
		<div class="boardBody">
			<div class="boardMenuBar">
				<h3>게시글 수정</h3>
				<!-- 게시판 용 메뉴바가 필요하지 않을까 싶은? -->
			</div>
			<div class="boardMain">
				<div class="boardContent">
					<form action="${contextPath}/update.bo">
						<input type="hidden" name="boardNo" value="${b.boardNo}">
						<table border="1px solid black">
							<thead>
								<tr>
									<td class="boardCategory">"${boardCategory}"</td>
									<td class="boardFreeTitle" colspan="2">
										<input type="text" name="title" required value="${b.boardTitle}">
									</td>
									
								</tr>
								<tr>
									<td>작성자 : </td>
									<td class="boardWriter" width="300">"${list.userId}"</td>
									<td class="boardCount" width="150">조회수 : ${list.count}</td>
									<td class="boardLike" width="100">추천수 : ${list.like}</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="boardContent" height="400" colspan="4">
										<textarea name="content" rows="10" style="resize:none" required>${b.boardcontent}</textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3">
										<c:if test="${at!=null}">
											${at.originName}
											<!-- 게시글에 첨부 파일이 있었던 경우, 해당 첨부 파일 정보를 등록한 DB에 있는 정보에 수정이 일어나야 한다.
												 때문에 해당 데이터 식별자 용으로 fileNo를 전달해야 하고 또한 서버에 업로드된 파일이 필요 없어졌으니
												 삭제를 위해 해당 파일명이 필요하다(서버에 업로드된 파일명)
											 -->
											 <input type="hidden" name="originFileNo" value="${at.atNo}">
											 <input type="hidden" name="originFileName" value="${at.changeName}">
										</c:if>
											<input type="file" name="reUploadFile">					
									</td>
								</tr>
								<tr>
									<td class="boardSearchTag" colspan="4">
										태그 : 관련검색어 본인이 입력할 수 있게?
									</td>
									<c:if test="${b.category eq 'RECOMMEND'}">
										관련 컨텐츠 제목 선택할 수 있는 영역 만들기
									</c:if>
								</tr>
							</tbody>
						</table>
					</form>
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
											var tr="";
										if(rList.isEmpty()){
											tr="<tr>"
												+"<td span='3'>
												+"현재 댓글이 없습니다."
												+"</td>"
												+"</tr>";
										}else{
											for(var i in rList){
												tr+="<tr>"
													+"<td>"+rList[i].replyWriter+"</td>"
													+"<td>"+rList[i].replyContent+"</td>"
													+"</tr>";
										}
									}
										$("#boardReply tbody").html(tr);
										},
									error : function(){
										console.log("통신 오류")
									}
									
								});
								
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
									<img src="${contextPath}${p.thumbnailImg}"width="200px" height="150px"> <br>
									${p.title}
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
							<c:forEach var="c" items="${category}">
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
							<c:forEach var="c" items="${category}">
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
</body>
</html>