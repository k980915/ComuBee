<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/board/board-css/BoardDetail.css?v=1.1">

</head>
<body>
	<%@ include file="/views/board/boardMenuBar.jsp" %>
	
	<div class="boardOuter">
		
		<div class="boardBody">
			<div class="boardMenuBar">
				<h3>${b.category}게시판</h3>
			</div>
			<div class="boardMain">
				<div class="boardTitle">
					<table border="1px solid black">  
						<thead>
							<c:choose>
								<c:when test="${b.category eq '리뷰'}">
									<tr>
										<td>작성자 : </td>
										<td class="boardWriter" width="300">${b.userId}</td>
										<c:if test="${loginUser.userId eq 'admin' or loginUser.userId eq b.userId}">
											<td class="edit-buttons">
												<button type="button" onclick="updateBoard();">수정</button>
												<button type="button" onclick="deleteYN();">삭제</button>
		                                    </td>
										</c:if>
										<td class="boardCount" width="150">조회수 : ${b.count}</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td>제목</td>
										<td class="boardFreeTitle">${b.title}</td>
										<c:if test="${loginUser.userId eq 'admin' or loginUser.userId eq b.userId}">
											<td class="edit-buttons">
												<button type="button" onclick="updateBoard();">수정</button>
												<button type="button" onclick="deleteYN();">삭제</button>
		                                    </td>
										</c:if>
										<td class="boardCreateDate">${b.createDate}</td>
									</tr>
									<tr>
										<td>작성자 : </td>
										<td class="boardWriter" width="300" colspan="${loginUser.userId eq 'admin' or loginUser.userId eq b.userId ? '2' : '1'}">${b.userId}</td>
										<td class="boardCount" width="150">조회수 : ${b.count}</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</thead>
						<tbody>
							<tr>
								<td class="boardContent" height="400" colspan="4">
									<span>${b.boardContent}</span>
								</td>
							</tr>
							<tr align="center">
								<td></td>
								<td> 
									<button class="recommendButton" onclick="recommendBoard();"> 
										<span class="recommendText boardLikeTotal">추천 수 : ${b.boardLike}</span>
										<span class="recommendText">추천하기</span> 
									</button> </td>
								<td> <button class="scrabButton" onclick="scrab();">찜해놓기</button></td>
							</tr>
							<tr>
								<c:if test="${b.category eq '리뷰'}">
									<td class="boardToContent" onclick="location.href='detail.co?contentsId=${b.contentsId}'" colspan="4" align="center">
										<span>보러가기</span>
									</td> 
								</c:if>
							</tr>
							<tr>
								<th>첨부파일</th><!-- 첨부파일이 있는 경우와 없는 경우 처리하기 -->
								<td colspan="3">
									<c:choose>
										<c:when test="${empty at}">
											첨부파일이 없습니다.
										</c:when>
										<c:otherwise>
											<a download="${at.changeName}" href="${contextPath}${at.atFilePath}${at.changeName}">${at.originName}</a>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="boardReply">							
					<table border="1" align="center">
						<c:choose>
							<c:when test="${not empty loginUser}">
								<tr>
									<th style="color:black;">댓글작성</th>
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
									<th style="color:black;">댓글작성</th>
									<td>
										<textarea readonly rows="3" cols="50" style="resize:none;">로그인 후 이용 가능한 서비스입니다.</textarea>
									</td>
									<td><button disabled>댓글작성</button></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<br>
					<table border="1" class="writtenReply" >
						<thead>
							<tr>
								<th class="replyWriter">작성자</th>
								<th class="replyContent">내용</th>
								<th class="replyDate">작성일</th>
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
					<%@ include file="/views/board/listSample.jsp" %>
				</div>
			</div>
		</div>
		
		<div class="boardSide">
			<div class="contentPopUp">
				<h3>컨텐츠</h3>
				<table class="conPopUp">
					<thead>
						<tr>
							<th onclick="searchBestCont();">추천</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${pcList}">
							<tr>
								<td> 
									<img src="${p.posterPath}" style="width: 200px; height: 200px;">								
									<input type=hidden value="${p.contentsId}"> <br>
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
					<thead class="bpbCa">
						<tr>
							<c:forEach var="c" items="${cList}">
								<th>${c.categoryName}</th>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bpb" items="${bpbList}">
						<c:choose>
						<c:when test="${b.category eq '리뷰'}">
							<tr>
								<td colspan="5">${bpb.boardContent}(${bpb.boardLike})
									<input type=hidden value='${bpb.boardNo}'>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">${bpb.title}(${bpb.boardLike})
									<input type=hidden value='${bpb.boardNo}'>
								</td>
							</tr>			
						</c:otherwise>
						</c:choose>
						</c:forEach>	
					</tbody>
				</table>
			</div>
			<div class="newPopUp">
				<h3>신규 게시글</h3>
				<table class="popUp">
					<thead class="npbCa">
						<tr>
							<c:forEach var="c" items="${cList}">
								<th>${c.categoryName}</th>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="npb" items="${npbList}">
						<c:choose>
						<c:when test="${b.category eq '리뷰'}">
							<tr>
								<td colspan="5">${npb.boardContent}
									<input type=hidden value='${npb.boardNo}'>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">${npb.title}
									<input type=hidden value='${npb.boardNo}'>
								</td>
							</tr>			
						</c:otherwise>
						</c:choose>
						</c:forEach>
					</tbody>
				</table>
				


			</div>
		</div>
	
	</div>	
	
	<script>
	var userId11 = "${loginUser.userId}";
		function updateBoard(){
			var bno=${b.boardNo};
			location.href="${contextPath}/update.bo?bno=${b.boardNo}";
		}
		function deleteYN(){
			var result=window.confirm("정말 삭제하시겠습니까?");
			if(result){
				location.href='${contextPath}/delete.bo?bno=${b.boardNo}';
			}
		}

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
					$("#replyContent").val("");
						replyPoint(userId11)
						
						
					}else{
						alert("작성실패리플");
					}
				},
				error : function(){
					console.log("통신 오류")
				}
			
			});
			/* $(function(){
				replyList();
			}); */
				
		}
		function replyPoint(userId11) {
			console.log(userId11);
			$.ajax({
				url : "replyPoint.bo",
				data : {
					userId11 : userId11
				},
				success : function(result){
					if(result>0){
						alert("댓글 작성 완료, 포인트 10포인트 추가");	
						replyList();
					}else{
						alert("작성실패포인트");
					}
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
					if(rList.length==0){
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
            if('${loginUser.userId}'==''){
                alert("찜하기는 로그인 후 이용 가능합니다.");
                return false;
            }
            var msg="";
            $.ajax({
                url : "insertScrab.bo",
                type : "post",
                data : {
                    bno : ${b.boardNo},
                    userId : "${loginUser.userId}"
                },
                success : function(result){
                    if(result>0){
                        msg="찜목록에서 삭제되었습니다.";
                    }else{
                        msg="찜목록에 추가되었습니다.";
                    }
                    alert(msg);
                },
                error : function(){
                    console.log("틀림");
                }
            });
        }
    
		function recommendBoard(){
			if('${loginUser.userId}'==''){
				alert("추천은 로그인 후 이용 가능합니다.");
				return false;
			}
			var msg="";
			$.ajax({
				url : "likeBoard.rb",
				type : "post",
				data : {
					bno : ${b.boardNo},
					userId : "${loginUser.userId}"
				},
				success : function(result){
					if(result>0){
						msg="추천을 취소하였습니다.";
					}else{
						msg="추천을 완료하였습니다.";
					}
					alert(msg);
					likeUpdate();
				},
				error : function(){
					console.log("틀림");
				}
			});
		}
		
		function likeUpdate(){
			var tr="";
			$.ajax({
				url : "likeUpdate.rb",
				data : {
					bno : ${b.boardNo}
				},
				success : function(like){
					$(".boardLikeTotal").text("추천 수 : "+like);
				},
				error : function(){
					console.log("통신 오류")
				}
			})
		}
		$(".bpbCa>tr>th").click(function(){
			var sCategory=$(this).text();
			$.ajax({
				url : "bestPopUp.bo",
				data : {
					sCategory : sCategory
				},
				success : function(bpbList){
					var str = "";
					for(var i in bpbList){
						str+="<tr>"
						+"<td colspan='5'>"+bpbList[i].title+
						"("+bpbList[i].boardLike+")<input type=hidden value='"
						+bpbList[i].boardNo+"'></td>"
						+"</tr>"
					};
					$(".bestPopUp tbody").html(str);
				},
				error : function(){
					console.log("통신오류")
				}					
			});
		})
		
		$(".npbCa>tr>th").click(function(){
			var sCategory=$(this).text();
			$.ajax({
				url : "newPopUp.bo",
				data :{
					sCat : sCategory
				},
				success : function(npbList){
					var str = "";
					for(var i in npbList){
						str+="<tr>"
						+"<td colspan='5'>"+npbList[i].title+
						"<input type=hidden value='"
						+npbList[i].boardNo+"'></td>"
						+"</tr>"
					};
					$(".newPopUp tbody").html(str);
				},
				error : function(){
					console.log("통신오류")
				}
				
			});
		})
		
		$(".popUp tbody").on("click","tr",function(){
			var bno = $(this).children().children().val();
			location.href='detail.bo?bno='+bno;
		})
		$(".conPopUp tbody").on("click","tr",function(){
			var bno = $(this).children().children().eq(1).val();
			location.href='detail.co?contentsId='+bno;
		})						

			</script>
</body>
</html>