<%@page import="com.kh.contents.model.vo.Contents"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.JDBCTemplate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
             
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
        <form action="${contextPath}/detail.co">
            <table style="width: 100%;">
                <c:forEach var="c" items="${list}">
                    <tr>
                        <td rowspan="3" style="width: 50%; height: 600px;">
                            <!-- 이미지 경로를 채워주세요 -->
                            <img id="titleImg" src="" style="height: 800px; width: 100%;">
                        </td>
                        <td rowspan="3" style="width: 10%;"></td>
                        <td colspan="3" style="width: 30%; height: 10px;" align="center">
                            <h1>제목 : ${c.title}</h1>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 10px;" align="center">
                            <h2>${c.englishTitle}</h2>
                        </td>
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
                                                <td>장르컬럼추가해야됨</td>
                                                <td>개봉일</td>
                                                <td>${c.releaseDate}</td>
                                            </tr>
                                            <tr>
                                                <td style="height: 50px;">연령 제한</td>
                                                <td>${c.ageLimit}</td>
                                                <td>러닝타임</td>
                                                <td>${c.runtime}</td>
                                            </tr>
                                            <tr>
                                                <td style="height: 50px;">출연진</td>
                                                <td>${c.actors}</td>
                                                <td>감독</td>
                                                <td>${c.director}</td>
                                            </tr>
                                            <tr>
                                                <td style="height: 50px;" colspan="4">소개</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" align="center">${c.overView}</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </div>
</body>
</html>
