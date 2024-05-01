<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div align="center">
		<button type="submit" class="btn btn-info">정보변경</button>
		<button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#updatePwdForm">비밀번호변경</button>
		<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
	</div>
	<br><br>
	<div id="hitslog">
		<fieldset>
	        <legend>조회수 확인</legend>
	        <h3>금일 조회수 : <button onclick="toDayHits();">확인하기</button>
	            </h3> 
	        <h3>월별 조회수 :
                     <select id="yearSelectId">
                         <option value="2023Y">2023년</option>
                         <option value="2024Y">2024년</option>
                     </select> 
                      <select id="monthHitsId">
                            <option value="1월" id="1Month">1월</option> 
                            <option value="2월" id="2Month">2월</option> 
                            <option value="3월" id="3Month">3월</option> 
                            <option value="4월" id="4Month">4월</option> 
                            <option value="5월" id="5Month">5월</option> 
                            <option value="6월" id="6Month">6월</option> 
                            <option value="7월" id="7Month">7월</option> 
                            <option value="8월" id="8Month">8월</option> 
                            <option value="9월" id="9Month">9월</option> 
                            <option value="10월" id="10Month">10월</option> 
                            <option value="11월" id="11Month">11월</option> 
                            <option value="12월" id="12Month">12월</option> 
                      </select>
	            <button onclick="monthHits();">확인하기</button></h3>
	        <h3>콘텐츠별 조회수 Top5 : <button onclick="conHitsTop5();">확인하기</button>
	        </h3>
	            <script>
	               /*  function toDayHits(){ 
	                    var toDayHits1 = document.getElementById("toDayHits");
	                    alert("금일 조회수는 : "+toDayHits1);
	                }
	                function monthHits(){ 
	                    var monthHits1 = document.getElementById("monthHits");
	                    alert("월별 조회수는 : "+monthHits1);
	                }
	              
	                function conHitsTop5(){ 
	                    var conHitsTop51 = document.getElementById("conHitsTop5");
	                    alert("콘텐츠별 조회수 Top5는 : "+conHitsTop51);
	                } */
	                </script>
	                <!-- 금일 조회수 값을 저장하려면 해당날짜 id나 기타등등으로 값을 저장(update)후 출력
	                     타이머기능????으로 해야하나? 그럼 시간지정부분을 제거 table을 만들고 불러오게끔 금일부분만 count추가구문입력
	                     ONE함수 사용??해서 카운트 올리기
	                -->
	
	                <!-- 컨텐츠별 조회수는 콘텐츠 상위 top5 나열 sql구문의 값(제목, 조회수)을 가져오면됨 -->
	
	                <!-- 월별은 각 option에 해당하는 value에 의한 연도와 월의 금일조회수(30일or31일)치 총합의 조회수값  -->
	    </fieldset>
	</div>
	


	
	
</body>
</html>