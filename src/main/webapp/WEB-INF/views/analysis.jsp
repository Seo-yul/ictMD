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
			<c:if test="${userId == null}">
				<li><a href="loginPage">로그인</a></li><li><a href="registerPage">회원가입</a></li>
			</c:if>
			<c:if test="${userId != null}">
				<li><a href="fixPage">회원 정보 수정</a></li>
				<li><a href="secesionPage">회원 탈퇴</a></li>
				<li><a href="logout">로그아웃</a></li>
				<c:if test="${userId == 'admin'}">
					<li><a href="admin">管理者ページ</a></li>
				</c:if>	
			</c:if>
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