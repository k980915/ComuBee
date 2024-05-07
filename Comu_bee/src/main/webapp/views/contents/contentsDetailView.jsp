<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.contents.model.vo.Contents"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Contents> list = (ArrayList<Contents>)request.getAttribute("list");
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>contentDetail</title>
    <style>

        .menu {
        display: flex;
        align-items: center;
        }

        .menu label {
            margin-left: 10px; 
        }

    </style>
</head>
<body>
<%@include file="/views/common/header.jsp" %>

	  <div class="outer">
	  
	  	<form id="detail-form" action="<%=contextPath%>/detail.co">

	  	
	        <table style="width: 100%;">
	        <%if(!list.isEmpty()){ %>
	        	<%for(Contents c : list) { %>
	            <tr>
	                <td rowspan="3" style="width: 50%; height: 600px;"><img src="" style="height: 800px; width: 100%;"></td>
	                <td rowspan="3" style="width: 10%;"></td>
	                <td colspan="3" style="width: 30%; height: 10px;" align="center"><h1><%= c.getTitle() %></h1></td>
	                
	            </tr>
	            <tr>
	                <td colspan="4" style="height: 10px;" align="center"><h2><%= c.getEnglishTitle() %></h2></td>
	            </tr>
	            <tr>
	                <td colspan="3" rowspan="2">
	                    <table border="1" style="height: 600px;"> 
	                        <tr>
	                            <th style="height: 100px;"><a href="">작품정보</a></th>
	                            <th><a href="">커뮤니티</a></th>
	                            <th><a href="">트레일러</a></th>
	                        </tr>
	                        <tr>
	                            <td colspan="3">
	                                <table border="1" style="width: 100%; height: 100%;">
	                                    <tr>
	                                        <td style="height: 50px;">장르</td>
	                                        <td>0</td>
	                                        <td>개봉일</td>
	                                        <td><%= c.getReleaseDate() %></td>
	                                    </tr>
	                                    <tr>
	                                        <td style="height: 50px;"><%= c.getAgeLimit() %></td>
	                                        <td>12세</td>
	                                        <td>러닝타임</td>
	                                        <td><%= c.getRuntime() %>분</td>
	                                    </tr>
	                                    <tr>
	                                        <td style="height: 50px;">제작 국가</td>
	                                        <td>0</td>
	                                        <td>제작년도</td>
	                                        <td>0</td>
	                                    </tr>
	                                    <tr>
	                                        <td style="height: 50px;" colspan="4">소개</td>
	                                    </tr>
	                                    <tr>
	                                        <td colspan="4" align="center">${c.overView }</td>
	                                    </tr>
	                   <%} %>
				<%} %>
	                                </table>
	                            </td>
	                        </tr>
	                    </table>
	                </td>
	            </tr>
	        </table>
    	</form>
        <div>
            <form action="">
                <div class="menu">
                    <a href="${contextPath}/list.rv?currentPage=1"><h1>한줄 리뷰</h1></a>
                    <label><input type="checkbox">추천순</label>
                    <label><input type="checkbox">최신순</label>
                </div>
            </form>
            <table>
                <tr>
                    <td><img src="/resources/uploadFiles/20211114_033329.jpg" style="width: 20px; height: 20px;"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

            </table>
        </div>




    </div>

</body>
</html>