<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
   
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href="./resources/css/jasny-bootstrap.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./resources/css/navmenu-reveal.css" rel="stylesheet">
    <link href="./resources/css/style.css" rel="stylesheet">
  	<link href="./resources/css/full-slider.css" rel="stylesheet">
    

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/geo-location-javascript/0.4.8/geo.js"></script>
<script src="./resources/js/highcharts.js"></script>
<script src="./resources/js/series-label.js"></script>
<script src="./resources/js/exporting.js"></script>
<script src="./resources/js/export-data.js"></script>
<script>
	$(function() {
		/* 홈화면으로 가기. 단 아직 메인을 만들지 않았기때문에 로그인후의 imsi페이지로 가게 만들었습니다. */
		$("#goHome").on("click",function(){
			location.href="/ictmd/";
		});
		
		/* 새로고침 */
		$("#callback").on("click",function(){
			location.href="/ictmd/weatherNshopping";
		});
		
		/* 처음 페이지 들어오면 현재 접속위치의 날씨정보 출력부분 */
			var currnetLon = ""; // 경도 초기화
			var currentLat = ""; // 위도 초기화
			var cityName = "";
			
			//현재 접속위치의 경도 및 위도 정보 받아오기
			navigator.geolocation.getCurrentPosition(function(position){
				currentLon = position.coords.longitude; 
				currentLat = position.coords.latitude;
				var curUrl = "http:////api.openweathermap.org/data/2.5/weather?lat="+currentLat+"&lon="+currentLon+ "&appid=8d9df8e528baa07108cb74b3776716c3";
				
				$.ajax({
					url : curUrl,
					success : function(data){
						console.log(data);
						var curId = JSON.stringify(data.id);
						$("#widgetDiv").html(showWidget(curId));
					}
				
				})
			})
		
		//날씨에서 검색버튼부분
		$("#searchWeather").on('click',function() {
			showWeather();
		});
		
		//날씨에서 엔터누르면 검색
		$("#city").keydown(function(key) {
			if (key.keyCode == 13) {
				showWeather();
			}
		});
		
		/* 위젯으로 현재 날씨정보 출력 */ 
		// 일단 이쁘게 출력하기위해서 openWeatherMap의 위젯으로 받아옴. css가 가능하다면 원하는데로 출력가능
		function showWidget(id){ 
			
			window.myWidgetParam ? window.myWidgetParam : window.myWidgetParam = [];  
			window.myWidgetParam.push({
				id: 15,
				cityid: id,
				appid: '8d9df8e528baa07108cb74b3776716c3',
				units: 'metric',
				containerid: 'widgetDiv',  
				});  
			(function() {
				var script = document.createElement('script');
				script.async = true;
				script.charset = "utf-8";
				script.src = "//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/weather-widget-generator.js";
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(script, s);
			})();
		}
		var carta = [];
		var raindata = [];
		var tempdata = [];
		var humiddata = [];
		function insertChart(){
			Highcharts.chart('foreTable', {
	 		    chart: {
			        zoomType: 'xy'
			    },
			    title: {
			        text: 'Weather Forecast for '+ cityName
			    },
			   /*  subtitle: {
			        text: 'Source: WorldClimate.com'
			    }, */
			    xAxis: [{
			        categories: carta,
			        crosshair: true
			    }],
			    yAxis: [{ // Primary yAxis
			        labels: {
			            format: '{value}°C',
			            style: {
			                color: Highcharts.getOptions().colors[2]
			            }
			        },
			        title: {
			            text: 'Temperature',
			            style: {
			                color: Highcharts.getOptions().colors[2]
			            }
			        },
			        opposite: true

			    }, { // Secondary yAxis
			        gridLineWidth: 0,
			        title: {
			            text: 'Rainfall',
			            style: {
			                color: Highcharts.getOptions().colors[0]
			            }
			        },
			        labels: {
			            format: '{value} mm',
			            style: {
			                color: Highcharts.getOptions().colors[0]
			            }
			        }

			    }, { // Tertiary yAxis
			        gridLineWidth: 0,
			        title: {
			            text: 'humidity',
			            style: {
			                color: Highcharts.getOptions().colors[1]
			            }
			        },
			        labels: {
			            format: '{value} %',
			            style: {
			                color: Highcharts.getOptions().colors[1]
			            }
			        },
			        opposite: true
			    }],
			    tooltip: {
			        shared: true
			    },
			    legend: {
			        layout: 'vertical',
			        align: 'left',
			        x: 80,
			        verticalAlign: 'top',
			        y: 55,
			        floating: true,
			        backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
			    },
			    series: [{
			        name: 'Rainfall',
			        type: 'column',
			        yAxis: 1,
			        data: raindata,
			        tooltip: {
			            valueSuffix: ' mm'
			        }

			    }, {
			        name: 'Humidity',
			        type: 'spline',
			        yAxis: 2,
			        data: humiddata,
			        marker: {
			            enabled: false
			        },
			        dashStyle: 'shortdot',
			        tooltip: {
			            valueSuffix: ' %'
			        }

			    }, {
			        name: 'Temperature',
			        type: 'spline',
			        data: tempdata,
			        tooltip: {
			            valueSuffix: ' °C'
			        }
			    }]
			});
		}
		
		/* 날씨부분 메인함수 */
		function showWeather(){			
			cityName = $("#city").val();
			var urlAddr = "http:////api.openweathermap.org/data/2.5/weather?q="+ cityName+ "&appid=8d9df8e528baa07108cb74b3776716c3";
			
			$.ajax({ 
				url : urlAddr,
				type : "get",
				dataType : "json",
				success : function(data) {
					/* 여기 콘솔있는쪽은 그냥 이러한 정보를 받아올수 있다 이런거 보여주려고 만든거고 추후에 삭제예정 */
					//어떤데이터를 출력할지를 모르니까 우선은...
					console.log(data);
					console.log("검색한 도시명 : " + data.name);
					console.log("위도 및 경도 : " + data.coord.lon+ ", " + data.coord.lat)
					console.log("현재 날씨 : "+ data.weather[0].main);
					console.log("아이콘 : "+ data.weather[0].icon);
					console.log("현재온도 : "+ (data.main.temp - 273.15));
					console.log("지역순간최고온도 : "+ (data.main.temp_max - 273.15)); // 절대온도로 나오니깐...
					console.log("지역순간최저온도 : "+ (data.main.temp_min - 273.15));
					
					var sunrise = data.sys.sunrise;
					var sunset = data.sys.sunset;
					var sunriseTime = new Date(sunrise * 1000).toLocaleTimeString();
					var sunsetTime = new Date(sunset * 1000).toLocaleTimeString();
					console.log("일출시간 : " + sunriseTime);
					console.log("일몰시간 : " + sunsetTime);
					console.log("흐림정도 : " + data.clouds.all+ "%");
					
					if(data.weather[0].main == 'Clouds'){
						$("#weaDiv").css("background-image","url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdJ6rOKMlmg6fauCNr7A6Mv0ZkQmIv8SuR0W_3gKfyX5Wgyxa2Xg')")
					} else if(data.weather[0].main == 'Clear'){
						$("#weaDiv").css("background-image","url('https://33.media.tumblr.com/99d65792681f52fd0b3d8a48dd792213/tumblr_muvd3ytmBw1qztgoio1_500.gif')")
					} else {
						$("#weaDiv").css("background-image","url('http://i.imgur.com/EWynBnd.gif')")
					}
					
					// 검색한 도시를 위젯으로 출력
					$("#widgetDiv").html('');
					$("#widgetDiv").html(showWidget(data.id));
				}
			});
			
			
			// 이부분은 금일 새벽 3시부터 5일간의 날씨데이터를 3시간 간격의 예보정보를 표로 출력시킨부분
			// 여기도 많은 데이터를 출력할 수 있지만 일단 기본적인데이터만 출력하게 했습니다
			// 여기도 처음접속할때 현재 접속위치의 예보 넣을까하다가 너무 더러워서 일단 뺐어요.
			var foreUrl = "http:////api.openweathermap.org/data/2.5/forecast?q="+ cityName+ "&mode=xml&appid=8d9df8e528baa07108cb74b3776716c3";
			$.ajax({
				url : foreUrl,
				type : "get",
				dataType : "xml",
				success : function(data) {
					console.log(data);
					carta = [];
					raindata = [];
					tempdata = [];
					humiddata = [];
					$(data).find("time").each(function() {
						carta.push($(this).attr("from").substring(0,10) +" "+ $(this).attr("from").substring(11,13));
						humiddata.push(parseFloat($(this).find("humidity").attr("value")));
						tempdata.push(parseFloat(($(this).find("temperature").attr("value")-273.15).toFixed(1)));
						if (($(this).find("precipitation").attr("value") != null) &&
								($(this).find("precipitation").attr("value") > 0.01)){
							var preci = $(this).find("precipitation").attr("value");
							raindata.push(parseFloat(parseFloat(preci).toFixed(2)));
						}
						else{
							raindata.push(0);
						}
						
					});
					
					insertChart();
				}
			});
		}
		
		// 쇼핑에서 엔터누르면 검색
		$("#product").keydown(function(key) {
			if (key.keyCode == 13) {
				playShopping();
			}
		});
		
		// 쇼핑에서 검색버튼
		$("#searchProduct").on("click",function(){
			playShopping();		
		});
		
		// 쇼핑부분 메인함수
		function playShopping(){
			var productName = $("#product").val();
			var urlName = "http://svcs.ebay.com/services/search/FindingService/v1";
			urlName += "?OPERATION-NAME=findItemsByKeywords";
			urlName += "&SERVICE-VERSION=1.0.0";
			urlName += "&SECURITY-APPNAME=kimjaewo-ScitMast-PRD-959c93333-881667c4";
			urlName += "&GLOBAL-ID=EBAY-US";
			urlName += "&RESPONSE-DATA-FORMAT=JSON";
			urlName += "&REST-PAYLOAD";
			urlName += "&keywords="+productName;
			urlName += "&paginationInput.entriesPerPage=5"; // 5개씩 출력. 변경가능하고 페이징하면 매우매우 많이 출력 가능
			
			$.ajax({
				url:urlName,
				type:"get",
				dataType:"jsonp",
				contentType:"application/json;charset=UTF-8;",
				success:function(data){
					var items = data.findItemsByKeywordsResponse[0].searchResult[0].item || [];
					if(items.length == 0){
						alert("찾는 데이터가 없넹 ㅠ");
						$("#product").val('');
						return;
					}
					var html = [];
					var head = "<table><tr><th>사진</th><th>제목</th><th>가격(USD)</th>"
					  
					html.push(head);
					for (var i = 0; i < items.length; ++i) {
						var item     = items[i];
					    var title    = item.title;
					    var price    = item.sellingStatus[0].currentPrice[0].__value__;
					    var pic      = item.galleryURL;
					    var viewitem = item.viewItemURL;
					    if (null != title && null != viewitem) {
					      html.push('<tr><td>' + '<img src="' + pic + '" border="0">' + '</td>' +
					      '<td><a href="' + viewitem + '" target="_blank">' + title + '</a></td><td>'
					      + price + '</td></tr>');
					    }
					  }
					  html.push('</tbody></table>');
					  document.getElementById("results").innerHTML = html.join("");
				}
			});
		}
	});
