<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/geo-location-javascript/0.4.8/geo.js"></script>
<script>
	$(function() {
		var currnetLon = "";
		var currentLat = "";
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
		
		$("#searchWeather").on('click',function() {
			var cityName = $("#city").val();
			var urlAddr = "http:////api.openweathermap.org/data/2.5/weather?q="+ cityName+ "&appid=8d9df8e528baa07108cb74b3776716c3";
			
			$.ajax({
				url : urlAddr,
				type : "get",
				dataType : "json",
				success : function(data) {
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
					$("#widgetDiv").html('');
					$("#widgetDiv").html(showWidget(data.id));
				}
			});
			
			
			
			var foreUrl = "http:////api.openweathermap.org/data/2.5/forecast?q="+ cityName+ "&mode=xml&appid=8d9df8e528baa07108cb74b3776716c3";
			$.ajax({
				url : foreUrl,
				type : "get",
				dataType : "xml",
				success : function(data) {
				var ft = "<table border='1'><tr><th>시간</th><th>날씨</th><th>온도</th><th>강우량</th></tr>";
			
				$(data).find("time").each(function() {
				var times = $(this).attr("from").substring(0,10) +" "+ $(this).attr("from").substring(11,13);
				ft += "<tr><td>"+times+"</td>";
				ft += "<td>"+$(this).find("symbol").attr("name")+"</td>";
				ft += "<td>"+($(this).find("temperature").attr("value")-273.15).toFixed(1)+"</td>";

				if (($(this).find("precipitation").attr("value") != null) &&
						($(this).find("precipitation").attr("value") > 0.01)){
					var preci = $(this).find("precipitation").attr("value");
					ft += "<td>"+parseFloat(preci).toFixed(2)+"</td>";
				}
				else{
					ft += "<td>0</td>";
				}
				ft += "</tr>";
				
				});
				ft += "</table>";
				$("#foreTable").html('');
				$("#foreTable").html(ft);
				}
			});
			
		});
	});
</script>
</head>
<body>
	<h1>날씨검색하자!!!!</h1>
	<hr>
	도시명 :
	<input type="text" id="city" placeholder="도시입력해주셈 ㅋ" />
	<button id="searchWeather">검색!</button>
	<hr>
	<div id="widgetDiv"></div>
	<hr>
	<div id="foreTable"></div>
</body>
</html>