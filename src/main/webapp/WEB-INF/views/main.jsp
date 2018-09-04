<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
	<meta charset="utf-8">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="description" content="">
	    <meta name="author" content="">
	    <link rel="shortcut icon" href="">
		<title>메인</title>
		
	    <!-- Bootstrap core CSS -->
	  
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link href="./resources/dist/css/jasny-bootstrap.min.css" rel="stylesheet">
		<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
		<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="./resources/css/navmenu-reveal.css" rel="stylesheet">
		<link href="./resources/css/style.css" rel="stylesheet">
		<!-- <link href="css/full-slider.css" rel="stylesheet"> -->
		
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>
		<!-- <div class="bar">
			<button type="button" class="navbar-toggle" data-toggle="offcanvas" data-recalc="false" data-target=".navmenu" data-canvas=".canvas">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div> -->
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
	</body>
</html>
