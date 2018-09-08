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
	
	<title>사진 검색</title>
	
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link href="./resources/templete/dist/css/jasny-bootstrap.min.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
	<link href="./resources/templete/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="./resources/templete/css/navmenu-reveal.css" rel="stylesheet">
	<link href="./resources/templete/css/style.css" rel="stylesheet">
	<link href="./resources/templete/css/full-slider.css" rel="stylesheet">
	<link href="./resources/templete/css/Icomoon/style.css" rel="stylesheet" type="text/css" />
	<link href="./resources/templete/css/animated-masonry-gallery.css" rel="stylesheet" type="text/css" />
	<link href="./resources/templete/css/lightbox.css" rel="stylesheet" type="text/css" />
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	
	<link rel="stylesheet" type="text/css" href="./resources/css/search.css">
	<script type="text/javascript" src="./resources/templete/js/jquery.js"></script>
	
	<style>
    #back {
    	align:center;
    	background-image: url("./resources/img/searchImg/camera_black_center.jpg");
    	background-size:100%;
    	padding-bottom: 700px;
    	margin-left : 85px;
    	margin-right : 150px;
    }
    #bback{
    	background-color : gery;
    }
    
    body {
 		background: #000;
	}
	
	
	.preloader-1 {
		margin: 100px auto 0;
		width: 66px;
		height: 12px;
	}
	
	div#loader {
		color: #fff;
		margin: 5px 0;
		text-transform: uppercase;
		text-align: center;
		font-family: 'Arial', sans-serif;
		font-size: 10px;
		letter-spacing: 2px;
		width: 100%;
	}
	
	
	
	.preloader-1 .line {
		width: 1px;
		height: 12px;
		background: #fff;
		margin: 0 1px;
		display: inline-block;
		animation: opacity-1 1000ms infinite ease-in-out;
	}
	
	
	.preloader-1 .line-1 { animation-delay: 800ms; }
	.preloader-1 .line-2 { animation-delay: 600ms; }
	.preloader-1 .line-3 { animation-delay: 400ms; }
	.preloader-1 .line-4 { animation-delay: 200ms; }
	.preloader-1 .line-6 { animation-delay: 200ms; }
	.preloader-1 .line-7 { animation-delay: 400ms; }
	.preloader-1 .line-8 { animation-delay: 600ms; }
	.preloader-1 .line-9 { animation-delay: 800ms; }
	
	@keyframes opacity-1 { 
	  0% { 
	    opacity: 1;
	  }
	  50% { 
	    opacity: 0;
	  }
	  100% { 
	    opacity: 1;
	  }  
	}
	
	@keyframes opacity-2 { 
	  0% { 
	    opacity: 1;
	    height: 15px;
	  }
	  50% { 
	    opacity: 0;
	    height: 12px;
	  }
	  100% { 
	    opacity: 1;
	    height: 15px;
	  }  
	}
	
	#waiting {
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
		position: fixed;
		display: block;
		opacity: 0.8;
		background: white;
		z-index: 99;
		text-align: center;
	}

    </style> 
</head>
<body>
<input type="hidden" id="mtotag" value="${mtotag}">
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
		<div id="bback">
			<div id="back">
				<h1 class="blog-post-title text-center" style="color:white; " >欲しかったカメラの写真を検索しましょう</h1>
				<span class="title-divider"></span>
				<br>
				<div id="searchForm" align="center">
					<table >
						<tr>
							<td>
								<input id="text" type="text" class="form-control" style="width:650px;">
							</td>
							<td>
								<input id="button" type="button" class="form-control"  style="width:100px;" value="Search" >
							</td>
						</tr>
					</table>
				</div>
			
				<div id="list" align="center">
					<!-- loading.. -->
					<div id="loading" class="preloader-1" style="z-index:100;">
							<div>Loading..</div>
							<span class="line line-1"></span>
							<span class="line line-2"></span>
							<span class="line line-3"></span>
							<span class="line line-4"></span>
							<span class="line line-5"></span>
							<span class="line line-6"></span>
							<span class="line line-7"></span>
							<span class="line line-8"></span>
							<span class="line line-9"></span>
					</div>
				</div>
					<div id="container" class="container">
						<div id="gallery">
							<div id="gallery-content">
								<div id="gallery-content-center">
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript
	   ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	
	<script type="text/javascript" src="./resources/templete/js/jquery-ui-1.10.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="./resources/templete/js/isotope.js"></script>
	<script type="text/javascript" src="./resources/templete/js/animated-masonry-gallery.js"></script>
	<script src="./resources/templete/dist/js/jasny-bootstrap.min.js"></script>
	<!-- <script src="./resources/js/main.js"></script> -->
	<script src="./resources/templete/js/lightbox.js"></script>
	<script src="./resources/js/search.js"></script>
	<script>
		var x = function initialize(){
		 	var mtotag = '${mtotag}';
		 	$("#text").val(mtotag)
		 	if(mtotag.length>1){
		 		search();
		 	}
		 }
		$(()=>{
			x();
		});
	</script>
</body>
</html>
