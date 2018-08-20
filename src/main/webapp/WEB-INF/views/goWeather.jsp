<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#searchWeather").on('click',function(){
			var cityName = $("#city").val();
			var urlAddr = "http:////api.openweathermap.org/data/2.5/weather?q="+cityName+"&appid=8d9df8e528baa07108cb74b3776716c3";
			$.ajax({
				url:urlAddr,
				type:"get",
				dataType:"json",
				success:function(data){
					console.log(data);
					console.log("검색한 도시명 : " + data.name);
					console.log("위도 및 경도 : " + data.coord.lon +", "+ data.coord.lat)
					console.log("현재 날씨 : " + data.weather[0].main);
					console.log("아이콘 : " + data.weather[0].icon);
					console.log("현재온도 : " + (data.main.temp - 273.15));
					console.log("지역순간최고온도 : " + (data.main.temp_max - 273.15));
					console.log("지역순간최저온도 : " + (data.main.temp_min - 273.15));
					var sunrise = data.sys.sunrise;
					var sunset = data.sys.sunset;
					var sunriseTime = new Date(sunrise*1000).toLocaleTimeString();
					var sunsetTime = new Date(sunset*1000).toLocaleTimeString();
					console.log("일출시간 : " + sunriseTime);
					console.log("일몰시간 : " + sunsetTime);
					console.log("흐림정도 : " + data.clouds.all + "%");
				}
			});
			
			var foreUrl = "api.openweathermap.org/data/2.5/forecast?q="+cityName+"&appid=8d9df8e528baa07108cb74b3776716c3";
			$.ajax({
				url:foreUrl,
				type:"get",
				dataType:"data/list.xml",
				success:function(data){
					console.log(data);
				}
			});
		});
	});
</script>
</head>
<body>
<h1>날씨검색하자!!!!</h1>
도시명 : <input type="text" id="city" placeholder="도시입력해주셈 ㅋ"/>
<button id="searchWeather">검색!</button>
</body>
</html>