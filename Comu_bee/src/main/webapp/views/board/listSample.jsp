<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>리스트 양식</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/board/board-css/ListSample.css">

    <style>
        .pagination a {
            color: black; 
        }
    </style>

</head>

<body>
				

    <canvas class="my-4 w-100" id="myChart" width="10000" height="380"></canvas>



    <div class="table-responsive small">
        <table class="table table-striped table-sm table-hover">
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">글쓴이</th>
                    <c:if test="${loginUser.userId eq 'admin'}">
                    <th scope="col" style="width : 100px; height">관리</th>
                    </c:if>
                    <th scope="col">작성일</th>
                    <th scope="col">조회수</th>
                    <th scope="col" class="text-center">추천</th>
                </tr>
                
            	<c:if test="${not category eq '공지'}">
            		<c:forEach items="${noList}" var="li">
	            		<tr>
				             <td class="text-center">${li.boardNo }</td>
				             <td>${li.title}</td>
				             <td>${li.userId}</td>
				             <td>${li.createDate}</td>
				             <td>${li.count }</td>
				             <td class="text-center">${li.boardLike}</td>
				        </tr>
            		</c:forEach>
            	</c:if>
            	
            </thead>
            <tbody>
            	<c:choose>
            		<c:when test="${not empty list}">
            			<tr> <td><input type="hidden" name="list" value="${list}"></td></tr>
		            	<c:forEach items="${list}" var="li">
					        <tr>
			                    <td class="text-center">${li.boardNo}</td>
			                    <td class="boardListTitle">${li.title}</td>
			                    <td id="adminuserId" >${li.userId}</td>
								
								<c:if test="${loginUser.userId eq 'admin'}">
									<td>
				                    <button type="button" class="adminBtn" style="font-size: 16px; background-color: orange; border: none; padding: 8px 16px; border-radius: 4px;">
									    회원 정보
									</button>
									</td>		                   
								</c:if>
			                    <td>${li.createDate}</td>
			                    <td>${li.count }</td>
			                    <td class="text-center">${li.boardLike}</td>
			                  
			                </tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">조회된 데이터가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>	

            </tbody>
        </table>
    </div>
<nav aria-label="Page navigation example" style="text-align: center;">
    <ul class="pagination justify-content-center">
        	<c:if test="${pi.currentPage gt 1}">
	            <li class="page-item">
	                <button aria-label="Previous" onclick="prev();">
	                    <span aria-hidden="true">&laquo;</span>
	                    <span class="sr-only">Previous</span>
	                </button>
	            </li>
        	</c:if>
            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
           		<li class="page-item">
           			<button class="page-link">${i}</button>
           		</li>
            </c:forEach>
	           <c:if test="${pi.currentPage lt pi.maxPage}">
           		<li class="page-item">
	                <button aria-label="Next" onclick="next();">
	                    <span aria-hidden="true">&raquo;</span>
	                    <span class="sr-only">Next</span>
	                </button>
	            </li>
            </c:if>
            
        </ul>
    </nav>
    
    
    
    <script>
    	$(".boardListTitle").click(function(){
    		var bno = $(this).siblings().eq(0).text();
    		location.href='${contextPath}/detail.bo?bno='+bno;
    	});
		$(".page-link").click(function(){
			var btnNo=Number($(this).text());
			location.href='list.${cat}?currentPage='+btnNo;
		});
		var currentPage=${pi.currentPage};
		function prev(){
			location.href='list.${cat}?currentPage='+(currentPage-1);
		}
		function next(){
			location.href='list.${cat}?currentPage='+(currentPage+1);
		}
		$(".adminBtn").click(function () {
			var adminuserId = $("#adminuserId").text();
			console.log(adminuserId);
			location.href='${contextPath}/userInfoList.ad?userId='+adminuserId;
				
		})


		
	</script>
	

	
	
<div class="container mt-4">
    <form action="${pageContext.request.contextPath}/board.se" method="get">
        <div class="input-group mb-3">
            <input type="text" name="title" class="form-control" placeholder="게시글 검색" aria-label="게시글 검색" aria-describedby="button-addon2">
            <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
        </div>
    </form>
</div>

</body>
</html>