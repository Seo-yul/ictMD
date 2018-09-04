<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="./resources/templete/assets/ico/favicon.png">
	
	<title>메인</title>
	
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link href="./resources/templete/dist/css/jasny-bootstrap.min.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
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
	
	<div id="myCarousel" class="canvas carousel slide" data-ride="carousel">
	Full Page Image Background Carousel Header
    
        <!-- Indicators
        <ol class="carousel-indicators xtra-border">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        Wrapper for Slides
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                Set the first background image using inline CSS below.
                <div class="fill" style="background-image:url('img/bg.jpg');"></div>
                <img src="img/bg.jpg" alt="First slide">
                <div class="carousel-caption">
                  <h2 class="sub-title-home">We Don't Take Photograph</h2>
                  <h1 class="title-home">We Make It</h1>
                </div>
            </div>
            <div class="item">
                Set the second background image using inline CSS below.
                <div class="fill" style="background-image:url('img/bg1.jpg');"></div>
                <img src="img/bg1.jpg" alt="Second slide">
                <div class="carousel-caption">
                  <h2 class="sub-title-home">We Don't Take Photograph</h2>
                  <h1 class="title-home">We Make It</h1>
                </div>
            </div>
            <div class="item">
                Set the third background image using inline CSS below.
                <div class="fill" style="background-image:url('img/bg3.jpg');"></div>
                <img src="img/bg3.jpg" alt="Third slide">
                <div class="carousel-caption">
                  <h2 class="sub-title-home">We Don't Take Photograph</h2>
                  <h1 class="title-home">We Make It</h1>
                </div>
            </div>
        </div> -->
		<div class="navbar navbar-default navbar-fixed-top"></div>
		<!-- <div class="container page-container">
			<div class="home-page-header">
				<div class="col-md-4 col-md-offset-4"><img src="img/zigzag.png" width="400" height="30"></div>
			</div>
		</div>/.container -->
		
		<h1>메인 화면</h1>
		<c:if test="${userId == null}">
			<a href="loginPage">로그인</a>
			<span> / </span>
			<a href="registerPage">회원가입</a>
		</c:if>
		<c:if test="${userId != null}">
			<a href="fixPage">회원 정보 수정</a>
			<span> / </span>
			<a href="secesionPage">회원 탈퇴</a>
			<span> / </span>
			<a href="logout">로그아웃</a>
		</c:if>
		<br>
		<a href="search">사진 검색 페이지로 이동</a>
		<br>
		<a href="analysis">트렌드 분석 페이지로 이동</a>
		<br>
		<a href="weatherNshopping">날씨 및 가격 정보 페이지로 이동</a>
		<br>
		<h1>검색하기 전, com.sesoc.ictmd.function의 CreateImg.java에서 도메인을 private static final String OUR_DOMAIN을 자기 서버로 설정할 것.</h1>
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
	<script>
	$('.carousel').carousel({
	    interval: 6000 //changes the speed
	})
	</script>
</body>
</html>