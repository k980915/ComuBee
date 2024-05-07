<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.contents.model.vo.Contents"%>
<%@page import="com.kh.common.JDBCTemplate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Contents c = (Contents)request.getAttribute("c"); 

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
    <title>COMU-BEE</title>
<style>
   .outer{
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
        .menu{
            height: 50px;
            width: 300px;
            display: flex;
        }
        .menu a{
            text-decoration: none;
            font-size: 20px;
            font-weight: bold;
            display: block;
            width: 100%;
            height: 100%;
            line-height: 50px;
        }
        .menu a:hover{
            background-color: darkgray;
        }
        .menu input{
            width: 50px;
        }

</style>
</head>
<body>
	<%@ include file = "/views/common/header.jsp" %>
	<div class="outer">
	<form action="<%=contextPath%>/main.co">
	<div class="nav-area" align="center">
	        
	        <div class="review">
	             <a href="${contextPath}/list.rv?currentPage=1"><h1>한줄리뷰</h1></a>
	             <label><input type="checkbox">추천순</label>
	             <label><input type="checkbox">최신순</label>
	        </div><br>
	        
	        <table border="1px solid black">
	        
	            <tr style="height: 250px;">
	                <td style="width: 200px;">
	                  <a href="${contextPath}/detail.co?contentsId=${c.contentsId}">
	                	<img src="${c.posterPath}">이미지
	                </a></td>
	                <td style="width: 200px;"><a href="">이미지</a></td>
	                <td style="width: 200px;"><a href="">이미지</a></td>
	            </tr>
	            <tr>
	                <td><a href="${contextPath}/list.rv?currentPage=1">리뷰</a></td>
	                <td><a href="${contextPath}/list.rv?currentPage=1">리뷰</a></td>
	                <td><a href="${contextPath}/list.rv?currentPage=1">리뷰</a></td>
	            </tr>
	            <tr style="height: 250px;">
	                <td style="width: 200px;"><a href="">이미지</a></td>
	                <td style="width: 200px;"><a href="">이미지</a></td>
	                <td style="width: 200px;"><a href="">이미지</a></td>
	            </tr>
	            <tr>
	                <td><a href="${contextPath}/list.rv?currentPage=1">리뷰</a></td>
	                <td><a href="${contextPath}/list.rv?currentPage=1">리뷰</a></td>
	                <td><a href="${contextPath}/list.rv?currentPage=1">리뷰</a></td>
	            </tr>
	        </table> <br><br>
	        
	            <div class="menu">
	                <h1 align="center">오늘의 추천작품</h1>
	            </div>
	        <br><br>
	        <table border="1px solid black">
	            <tr>
	                <td>
	                    <a href=""><img src="" style="height: 400px; width: 400px;"></a>
	                </td>
	                <td style="width: 100px;"></td>
	                <td style="width: 300px;">
	                    줄거리
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <a href=""><img src="" style="height: 400px; width: 400px;"></a>
	                </td>
	                <td style="width: 100px;"></td>
	                <td style="width: 300px;">
	                    줄거리
	                </td>
	            </tr>
	        </table> <br><br>
	        
	            <div class="menu">
	                <h1 align="center">개봉 예정 영화</h1>
	            </div>
	        <br><br>
	        <table>
	            <tr>
	                <td>
	                    <a href=""><img src="" style="height: 200px; width: 200px;"></a>
	                </td>
	                <td></td>
	                <td>
	                    <a href=""><img src="" style="height: 200px; width: 200px;"></a>
	                </td>
	                <td></td>
	                <td>
	                    <a href=""><img src="" style="height: 200px; width: 200px;"></a>
	                </td>
	                <td></td>
	                <td>
	                    <a href=""><img src="" style="height: 200px; width: 200px;"></a>
	                </td>
	                <td></td>
	            </tr>
	            <tr align="center">
	                <td>영</td>
	                <td></td>
	                <td>화</td>
	                <td></td>
	                <td>제</td>
	                <td></td>
	                <td>목</td>
	                <td></td>
	            </tr>
	        </table> <br><br>
	        
	            <div class="menu">
	                <h1 align="center">신작 드라마</h1>
	            </div>
	        <br><br>
	        <table>
	            <tr>
	                <td>
	                    <a href=""><img src="" style="height: 200px; width: 200px;"></a>
	                </td>
	                <td></td>
	                <td>
	                    <a href=""><img src="" style="height: 200px; width: 200px;"></a>
	                </td>
	                <td></td>
	                <td>
	                    <a href=""><img src="" style="height: 200px; width: 200px;"></a>
	                </td>
	                <td></td>
	                <td>
	                    <a href=""><img src="" style="height: 200px; width: 200px;"></a>
	                </td>
	                <td></td>
	            </tr>
	            <tr align="center">
	                <td>신작</td>
	                <td></td>
	                <td>드</td>
	                <td></td>
	                <td>라</td>
	                <td></td>
	                <td>마</td>
	                <td></td>
	            </tr>
	        </table>
	</div>
	
	</form>
	</div>
</body>
<%-- <a href="<%=contextPath %>/detail.co?contentsId=${content.contentsId}"> --%>
<!--                                <img src="/resources/uploadFiles/7.jpg"> -->

</html>