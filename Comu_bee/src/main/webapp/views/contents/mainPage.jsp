<%@page import="java.util.Random"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.contents.model.vo.Contents"%>
<%@page import="com.kh.common.JDBCTemplate"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
		ArrayList<Contents> conList = (ArrayList<Contents>)request.getAttribute("conList");
		ArrayList<Contents> bestList = (ArrayList<Contents>)request.getAttribute("bestList");
		
		Collections.shuffle(conList, new Random());
		

	%>
	
	<!DOCTYPE html>
	<html>
	<head>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	    <!-- Latest compiled and minified CSS -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	    <!-- Popper JS -->
	    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	    <!-- Latest compiled JavaScript -->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	    <meta charset="UTF-8">
	    <title>Main Page</title>
	    <style>
	        .outer {
	            margin: auto;
	            margin-left: 300px;
	            margin-right: 300px;
	        }
	        .menu {
	            display: flex;
	            align-items: center;
	        }
	        .menu label {
	            margin-left: 10px;
	        }
	        .menu {
	            height: 50px;
	            width: 300px;
	            display: flex;
	        }
	        .menu a {
	            text-decoration: none;
	            font-size: 20px;
	            font-weight: bold;
	            display: block;
	            width: 100%;
	            height: 100%;
	            line-height: 50px;
	        }
	        .menu a:hover {
	            background-color: darkgray;
	        }
	        .menu input {
	            width: 50px;
	        }
	    </style>
	</head>
	<body>
	    <%@ include file = "/views/common/header.jsp" %>
	
	    <div class="outer">
	        <form action="${contextPath}/main.co">
	        
	            <div class="nav-area" align="center">
	                <div class="review">
	                    <a href="${contextPath}/list.rv?currentPage=1"><h1>한줄리뷰</h1></a>
	                </div><br>
	
	                <table border="1" id="reviewImg">
					    <tr style="height: 250px;">
					        <c:forEach var="content" items="${conList}" varStatus="loop">
					            <c:if test="${loop.index < 3}">
					                <td style="width: 300px; height: 250px;">
					                    <input type="hidden" class="cid" value="${content.contentsId}">
					                    <img src="${contextPath}${content.posterPath}" style="width: 100%; height: 100%;">
					                    
					                </td>
					            </c:if>
					        </c:forEach>
					    </tr>
					    <tr>
					        <td><a href="${contextPath}/list.rv?currentPage=1">리뷰</a></td>
					        <td><a href="${contextPath}/list.rv?currentPage=1">리뷰</a></td>
					        <td><a href="${contextPath}/list.rv?currentPage=1">리뷰</a></td>
					    </tr>
					    <tr style="height: 250px;">
					        <c:forEach var="content" items="${conList}" varStatus="loop">
					            <c:if test="${loop.index >= 3 && loop.index < 6}">
					                <td style="width: 300px; height: 250px;">
					                    <input type="hidden" class="cid" value="${content.contentsId}">
					                    <img src="${content.posterPath}" style="width: 100%; height: 100%;">
					                </td>
					            </c:if>
					        </c:forEach>
					    </tr>
					    <tr>
					        <td><a href="${contextPath}/list.rv?currentPage=1">리뷰</a></td>
					        <td><a href="${contextPath}/list.rv?currentPage=1">리뷰</a></td>
					        <td><a href="${contextPath}/list.rv?currentPage=1">리뷰</a></td>
					    </tr>
					</table> <br><br>
	
	                <div class="menu">
	                    <h1 align="center">랜덤 추천작품</h1>
	                </div>
	                <br><br>
	                <table id="recommend">
					    <c:forEach var="content" items="${conList}" varStatus="loop">
					        <c:if test="${loop.index < 4}">
					            <tr>
					                <td>
					                    <input type="hidden" class="cid" value="${content.contentsId}">
					                    <img src="${contextPath}${content.posterPath}" style="height: 400px; width: 400px;">
					                </td>
					                <td style="width: 100px;"></td>
					                <td style="width: 300px;">
					                    ${content.overView}
					                </td>
					            </tr>
					        </c:if>
					    </c:forEach>
					</table> <br><br>
						
	                <div class="menu">
	                    <h1 align="center">평점 상위 컨텐츠</h1>
	                </div>
	                <br><br>
	                <table id="best">
	                    <tr>
	                    <c:forEach var="content" items="${bestList}" varStatus="loop">
				        <c:if test="${loop.index < 4}">
	                        <td>
	                        	<input type="hidden" class="cid" value="${content.contentsId}">
	                            <img src="${contextPath}${content.posterPath}" style="height: 200px; width: 200px;">
	                        </td>
	                        <td style="height: 200px; width: 200px;"></td>
	                    </c:if>
				   		</c:forEach>
	<!--                         <td> -->
	<!--                             <img src="" style="height: 200px; width: 200px;"> -->
	<!--                         </td> -->
	<!--                         <td></td> -->
	<!--                         <td> -->
	<!--                            <img src="" style="height: 200px; width: 200px;"> -->
	<!--                         </td> -->
	<!--                         <td></td> -->
	<!--                         <td> -->
	<!--                             <img src="" style="height: 200px; width: 200px;"> -->
	<!--                         </td> -->
	<!--                         <td></td> -->
	                    </tr>
	                    <tr align="center" id="bestTitle">
	                        <c:forEach var="content" items="${bestList}" varStatus="loop">
					        <c:if test="${loop.index < 4}">
					             <td>${content.title}</td>
					             <td></td>
					        </c:if>
	       					</c:forEach>
	<!--                         <td>화</td> -->
	<!--                         <td></td> -->
	<!--                         <td>제</td> -->
	<!--                         <td></td> -->
	<!--                         <td>목</td> -->
	<!--                         <td></td> -->
	                    </tr>
	                </table> <br><br>
	
