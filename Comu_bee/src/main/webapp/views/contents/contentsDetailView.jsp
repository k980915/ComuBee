<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>contentDetail</title>
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
            margin-left: 20px; 
        }

    </style>
</head>
<body>
	  <div class="outer">
	  	<form id="detail-form" action="<%=contextPath %>/detail.co">
	        <table style="width: 100%;">
	            <tr>
	                <td rowspan="3" style="width: 50%; height: 600px;"><img src="" style="height: 800px; width: 100%;"></td>
	                <td rowspan="3" style="width: 10%;"></td>
	                <td colspan="3" style="width: 30%; height: 10px;" align="center"><h1>서울의봄</h1></td>
	            </tr>
	            <tr>
	                <td colspan="4" style="height: 10px;" align="center"><h2>12 : 12 THE DAY     。 2024</h2></td>
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
	                                        <td>0</td>
	                                    </tr>
	                                    <tr>
	                                        <td style="height: 50px;">연령 등급</td>
	                                        <td>0</td>
	                                        <td>러닝타임</td>
	                                        <td>0</td>
	                                    </tr>
	                                    <tr>
	                                        <td style="height: 50px;">제작 국가</td>
	                                        <td>0</td>
	                                        <td>제작년도</td>
	                                        <td>0</td>
	                                    </tr>
	                                    <tr>
	                                        <td style="height: 50px;" colspan="4">overview</td>
	                                    </tr>
	                                    <tr>
	                                        <td colspan="4" align="center">줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리줄거리</td>
	                                    </tr>
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
                    <a href=""><h1>한줄 리뷰</h1></a>
                    <label><input type="checkbox">추천순</label>
                    <label><input type="checkbox">최신순</label>
                </div>
            </form>
            <table>
                <tr>
                    <td><img src="../HTML/resources/20211129_202923.jpg" style="width: 20px; height: 20px;"></td>
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