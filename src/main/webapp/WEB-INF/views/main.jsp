<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
	<meta charset="utf-8">
	<head>
			
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="shortcut icon" href="./resources/templete/assets/ico/favicon.png">
		
		<title>메인</title>


	    <!-- Bootstrap core CSS -->
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
	    
	    
	    <script src="http://www.webglearth.com/v2/api.js"></script>
	    <script>
      var earth;
      var options;
      function initialize() {
    	options = {atmosphere: false ,sky: true, center: [0, 0], zoom: 0, zooming:false};
        earth = new WE.map('earth_div',options);
        earth.setView([37.511981, 127.058544], 2);
        WE.tileLayer('http://tileserver.maptiler.com/nasa/{z}/{x}/{y}.jpg', {
            minZoom: 2,
            maxZoom: 3,
            
        }).addTo(earth);

        
        
        // Start a simple rotation animation
        var before = null;
        requestAnimationFrame(function animate(now) {
            var c = earth.getPosition();
            var elapsed = before? now - before: 0;
            before = now;
            earth.setCenter([c[0], c[1] + 0.1*(elapsed/50)]);
            requestAnimationFrame(animate);
        });
        
        
        
        var markerimg = "./resources/img/star-marker.png"
        var marker = WE.marker([37.511981, 127.058544],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>코엑스!</p>'+
		'<img src="http://tour.gangnam.go.kr/media/cache/69/1c/691cc52fbf9ff0cfc0f4d2d5b596a238.png" alt="..." class="img-circle">');

        marker = WE.marker([35.708442, 139.724598],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>도쿄!</p>');
        
        marker = WE.marker([40.699973, -73.996155],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>뉴욕!!</p>');
        
        marker = WE.marker([51.505855, -0.120887],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>런던!!!</p>');
        
        marker = WE.marker([51.505855, -0.120887],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>파리!</p>');
        
        marker = WE.marker([29.979142, 31.134266],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>이집트!</p>');
        
        marker = WE.marker([45.512627, -75.685274],markerimg,24,24).addTo(earth)
        marker.bindPopup('<p>캐나다</p>');
        
      }
    </script>
	    <!-- <link href="css/full-slider.css" rel="stylesheet"> -->
	
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
<<<<<<< HEAD
		<h1>검색하기 전, com.sesoc.ictmd.function의 CreateImg.java에서 <br>도메인을 private static final String OUR_DOMAIN을 자기 서버로 설정할 것.</h1>
		
    
    <!-- Main component for a primary marketing message or call to action -->
	  <div  id="earth_div">
	  </div>
	  
	</body>
</html>
=======
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
>>>>>>> master
