<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="./resources/templete/assets/ico/favicon.png">
	<title>トレンド分析</title>
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link href="./resources/templete/dist/css/jasny-bootstrap.min.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
	<link href="./resources/templete/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="./resources/templete/css/navmenu-reveal.css" rel="stylesheet">
	<link href="./resources/templete/css/style.css" rel="stylesheet">
	<link href="./resources/templete/css/Icomoon/style.css" rel="stylesheet" type="text/css" />
	
	<link rel="stylesheet" type="text/css" href="./resources/css/analysis.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="./resources/js/highcharts.js"></script>
	<script src="./resources/js/series-label.js"></script>
	<script src="./resources/js/exporting.js"></script>
	<script src="./resources/js/export-data.js"></script>
	<script src="./resources/js/wordcloud.js"></script>
	
	<style>
	.dataTable {
  font-family: sans-serif;
  font-weight: 100;
  width: 500px;
  border-collapse: collapse;
  overflow: hidden;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  background: linear-gradient(45deg, #49a09d, #5f2c82);
}
.dataTable th,
.dataTable td {
  padding: 15px;
  background-color: rgba(255, 255, 255, 0.2);
  color: #fff;
}
.dataTable th {
  text-align: left;
}
.dataTable thead th {
  background-color: #55608f;
}
.dataTable tbody tr:hover {
  background-color: rgba(255, 255, 255, 0.3);
}
.dataTable tbody td {
  position: relative;
}
.dataTable tbody td:hover:before {
  content: "";
  position: absolute;
  left: 0;
  right: 0;
  top: -9999px;
  bottom: -9999px;
  background-color: rgba(255, 255, 255, 0.2);
  z-index: -1;
}

	</style>
	
	<script>
		var init = function() {
			$(".bar").css("background-color", "#337ab7");
		    $(".navbar-toggle").css("background", "url(./resources/img/navicon2.jpg)");
		    $(".navbar-toggle").css("background-repeat", "no-repeat");
		    $(".navmenu-fixed-left").css("background-color", "#80c0e0");
		    $(".navmenu-nav").css("background-color", "#c0e0ff");
		    $(".navmenu-nav > li > a").css("color", "#303030");
		    $(".navmenu-nav > li > a").hover(function() {
		      $(this).css("color", "#337ab7");
		      $(this).css("background-color", "#ffffff");
		    }, function() {
		      $(this).css("color", "#303030");
		      $(this).css("background-color", "#c0e0ff");
		    });
		    $(".copyright-text").css("color", "#202020");
		}
		$(function(){
			init();
			
			function wordCloudChart(data, divName, chartTitle){
				var makeArr = [];
					
				$(data).each(function(index,item){
					makeArr.push({
						name:item.dataName,
						weight:parseFloat(item.dataNum)
					});
				});
				
				
				Highcharts.chart(divName, {
				    series: [{
				        type: 'wordcloud',
				        data: makeArr,
				        name: '検索件数',
				        point:{
				              events:{
				                  click: function (event) {
				                      alert(this.name);
				                  }
				              }
				          }
				    }],
				    title: {
				        text: chartTitle
				    },
				    /* subtitle: {
				    	text: "<각 요소 클릭시 해당키워드 검색페이지로 넘어갑니다.>"
				    } */
				});
			}
			
			function basicDataChart(data, divName, chartTitle, seriesName){
				var makeArr = [];
				$(data).each(function(index,item){
					makeArr.push({
						name:item.dataName,
						y:parseFloat(item.dataPercentage)
					});
				});
				console.log(makeArr);
				Highcharts.chart(divName, {
				    chart: {
				        plotBackgroundColor: null,
				        plotBorderWidth: null,
				        plotShadow: false,
				        type: 'pie'
				    },
				    title: {
				        text: chartTitle
				    },
				    /* subtitle: {
				    	text: "<각 요소 클릭시 해당키워드 검색페이지로 넘어갑니다.>"
				    }, */
				    tooltip: {
				        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
				    },
				    plotOptions: {
				        pie: {
				            allowPointSelect: true,
				            cursor: 'pointer',
				            dataLabels: {
				                enabled: true,
				                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
				                style: {
				                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
				                }
				            }
				        }
				    },
				    series: [{
				        name: seriesName,
				        colorByPoint: true,
				        data: makeArr,
				        point:{
				              events:{
				                  click: function (event) {
				                      alert(this.name);
				                  }
				              }
				          }
				    }]
				});
			}
			
			$.ajax({
				url:"importBasicMakeData",
				type:"post",
				success:function(data){
					console.log("메이커데이터");
					console.log(data);
					basicDataChart(data, "BasicMake", "Maker Trend", "percentage");
					/* var makeTable = "<tr style='text-align:center'><th>브랜드명</th><th>검색횟수</th><th>검색률</th>";
					$(data).each(function(index,item){
						makeTable += "<tr><td>"+item.dataName+"</td><td>"+item.dataNum+"</td><td>"+item.dataPercentage+"%</td>";
					}); */
					
					var makeTable = '<thead><tr><th>メーカー</th><th>検索回数</th><th>検索比率</th></tr></thead><tbody>';
					$(data).each(function(index,item){
						makeTable += "<tr><td>"+item.dataName+"</td><td>"+item.dataNum+"</td><td>"+item.dataPercentage+"%</td>";
					});
					makeTable += '</tbody>';
					$("#MakeAnalysis").html(makeTable);
					
					
				},
				error:function(data){
					alert("失敗");
				}
			});
			
			$.ajax({
				url:"importBasicModelData",
				type:"post",
				success:function(data){
					console.log("모델데이터");
					console.log(data);
					basicDataChart(data, "BasicModel", "Model Trend Top 10", "percentage");
					var modelTable = '<thead><tr><th>モデル</th><th>検索回数</th></tr></thead><tbody>';
					$(data).each(function(index,item){
						modelTable += "<tr><td>"+item.dataName+"</td><td>"+item.dataNum+"</td>";
					});
					modelTable += '</tbody>';
					$("#ModelAnalysis").html(modelTable);

				},
				error:function(data){
					alert("失敗");
				}
			});
			
			$.ajax({
				url:"importBasicTagsData",
				type:"post",
				success:function(data){
					console.log(data);
					wordCloudChart(data, "BasicTag", "Today's Tags TOP 20");
				}
			});
		});
	</script>
</head>
<body>
	<div class="bar">
		<button type="button" class="navbar-toggle" data-toggle="offcanvas" data-recalc="false" data-target=".navmenu" data-canvas=".canvas">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
	<div class="navmenu navmenu-default navmenu-fixed-left">
		<ul class="nav navmenu-nav">
			<li><a href="main">メイン</a></li>
			<li><a href="search">検索</a></li>
			<li><a href="analysis">分析</a></li>
			<li><a href="weatherNshopping">天気＆ショッピング</a></li>
			<c:if test="${userId == null}">
				<li><a href="loginPage">ログイン</a></li>
				<li><a href="registerPage">会員登録</a></li>
			</c:if>
			<c:if test="${userId != null}">
				<li><a href="fixPage">登録情報の編集</a></li>
				<li><a href="secesionPage">IDの削除</a></li>
				<li><a href="logout">ログアウト</a></li>
				<c:if test="${userId == 'admin'}">
					<li><a href="admin">管理者ページ</a></li>
				</c:if>	
			</c:if>
		</ul>
		<a class="navmenu-brand" href="main"><img src="./resources/templete/assets/ico/favicon.png" width="186px"></a>
		<div class="copyright-text">©Copyright #ハンサム 2018</div>
	</div>
	
	<div class="canvas gallery">
		<h1 class="blog-post-title text-center" style="color:#337ab7;text-shadow: 3px 3px 5px rgba(32, 32, 32, 0.2)">トレンド分析</h1>
		<div style="margin:0 auto;width:180px;height:2px;background:linear-gradient(to right, rgba(255, 255, 255, 0), rgba(248, 222, 126, 1), rgba(255, 255, 255, 0))"></div>
		<br>
		<div id="BasicTag" style="width:80%; margin:auto"></div>
		<table style="margin:auto;">
			<tr>
				<td>
			<div id="BasicMake" style="display:inline;float:left;width:50%"></div>
				</td>
				<td>
			<div id="BasicModel" style="display:inline;float:left;width:50%"></div>
				</td>
			</tr>
			<tr>
			<td>
			<table class="dataTable" id = "MakeAnalysis" style="width:100%">
			</table>
			</td><td style="vertical-align:top;">
			<table class="dataTable" id = "ModelAnalysis" style="width:100%">
			</table>
			</td>
			<tr>
		</table>
		
	</div>
	
	<!-- Bootstrap core JavaScript
	   ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="./resources/templete/js/jquery.js"></script>
	<script type="text/javascript" src="./resources/templete/js/jquery-ui-1.10.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./resources/templete/js/isotope.js"></script>
	<script src="./resources/templete/dist/js/jasny-bootstrap.min.js"></script>
	<!-- <script src="./resources/js/main.js"></script> -->
</body>
</html>