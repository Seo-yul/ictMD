<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>사진 검색</title>
	<link rel="stylesheet" type="text/css" href="./resources/css/search.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="./resources/js/search.js"></script>


    <title>Photo Graphy</title>

    <!-- Bootstrap core CSS -->
   
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href="./resources/dist/css/jasny-bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./resources/css/navmenu-reveal.css" rel="stylesheet">
    <link href="./resources/css/style.css" rel="stylesheet">
    <link href="./resources/css/full-slider.css" rel="stylesheet">
    <link href="./resources/css/Icomoon/style.css" rel="stylesheet" type="text/css" />
    <link href="./resources/css/animated-masonry-gallery.css" rel="stylesheet" type="text/css" />
    <link href="./resources/css/lightbox.css" rel="stylesheet" type="text/css" />
    

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
    #back {
    	background-image: url("./resources/img/KensImg/black-space.jpg");
    	padding-bottom: 700px;
    	padding-top:100px;
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
	

    </style> 
    
    
  </head>

  <body >
  <div class="bar">
    <button type="button" class="navbar-toggle" data-toggle="offcanvas" data-recalc="false" data-target=".navmenu" data-canvas=".canvas">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
    </button>
  </div>
    <div class="navmenu navmenu-default navmenu-fixed-left">
      <ul class="nav navmenu-nav">
        <li><a href="kenMain">Home</a></li>
        <li><a href="kenSearch">Search</a></li>
        <li><a href="Trend">Trend</a></li>
        <li><a href="Shop">Shop</a></li>
        <li><a href="ETC">ETC</a></li>
      </ul>
      <a class="navmenu-brand" href="#"><img src="./resources/img/logo.png" width="160"></a>
      <div class="social">
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-instagram"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
        <a href="#"><i class="fa fa-google-plus"></i></a>
        <a href="#"><i class="fa fa-skype"></i></a>
      </div>
      <div class="copyright-text">Â©Copyright <a href="https://themewagon.com/"> ThemeWagon</a> 2015 </div>
    </div>
    
	
    <div class="canvas gallery" >
   		<div id="bback">
    	<div id="back">
        <h1 class="blog-post-title text-center" style="color:white; " >欲しかったカメラの写真を検索しましょう</h1>
        <span class="title-divider" style="padding-bottom:25px;"></span>

      <div id="container" class="container">
      	<div class="" align="center">
 			<table>
 				<tr>
					<td width="650px">
						<input id="text" name="name" type="text" class="form-control" placeholder="検索は「 , 」で区分して複数検索も出来ます。 例) dog,cat,bird,sheep"> 
					</td>
                 	<td>
                 		<input id="button" class="form-control" type="button" value="Search">
                 	</td>
              	</tr>
         	</table>
         	<br>
		</div>
			<!-- 검색한 사진 뿌려주는 div -->	
          <div id="list" align="center"class="all landscape"></div>
          
			<div id="loading" class="preloader-1">
					<div id="loader">Loading</div>
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
          
      </div>
    </div>
    </div>
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="./resources/js/jquery.js"></script>
    <script type="text/javascript" src="./resources/js/jquery-ui-1.10.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js">
    </script>
    <script type="text/javascript" src="./resources/js/isotope.js"></script>
    <script type="text/javascript" src="./resources/js/animated-masonry-gallery.js"></script>
    <script src="./resources/dist/js/jasny-bootstrap.min.js"></script>
    <script src="./resources/js/main.js"></script>
    <script src="./resources/js/lightbox.js"></script>
  </body>
</html>