</script>
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
        <li><a href="index.html">Home</a></li>
        <li><a href="works.html">Works</a></li>
        <li><a href="gallery.html">Gallery</a></li>
        <li><a href="blog.html">Blog</a></li>
        <li><a href="contact.html">Contact</a></li>
      </ul>
      <a class="navmenu-brand" id="goHome"><img src="img/logo.png" width="160"></a>
      <div class="social">
        <a href="#"><i class="fa fa-twitter"></i></a>
        <a href="#"><i class="fa fa-facebook"></i></a>
        <a href="#"><i class="fa fa-instagram"></i></a>
        <a href="#"><i class="fa fa-pinterest-p"></i></a>
        <a href="#"><i class="fa fa-google-plus"></i></a>
        <a href="#"><i class="fa fa-skype"></i></a>
      </div>
      <div class="copyright-text">©Copyright <a href="https://themewagon.com/"> ThemeWagon</a> 2015 </div>
    </div>

    <div id="myCarousel" class="canvas carousel slide" data-ride="carousel">
    <!-- Full Page Image Background Carousel Header -->
    
        <!-- Indicators -->
        <ol class="carousel-indicators xtra-border">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
          <!--   <li data-target="#myCarousel" data-slide-to="2"></li> -->
        </ol>

        <!-- Wrapper for Slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
            	<!-- <div class="fill" style="background-image:url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdJ6rOKMlmg6fauCNr7A6Mv0ZkQmIv8SuR0W_3gKfyX5Wgyxa2Xg');"> -->
            	<div id = "weaDiv" class="fill" style="background-image:url('http://i.imgur.com/EWynBnd.gif');">
            	    <input type="text" id="city" placeholder="도시입력해주셈 ㅋ" />
					<button id="searchWeather">검색!</button>
					<hr>
					<!-- 현재 날씨정보 위젯 출력부분 -->
					<div id="widgetDiv"></div>
					<hr>
					<!-- 5일간의 일기예보 출력부분 -->
					<div id="foreTable"></div>
            	</div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('http://data.1freewallpapers.com/download/anne-hathaway-at-shopping.jpg');">
	                <h2>쇼핑검색</h2>
					<input type="text" id="product" placeholder="품명을 적어주세요"/>
					<button id="searchProduct">검색하기</button>
					<!-- 쇼핑검색결과 출력부분 -->
					<div id="results"></div>
                
                </div>
            </div>
        </div>
    </header>
      <!-- <div class="navbar navbar-default navbar-fixed-top">
        
      </div> -->

      <div class="container page-container">
        <div class="home-page-header">
         
         <!-- <div class="col-md-4 col-md-offset-4"><img src="img/zigzag.png" width="400" height="30"></div> -->
        </div>
        
      </div><!-- /.container -->
    </div>
    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="./resources/js/jasny-bootstrap.min.js"></script>
    <script type="text/javascript" src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/main.js"></script>
    <script>
    $('.carousel').carousel({
        interval: 6000 //changes the speed
    })
    </script>
</body>
</html>