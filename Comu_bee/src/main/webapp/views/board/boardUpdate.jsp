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
		height:100%;
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
					<form action="${contextPath}/update.bo" method="post" enctype="multipart/form-data">
						<input type="hidden" name="boardNo" value="${b.boardNo}">
						<input type="hidden" name="boardCategory" value="${category}">
						<table border="1px solid black">
							<thead>
								<c:if test="${category ne '리뷰'}">
									<tr>
										<th>제목</th>
										<td class="boardFreeTitle" colspan="4">
											<input type="text" name="title" required value="${b.title}">
										</td>
										
									</tr>
								</c:if>
								<tr>
									<th>작성자 : </th>
									<td class="boardWriter" width="300">${b.userId} </td>
									<td class="boardCount" width="150">조회수 : ${b.count} </td>
									<td class="boardLike" width="100">추천수 : ${b.boardLike} </td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="boardContent" height="400" colspan="4">
									<textarea name="content" rows="10" style="resize:none;" required>${b.boardContent}</textarea>
									</td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3">
										<c:if test="${at!=null}">
											${at.originName}
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
									<c:if test="${category eq 'RECOMMEND'}">
										관련 컨텐츠 제목 선택할 수 있는 영역 만들기
									</c:if>
								</tr>
							</tbody>
						</table>
						<div class="submitBtnArea" align="center">
							<button type="submit">수정하기</button>
							<button type="reset" onclick="location.href=''">취소하기</button>
						</div>
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
								$.ajax({
									url : "replyList.bo",
									data : {
										bno : ${b.boardNo}
									},
									success : function(){
											var tr="";
										if(rList.length==0){
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
						<c:forEach var="p" items="${pcList}">
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
					<thead class="bpbCa">
						<tr>
							<c:forEach var="c" items="${cList}">
								<th>${c.categoryName}</th>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bpb" items="${bpbList}">
							<tr>
								<td colspan="5">${bpb.title}(${bpb.boardLike})
									<input type=hidden value='${bpb.boardNo}'>
								</td><!-- 추천수 표시 -->
							</tr>
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
							<tr>
								<td colspan="5">${npb.title}
									<input type=hidden value='${npb.boardNo}'>
								</td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
				


			</div>
		</div>
	
	</div>	
	
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
        function scrabUpdate(){
            var tr="";
            $.ajax({
                url : "scrabUpdate.sc",
                data : {
                    bno : ${b.boardNo}
                },
                success : function(like){
                    $(".boardLikeTotal").text(like);
                },
                error : function(){
                    console.log("통신 오류");
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
								
// 			function searchBestCont(){
// 				$.ajax({
// 					url : "PopUp.co",
// 					data : {
// 						search : "best"
// 					},
// 					success : function(pcList){
// 						var str = "";
// 						for(var i in pcList){
// 							str+="<tr>"
// 							+"<td>"+pcList[i].title+
// 							"<input type=hidden value='"
// 							+pcList[i].boardNo+"'></td>"
// 							+"</tr>"
// 						};
// 						$(".contentPopUp thead").html(str);
// 					},
// 					error : function(){
// 						console.log("통신오류")
// 					}
					
// 				});
// 			}
// 			function searchNewCont(){
// 				$.ajax({
// 					url : "PopUp.co",
// 					data : {
// 						search : "new"
// 					},
// 					success : function(pcList){
// 						var str = "";
// 						for(var i in pcList){
// 							str+="<tr>"
// 							+"<td>"+pcList[i].title+
// 							"<input type=hidden value='"
// 							+pcList[i].boardNo+"'></td>"
// 							+"</tr>"
// 						};
// 						$(".contentPopUp thead").html(str);
// 					},
// 					error : function(){
// 						console.log("통신오류")
// 					}
					
// 				});
// 			}
			</script>
</body>
</html>