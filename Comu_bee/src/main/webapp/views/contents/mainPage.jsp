<%@page import="com.kh.contents.model.vo.Board"%>
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
    ArrayList<Board> boardList = (ArrayList<Board>)request.getAttribute("boardList");

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
        .menu {
            display: flex;
            text-decoration: none;
            display: block;
            width: 100%;
            height: 100%;
            line-height: 50px;
            text-align: center;
        }

        img:hover {
            cursor: pointer;
        }

        .menu h1 {
            font-weight: bold;
        }

        table {
            font-weight: bold;
        }

        #recommend {
            font-size: 25px;
        }

        #reviewImg {
            border: 2px solid white;
        }
        #one{
        	border: 2px solid white;
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
            <table id="reviewImg">
                <tr style="height: 350px;">
                    <c:forEach var="board" items="${boardList}" varStatus="loop">
                        <c:if test="${loop.index < 5}">
                            <c:set var="contentId" value="${board.contentsId}"/>
                            <c:set var="imageDisplayed" value="false"/>
                            <c:forEach var="content" items="${conList}" varStatus="contentLoop">
                                <c:if test="${content.contentsId eq contentId && imageDisplayed eq 'false'}">
                                    <td>
                                        <input type="hidden" class="cid" value="${content.contentsId}">
                                        <img src="${content.posterPath}" style="width: 250px; height: 350px;">
                                    </td>
                                    <c:set var="imageDisplayed" value="true"/>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </tr>
                <tr>
                    <c:forEach var="board" items="${boardList}" varStatus="loop">
                        <c:if test="${loop.index < 5}">
                            <td id="one">${board.boardContent}</td>
                        </c:if>
                    </c:forEach>
                </tr>
            </table>
            <br><br><br><br><br>
            <div class="menu">
                <h1>이런 작품은 어떠세요?</h1>
            </div>
            <br><br>
            <table id="recommend">
                <c:forEach var="content" items="${conList}" varStatus="loop">
                    <c:if test="${loop.index < 4}">
                        <tr>
                            <td>
                                <input type="hidden" class="cid" value="${content.contentsId}">
                                <img src="${content.posterPath}" style="height: 600px; width: 500px;">
                            </td>
                            <td width="100px;"></td>
                            <td style="width: 500px;">
                                ${content.overView}
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
            <br><br><br><br><br>
            <div class="menu">
                <h1>평점 상위 컨텐츠</h1>
            </div>
            <br><br>
            <div style="text-align: center;">
                <table id="best" style="display: inline-block;">
                    <tr>
                        <c:forEach var="content" items="${bestList}" varStatus="loop">
                            <c:if test="${loop.index < 6}">
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
                            <c:if test="${loop.index < 6}">
                                <td>${content.title}</td>
                                <td></td>
                            </c:if>
                        </c:forEach>
                    </tr>
                </table>
                <br><br>
            </div>
        </div>
    </form>
</div>
<br><br><br>
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
