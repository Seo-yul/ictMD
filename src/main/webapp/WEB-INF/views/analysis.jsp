<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="./resources/templete/assets/ico/favicon.png">
	<title>트렌드 분석</title>
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
	
	<script>
		$(function(){
			
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
				        name: '검색횟수'
				    }],
				    title: {
				        text: chartTitle
				    }
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
				        data: makeArr
				    }]
				});
			}
			
			$.ajax({
				url:"importBasicMakeData",
				type:"post",
				success:function(data){
					console.log(data);
					basicDataChart(data, "BasicMake", "Maker Trend", "percentage");
					
				},
				error:function(data){
					alert("실패 ㅠ");
				}
			});
			
			$.ajax({
				url:"importBasicModelData",
				type:"post",
				success:function(data){
					console.log(data);
					basicDataChart(data, "BasicModel", "Model Trend Top 10", "percentage");
					
				},
				error:function(data){
					alert("실패 ㅠ");
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
			<li><a href="main">메인</a></li>
			<li><a href="search">검색</a></li>
			<li><a href="analysis">분석</a></li>
			<li><a href="weatherNshopping">종합 정보</a></li>
			<li><a href="">남는 칸</a></li>
		</ul>
		<a class="navmenu-brand" href="#"><img src="./resources/templete/img/logo.png" width="160"></a>
		<div class="social">
			<a href="#"><i class="fa fa-twitter"></i></a>
			<a href="#"><i class="fa fa-facebook"></i></a>
			<a href="#"><i class="fa fa-instagram"></i></a>
			<a href="#"><i class="fa fa-pinterest-p"></i></a>
			<a href="#"><i class="fa fa-google-plus"></i></a>
			<a href="#"><i class="fa fa-skype"></i></a>
		</div>
		<div class="copyright-text">©Copyright #ハンサム 2018</div>
	</div>
	
	<div class="canvas gallery">
		<br>
		<h1 class="blog-post-title text-center">트렌드 분석</h1>
		<span class="title-divider"></span>
		<div id="BasicMake"></div>
		<div id="BasicModel"></div>
		<div id="BasicTag"></div>
	</div>
	
	<!-- Bootstrap core JavaScript
	   ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="./resources/templete/js/jquery.js"></script>
	<script type="text/javascript" src="./resources/templete/js/jquery-ui-1.10.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./resources/templete/js/isotope.js"></script>
	<script type="text/javascript" src="./resources/templete/js/animated-masonry-gallery.js"></script>
	<script src="./resources/templete/dist/js/jasny-bootstrap.min.js"></script>
	<!-- <script src="./resources/js/main.js"></script> -->
	<script src="./resources/templete/js/lightbox.js"></script>
</body>
</html>