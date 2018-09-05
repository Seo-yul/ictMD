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
        earth.setView([37.511981, 127.058544], 2.7);
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
        
        markerimg = "./resources/img/UnitedStates.png"
        marker = WE.marker([40.699973, -73.996155],markerimg,24,24).addTo(earth)
        marker.bindPopup('<h2>Statue of Liberty, USA</h2>'+
		'<img src="https://www.listchallenges.com/f/items/a45acde9-68c5-4871-b49c-0a630890076b.jpg" alt="..." class="img-circle img-responsive">');
        
        markerimg = "./resources/img/France.png"
        marker = WE.marker([48.8583701,2.2944813],markerimg,24,24).addTo(earth)
        marker.bindPopup('<h2>Eiffel Tower</h2>'+
    	'<img src="https://www.listchallenges.com/f/items/4e76ea71-f275-44df-a98f-0f75f9771a65.jpg" alt="..." class="img-circle img-responsive">');
           
        markerimg = "./resources/img/UnitedKingdom.png"
        marker = WE.marker([51.5007292,-0.1246254],markerimg,24,24).addTo(earth)
        marker.bindPopup('<h2>Big Ben</h2>'+
		'<img src="https://www.listchallenges.com/f/items/2c6fce4f-e410-4d50-80b6-870bc945b17b.jpg" alt="..." class="img-circle img-responsive">');
        
        markerimg = "./resources/img/Italy.png"
        marker = WE.marker([43.722952,10.396597],markerimg,24,24).addTo(earth)
        marker.bindPopup('<h2>Leaning Tower of Pisa, Pisa</h2>'+
    	'<img src="https://www.listchallenges.com/f/items/bb1fa37e-fd85-43ef-87a6-02387af5dc25.jpg" alt="..." class="img-circle img-responsive">');

        markerimg = "./resources/img/Italy.png"
            marker = WE.marker([41.8902102,12.4922309],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Colosseum</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/e71fd9ad-6027-44f2-93df-b0a284507c74.jpg" alt="..." class="img-circle img-responsive">');
            
        markerimg = "./resources/img/UnitedStates.png"
            marker = WE.marker([34.1341151,-118.3215482],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Hollywood Sign</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/db282a05-f160-40b3-8129-035bcd322ccb.jpg" alt="..." class="img-circle img-responsive">');
       
        markerimg = "./resources/img/UnitedStates.png"
            marker = WE.marker([37.8199286,-122.4782551],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Golden Gate Bridge</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/6b26ad11-44d1-497c-897b-65ae86f67273.jpg" alt="..." class="img-circle img-responsive">');
       
        markerimg = "./resources/img/Jp.png"
            marker = WE.marker([35.6585805,139.7454329],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Tokyo Tower</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/314a88a3-11a8-43cf-9369-4ce047cd0dfc.jpg" alt="..." class="img-circle img-responsive">');
       
        markerimg = "./resources/img/China.png"
            marker = WE.marker([40.4319077,116.5703749],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Great Wall of China</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/a0015a10-617f-4077-a734-1d030ed48058.jpg" alt="..." class="img-circle img-responsive">');
       
        markerimg = "./resources/img/Australia.png"
            marker = WE.marker([-33.8567844,151.2152967],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Sydney Opera House</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/baccf057-63ee-4aa5-aab6-f0f1212d8fb7.jpg" alt="..." class="img-circle img-responsive">');
       
        markerimg = "./resources/img/Russia.png"
            marker = WE.marker([55.7525229,37.6230868],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>St. Basil\'s Cathedral</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/8e410b50-6290-4c99-b92a-4bac3cb8b719.jpg" alt="..." class="img-circle img-responsive">');
       
        markerimg = "./resources/img/Germany.png"
            marker = WE.marker([52.5277821,13.3772302],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Berlin Wall</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/ecf6bcac-2010-4b2a-bfba-a138602c9610.jpg" alt="..." class="img-circle img-responsive">');
        
        markerimg = "./resources/img/UnitedKingdom.png"
            marker = WE.marker([51.1786068,-1.8262193],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Stonehenge</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/a5f9eb7d-71f2-4710-a4c6-7c04a634c319.jpg" alt="..." class="img-circle img-responsive">');
        
        markerimg = "./resources/img/Tanzania.png"
            marker = WE.marker([-3.0674245,37.3381177],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Kilimanjaro</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/0b047c9f-99e5-4f38-83f8-547f2dbe085f.jpg" alt="..." class="img-circle img-responsive">');
        
        markerimg = "./resources/img/Australia.png"
            marker = WE.marker([-25.3456562,131.0196362],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Uluru - Ayers Rock</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/7fb2cd5d-8abc-40a8-a25d-5aa7c8ebd216.jpg" alt="..." class="img-circle img-responsive">');
        
        markerimg = "./resources/img/India.png"
            marker = WE.marker([27.1750151,78.0421552],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Taj Mahal</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/4dd9d779-3bc9-49d8-89d5-a34b133c6ab3.jpg" alt="..." class="img-circle img-responsive">');
        
        markerimg = "./resources/img/Egypt.png"
            marker = WE.marker([29.9792345,31.1342019],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Pyramids of Giza</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/66b160d7-d2f9-4dca-887b-ae38651e69c7.jpg" alt="..." class="img-circle img-responsive">');
        
        markerimg = "./resources/img/Brazil.png"
            marker = WE.marker([ ],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Christ the Redeemer - Rio De Janerio, Brazil</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/00472c34-0bbb-495c-8d3d-15b4e77918d1.jpg" alt="..." class="img-circle img-responsive">');
       
        markerimg = "./resources/img/Chile.png"
            marker = WE.marker([-27.1439625,-109.3326878],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Moai</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/6113cc48-e777-4474-bad1-481f7abd07d3.jpg" alt="..." class="img-circle img-responsive">');
       
        markerimg = "./resources/img/Denmark.png"
            marker = WE.marker([55.6797154,12.586421],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Nyhavn</h2>'+
        	'<img src="https://www.listchallenges.com/f/items-dl/5f61f3d7-e72f-4a00-b729-e8b8b6167aef.jpg" alt="..." class="img-circle img-responsive">');

        markerimg = "./resources/img/Israel.png"
            marker = WE.marker([31.7767189,35.2345085],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Wailing Wall</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/6b3f2257-1ed4-4273-ad2f-48bc567820ed.jpg" alt="..." class="img-circle img-responsive">');
       
        markerimg = "./resources/img/Ireland.png"
            marker = WE.marker([53.6947119,-6.4754917],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Newgrange</h2>'+
        	'<img src="https://www.listchallenges.com/f/items/cea40c98-ae81-4980-8d43-07ba977917a3.jpg" alt="..." class="img-circle img-responsive">');
        
        markerimg = "./resources/img/Korea-South.png"
            marker = WE.marker([37.579617,126.977041],markerimg,24,24).addTo(earth)
            marker.bindPopup('<h2>Gyeongbokgung, Korea-South</h2>'+
        	'<img src="https://lh5.googleusercontent.com/proxy/XmnHVngvJ-_FVag6Ma79DoDsi0qverft5987BW75y6GNmBPr_G_mJJptp_TfLztBfDRbZxUOjb4xwd2u-b43X4FtGGhqOrSMN9yRO6ik_GSMCBbgb2uiFuMhSCWuL9iSttVS2afN9fYBZH6bZXZkUDknj0GnMo8=w408-h270-k-no" alt="..." class="img-circle img-responsive">');
       
        
        
        
        
      }
    </script>
	    <!-- <link href="css/full-slider.css" rel="stylesheet"> -->
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>

<body onload="initialize()">
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
		
		
		<br>
		<h1>검색하기 전, com.sesoc.ictmd.function의 CreateImg.java에서 <br>도메인을 private static final String OUR_DOMAIN을 자기 서버로 설정할 것.</h1>
		
    
    <!-- Main component for a primary marketing message or call to action -->
	  <div  id="earth_div">
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
	<script src="./resources/templete/js/main.js"></script>
	<script>
	$('.carousel').carousel({
	    interval: 6000 //changes the speed
	})
	</script>
</body>
</html>
