<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hitsGraph 그래프</title>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
	
	
	
</head>
<body>

<div align="center">
	<h4 style ="color : black;">연도별 전체 방문자수 조회 : 
	<select id="yearSelectId2" class="btn btn-light" >
		<option value="2023년">2023년</option>
		<option value="2024년">2024년</option>
	</select>
	<input type="button" id="btnG" value="확인하기" class="btn btn-light"></h4> <br>

	<canvas id="myChart" style="max-width: 500px; max-height: 500px;"></canvas>

</div>
	<script>
		//연도 조회 그래프 
		$(function() {
			$("#btnG").click(function() {
				var yearData2 = $("#yearSelectId2").val();
				yearSelectAll(yearData2);
			});
			function yearSelectAll(yearData2) {
				$.ajax({
					url : "yearSelectAll.ad",
					data : {
						yearData2 : yearData2
					},
					error : function() {
						console.log("처리 실패");
					},
					success : function(list) {
						var labels = [];
						var data = [];
						for (var i = 0; i < list.length; i++) {
							labels.push(list[i].monthSelect); 
							data.push(list[i].hits);
						}
						updateChart(labels, data);
					}
				});
			}
			function updateChart(labels, data) {

				var ctx = document.getElementById('myChart').getContext('2d');

				var existingChart = $("#myChart").data('chart');

				if (existingChart) {
					existingChart.destroy();
				}

				var myChart = new Chart(ctx, {
					type : 'bar',
					data : {
						labels : labels,
						datasets : [ {
							label : '방문자 수',
							data : data,
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)',
									'rgb(146, 67, 116,0.2)',
									'rgb(127, 255, 212,0.2)',
									'rgb(138, 43, 226,0.2)',
									'rgb(0, 0, 0,0.2)',
									'rgb(255, 235, 205,0.2)',
									'rgb(165, 42, 42,0.2)' ],
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)',
									'rgb(146, 67, 116,1))',
									'rgb(127, 255, 212,1)',
									'rgb(138, 43, 226,1)', 'rgb(0, 0, 0,1)',
									'rgb(255, 235, 205,1)',
									'rgb(165, 42, 42,1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
				$("#myChart").data('chart', myChart);
			}
			yearSelectAll($("#yearSelectId2").val());
		});
	</script>


</body>
</html>