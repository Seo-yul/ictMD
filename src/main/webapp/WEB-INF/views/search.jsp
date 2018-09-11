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
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
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
			<li><a href="main">メイン</a></li>
			<li><a href="search">検索</a></li>
			<li><a href="analysis">分析</a></li>
			<li><a href="weatherNshopping">天気＆ショッピング</a></li>
			<c:if test="${userId == null}">
				<li><a href="loginPage">ログイン</a></li><li><a href="registerPage">会員登録</a></li>
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
	<div id="dim"></div>
	<!-- loading.. -->
	<div id="loading" class="preloader-1" style="position:absolute;top:0px;left:50%;margin-left:-20px;z-index:100;">
			<div style="color:white;">Loading..</div>
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
	<div class="canvas gallery">
	<br>
		<div id="bback">
			<div id="back">
				<h1 class="blog-post-title text-center" style="color:white;">欲しかったカメラの写真を検索しましょう</h1>
				<span class="title-divider"></span>
				<br>
				<div id="searchForm" align="center">
					<table>
						<tr>
							<td>
								<input id="text" type="text" class="form-control" style="width:600px;">
							</td>
							<td>
								<input id="button" type="button" class="form-control" style="width:80px;" value="Search" >
							</td>
						</tr>
					</table>
				</div>
				<div align="center">
					<i class="fas fa-camera">	
						「tag」検索です。複数検索は「 , 」で区分して検索が出来ます。 例) dog,cat,bird,sheep
					</i>
				</div>
				<div id="searchResult" align="center">
					<h3 style='font-size:15px;'>検索結果 : </h3>
				</div>
				<div align="center">
					<input id="timeasc" type="button" value="업로드시간 순 정렬(최신 먼저)">
					<input id="timedesc" type="button" value="업로드시간 순 정렬(오래된 것 먼저)">
					<input id="viewasc" type="button" value="조회수 순 정렬(오름차순)">
					<input id="viewdesc" type="button" value="조회수 순 정렬(내림차순)">
					<img src="./resources/img/smaller_1-512.png" style="width:30px;height:30px;">
					<img src="./resources/img/bigger_1-512.png" style="width:30px;height:30px;">
				</div>
				<div id="list" align="center"></div>
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