<!-- 	                <div class="menu"> -->
<!-- 	                    <h1 align="center">신작 드라마</h1> -->
<!-- 	                </div> -->
<!-- 	                <br><br> -->
<!-- 	                <table> -->
<!-- 	                    <tr> -->
<!-- 	                        <td> -->
<!-- 	                            <a href=""><img src="" style="height: 200px; width: 200px;"></a> -->
<!-- 	                        </td> -->
<!-- 	                        <td></td> -->
<!-- 	                        <td> -->
<!-- 	                            <a href=""><img src="" style="height: 200px; width: 200px;"></a> -->
<!-- 	                        </td> -->
<!-- 	                        <td></td> -->
<!-- 	                        <td> -->
<!-- 	                            <a href=""><img src="" style="height: 200px; width: 200px;"></a> -->
<!-- 	                        </td> -->
<!-- 	                        <td></td> -->
<!-- 	                        <td> -->
<!-- 	                            <a href=""><img src="" style="height: 200px; width: 200px;"></a> -->
<!-- 	                        </td> -->
<!-- 	                        <td></td> -->
<!-- 	                    </tr> -->
<!-- 	                    <tr align="center"> -->
<!-- 	                        <td>신작</td> -->
<!-- 	                        <td></td> -->
<!-- 	                        <td>드</td> -->
<!-- 	                        <td></td> -->
<!-- 	                        <td>라</td> -->
<!-- 	                        <td></td> -->
<!-- 	                        <td>마</td> -->
<!-- 	                        <td></td> -->
<!-- 	                    </tr> -->
<!-- 	                </table> -->
	            </div>
	        </form>    
	    </div>
		   <script>
			    $('#reviewImg img').click(function() {
			        var contentsId = $(this).closest('td').find('.cid').val();
					var posterPath = $(this).attr('src');
					location.href = '${contextPath}/detail.co?contentsId=' + contentsId;
					console.log(contentsId);
					console.log(posterPath);
					
			    });
			    
			    $('#recommend img').click(function() {
		            var contentsId = $(this).closest('td').find('.cid').val();
		            var posterPath = $(this).attr('src');
		            location.href = '${contextPath}/detail.co?contentsId=' + contentsId;
		        });
			    
			    $('#best img').click(function() {
		            var contentsId = $(this).closest('td').find('.cid').val();
		            var posterPath = $(this).attr('src');
		            location.href = '${contextPath}/detail.co?contentsId=' + contentsId;
		        });
			    
			</script>
	
	
	</body>
	</html>
