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
	
	<title>イメージ検索</title>
	
	<!-- Bootstrap core CSS -->
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
	<link href="./resources/templete/dist/css/jasny-bootstrap.min.css" rel="stylesheet" />
	<link href="./resources/templete/css/bootstrap.min.css" rel="stylesheet" />
	<!-- Custom styles for this template -->
	<link href="./resources/templete/css/navmenu-reveal.css" rel="stylesheet" type="text/css" />
	<link href="./resources/templete/css/style.css" rel="stylesheet" type="text/css" />
	<link href="./resources/templete/css/Icomoon/style.css" rel="stylesheet" type="text/css" />
	<link href="./resources/templete/css/animated-masonry-gallery.css" rel="stylesheet" type="text/css" />
	<link href="./resources/templete/css/lightbox.css" rel="stylesheet" type="text/css" />
	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	
	<script type="text/javascript" src="./resources/templete/js/jquery.js"></script>
	
	<link rel="stylesheet" type="text/css" href="./resources/css/search.css">
	<style>
		.bar {
			background-color: #337ab7;
			z-index: 9998;
		}
		
		button.navbar-toggle {
			background: url(./resources/img/navicon2.jpg);
			background-repeat: no-repeat;
		}
		
		.navmenu-fixed-left {
			background-color: #80c0e0;
		}
		
		.navmenu-nav {
			font-size: 110%;
			font-weight: bold;
			color: #337ab7;
		}
		
		#memberMenu, #memberMenu > a, #memberMenu > span {
			color: white;
			font-size: 90%;
			
			text-align: center;
			margin: 0 auto;
		}
		
		.copyright-text {
			color: #202020;
			
			text-align: center;
		}
	
    #back {
    	align:center;
    /* 	background-image: url("./resources/img/searchImg/camera_black_center.jpg"); */
    	background-size:100%;
    	padding-bottom: 700px;
    	margin-left : 100px;
    	margin-right : 150px;
    }
    #bback{
    	background-color : white;
    }
    
    body {
 		background: white;
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
		width: 2px;
		height: 22px;
		background: #337ab7;
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
			<li><a href="search">イメージ検索</a></li>
			<li><a href="analysis">トレンド分析</a></li>
			<li><a href="weatherNshopping">天気＆値段</a></li>
		</ul>
		<a class="navmenu-brand" href="main">
			<img src="./resources/templete/assets/ico/favicon.png" width="186px">
		</a>
		<div id="memberMenu">
			<c:if test="${userId == null}">
				<a href="loginPage">Login</a>
				<span> / </span>
				<a href="registerPage">Sign in</a>
				<br>
			</c:if>
			<c:if test="${userId != null}">
				<a href="logout">Logout</a>
				<br>
				<a href="fixPage">Edit</a>
				<span> / </span>
				<a href="secesionPage">Withdrawal</a>
				<c:if test="${userId == 'admin'}">
					<span> / </span>
					<a href="admin">Admin</a>
				</c:if>	
			</c:if>
		</div>
		<br>
		<div class="copyright-text">©Copyright #ハンサム 2018</div>
	</div>
	<div id="dim"></div>
	<!-- loading.. -->
	<div id="loading" class="preloader-1" style="position:absolute;top:0px;left:50%;margin-left:-20px;z-index:100;">
		<h2 style="text-align:center;color:#337ab7;margin-left:-33px;">LOADING</h2>
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
				<h1 class="blog-post-title text-center" style="color:#337ab7;text-shadow: 3px 3px 5px rgba(32, 32, 32, 0.2)">イメージ検索</h1>
				<div style="margin:0 auto;width:180px;height:2px;background:linear-gradient(to right, rgba(255, 255, 255, 0), rgba(248, 222, 126, 1), rgba(255, 255, 255, 0))"></div>
				<br>
				<div id="searchForm" align="center">
					<table>
						<tr>
							<td>
								<input id="text" type="text" class="form-control" >
							</td>
							<td>
								<input id="searchButton" type="button" class="form-control" value="Search" >
							</td>
						</tr>
					</table>
				</div>
				<div align="center">
					<i class="fas fa-camera" style="color:gray;">	
						検索したいカメラ名やキーワードを入力してください。「 , 」を使って複数検索も出来ます。
					</i>
				</div>
				<br>
				
				<div align="center">
					<div id="modelInfo" align="center"></div>
					<div id="searchResult" align="center" style="color:gray;"></div>
					<div id="arrange" align="center"></div>
					<div id="list"></div>
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
			$(".navmenu-nav > li > a").css("color", "#337ab7");
			$(".navmenu-nav > li > a").css("background-color", "#e0f0ff");
			$(".navmenu-nav > li > a").hover(function() {
				$(this).css("background-color", "#ffffff");
			}, function() {
				$(this).css("color", "#337ab7");
				$(this).css("background-color", "#e0f0ff");
			});
		});
	</script>
</body>
</html>
