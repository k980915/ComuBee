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
	        .menu{
	        	display: flex;
	            text-decoration: none;
	            display: block;
	            width: 100%;
	            height: 100%;
	            line-height: 50px;
	            text-align: center;
	        }
	        .menu a{
	        	color:black;
	        }
	    </style>
	</head>
	<body>
	    <%@ include file = "/views/common/header.jsp" %>
	
	    <div class="outer">
	        <form action="${contextPath}/main.co">
	        
	            <div align="center">
	                <div class="menu">
	                    <a href="${contextPath}/list.rv?currentPage=1"><h1>최신 한줄리뷰</h1></a>
	                </div><br>
	
	                <table border="1" id="reviewImg">
					    <tr style="height: 250px;">
					        <c:forEach var="content" items="${conList}" varStatus="loop">
					            <c:if test="${loop.index < 3}">
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
	                    <h1>추천작품</h1>
	                </div>
	                <br><br>
	                <table id="recommend">
					    <c:forEach var="content" items="${conList}" varStatus="loop">
					        <c:if test="${loop.index < 4}">
					            <tr>
					                <td>
					                    <input type="hidden" class="cid" value="${content.contentsId}">
					                    <img src="${content.posterPath}" style="height: 400px; width: 400px;">
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
	                    <h1>평점 상위 컨텐츠</h1>
	                </div>
	                <br><br>
	                <table id="best">
	                    <tr>
	                    <c:forEach var="content" items="${bestList}" varStatus="loop">
				        <c:if test="${loop.index < 4}">
	                        <td>
	                        	<input type="hidden" class="cid" value="${content.contentsId}">
	                            <img src="${content.posterPath}" style="height: 200px; width: 200px;">
	                        </td>
	                        <td style="height: 200px; width: 200px;"></td>
	                    </c:if>
				   		</c:forEach>
	                    </tr>
	                    <tr align="center" id="bestTitle">
	                    <c:forEach var="content" items="${bestList}" varStatus="loop">
					    <c:if test="${loop.index < 4}">
					             <td>${content.title}</td>
					             <td></td>
					    </c:if>
	       				</c:forEach>
	                    </tr>
	                </table> <br><br>
	

	            </div>
	        </form>    
	    </div> <br><br><br>
		   <script>
			    $('#reviewImg img').click(function() {
			        var contentsId = $(this).closest('td').find('.cid').val();
					var posterPath = $(this).attr('src');
					location.href = '${contextPath}/detail.co?contentsId=' + contentsId;
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