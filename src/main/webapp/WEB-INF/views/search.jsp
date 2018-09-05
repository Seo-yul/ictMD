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
	
	<title>사진 검색</title>
	
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
	
	<link rel="stylesheet" type="text/css" href="./resources/css/search.css">
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
	<h1 class="blog-post-title text-center">사진 검색</h1>
	<span class="title-divider"></span>
	<div id="searchForm">
		<input id="text" type="text">
		<input id="button" type="button" value="Search">
	</div>

	<div id="list"></div>

		<div id="container" class="container">
			<div id="gallery">
				<!-- <div id="gallery-header">
            <div id="gallery-header-center">
              <div id="gallery-header-center-left">
                <div id="gallery-header-center-left-icon">
                </div>
                <div id="gallery-header-center-left-title">Search Result</div>
              </div>
            <div id="gallery-header-center-right">
              <div class="gallery-header-center-right-links" id="filter-all">All</div>
                <div class="gallery-header-center-right-links" id="filter-studio">Studio</div>
                <div class="gallery-header-center-right-links" id="filter-landscape">Landscapes</div>
            </div>
            </div>
          </div> -->
				<div id="gallery-content">
					<div id="gallery-content-center">
						<!-- <a href="assets/studio1.jpg" data-lightbox="studio1"><img src="assets/studio1.jpg" id="imagelightbox" class="all studio"/> </a>
            <a href="assets/landscape1.jpg" data-lightbox="studio1"><img src="assets/landscape1.jpg" class="all landscape"></a>
            <a href="assets/studio2.jpg" data-lightbox="studio1"><img src="assets/studio2.jpg" class="all studio"/></a>
            <a href="assets/studio25.jpg" data-lightbox="studio1"><img src="assets/studio25.jpg" class="all studio"/></a>
            <a href="assets/landscape2.jpg" data-lightbox="studio1"><img src="assets/landscape2.jpg" class="all landscape"></a>
            <a href="assets/studio27.jpg" data-lightbox="studio1"><img src="assets/studio27.jpg" class="all studio"/></a>
            <a href="assets/studio3.jpg" data-lightbox="studio1"><img src="assets/studio3.jpg" class="all studio"/></a>
            <a href="assets/landscape3.jpg" data-lightbox="studio1"><img src="assets/landscape3.jpg" class="all landscape"></a>
            <a href="assets/studio26.jpg" data-lightbox="studio1"><img src="assets/studio26.jpg" class="all studio"/></a>
            <a href="assets/studio4.jpg" data-lightbox="studio1"><img src="assets/studio4.jpg" class="all studio"/></a>
            <a href="assets/landscape4.jpg" data-lightbox="studio1"><img src="assets/landscape4.jpg" class="all landscape"></a>
            <a href="assets/studio5.jpg" data-lightbox="studio1"><img src="assets/studio5.jpg" class="all studio"/></a>
            <a href="assets/landscape5.jpg" data-lightbox="studio1"><img src="assets/landscape5.jpg" class="all landscape"></a>
            <a href="assets/studio6.jpg" data-lightbox="studio1"><img src="assets/studio6.jpg" class="all studio"/></a>
            <a href="assets/landscape6.jpg" data-lightbox="studio1"><img src="assets/landscape6.jpg" class="all landscape"></a>
            <a href="assets/studio7.jpg" data-lightbox="studio1"><img src="assets/studio7.jpg" class="all studio"/></a>
            <a href="assets/landscape7.jpg" data-lightbox="studio1"><img src="assets/landscape7.jpg" class="all landscape"></a>
            <a href="assets/studio8.jpg" data-lightbox="studio1"><img src="assets/studio8.jpg" class="all studio"/></a>
            <a href="assets/landscape8.jpg" data-lightbox="studio1"><img src="assets/landscape8.jpg" class="all landscape"></a>
            <a href="assets/studio9.jpg" data-lightbox="studio1"><img src="assets/studio9.jpg" class="all studio"/></a>
            <a href="assets/landscape9.jpg" data-lightbox="studio1"><img src="assets/landscape9.jpg" class="all landscape"></a>
            <a href="assets/studio10.jpg" data-lightbox="studio1"><img src="assets/studio10.jpg" class="all studio"/></a>
            <a href="assets/landscape10.jpg" data-lightbox="studio1"><img src="assets/landscape10.jpg" class="all landscape"></a>
            <a href="assets/studio11.jpg" data-lightbox="studio1"><img src="assets/studio11.jpg" class="all studio"/></a>
            <a href="assets/landscape11.jpg" data-lightbox="studio1"><img src="assets/landscape11.jpg" class="all landscape"></a>
            <a href="assets/studio12.jpg" data-lightbox="studio1"><img src="assets/studio12.jpg" class="all studio"/></a>
            <a href="assets/landscape12.jpg" data-lightbox="studio1"><img src="assets/landscape12.jpg" class="all landscape"></a>
            <a href="assets/studio13.jpg" data-lightbox="studio1"><img src="assets/studio13.jpg" class="all studio"/></a>
            <a href="assets/landscape13.jpg" data-lightbox="studio1"><img src="assets/landscape13.jpg" class="all landscape"></a>
            <a href="assets/studio14.jpg" data-lightbox="studio1"><img src="assets/studio14.jpg" class="all studio"/></a>
            <a href="assets/landscape14.jpg" data-lightbox="studio1"><img src="assets/landscape14.jpg" class="all landscape"></a>
            <a href="assets/studio15.jpg" data-lightbox="studio1"><img src="assets/studio15.jpg" class="all studio"/></a>
            <a href="assets/landscape15.jpg" data-lightbox="studio1"><img src="assets/landscape15.jpg" class="all landscape"></a>
            <a href="assets/studio16.jpg" data-lightbox="studio1"><img src="assets/studio16.jpg" class="all studio"/></a>
            <a href="assets/landscape16.jpg" data-lightbox="studio1"><img src="assets/landscape16.jpg" class="all landscape"></a>
            <a href="assets/studio17.jpg" data-lightbox="studio1"><img src="assets/studio17.jpg" class="all studio"/></a>
            <a href="assets/landscape17.jpg" data-lightbox="studio1"><img src="assets/landscape17.jpg" class="all landscape"></a>
            <a href="assets/studio18.jpg" data-lightbox="studio1"><img src="assets/studio18.jpg" class="all studio"/></a>
            <a href="assets/landscape18.jpg" data-lightbox="studio1"><img src="assets/landscape18.jpg" class="all landscape"></a>
            <a href="assets/studio19.jpg" data-lightbox="studio1"><img src="assets/studio19.jpg" class="all studio"/></a>
            <a href="assets/studio20.jpg" data-lightbox="studio1"><img src="assets/studio20.jpg" class="all studio"/></a>
            <a href="assets/studio21.jpg" data-lightbox="studio1"><img src="assets/studio21.jpg" class="all studio"/></a>
            <a href="assets/studio22.jpg" data-lightbox="studio1"><img src="assets/studio22.jpg" class="all studio"/></a>
            <a href="assets/studio23.jpg" data-lightbox="studio1"><img src="assets/studio23.jpg" class="all studio"/></a>
            <a href="assets/studio24.jpg" data-lightbox="studio1"><img src="assets/studio24.jpg" class="all studio"/></a> -->
					</div>
				</div>
			</div>
		</div>
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
	
	<script src="./resources/js/search.js"></script>
</body>
</html>