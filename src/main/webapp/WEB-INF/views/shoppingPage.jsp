<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#goHome").on("click",function(){
			location.href="/ictmd/imsi";
		});
		
		$("#product").keydown(function(key) {
			if (key.keyCode == 13) {
				playShopping();
			}
		});

		$("#callback").on("click",function(){
			location.href="/ictmd/goShopping";
		});
		
		$("#find").on("click",function(){
			playShopping();		
		});
		
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
			urlName += "&paginationInput.entriesPerPage=5"; // 5개씩 출력
			$.ajax({
				url:urlName,
				type:"get",
				dataType:"jsonp",
				contentType:"application/json;charset=UTF-8;",
				success:function(data){
					var items = data.findItemsByKeywordsResponse[0].searchResult[0].item || [];
					var html = [];
					var head = "<table><tr><th>사진</th><th>제목</th><th>가격(USD)</th>"
					  
					html.push(head);
					for (var i = 0; i < items.length; ++i) {
						var item     = items[i];
					    var title    = item.title;
					    var price    = item.sellingStatus[0].currentPrice[0].__value__;
					    var pic      = item.galleryURL;
					    var viewitem = item.viewItemURL;
					    console.log(price);
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
		
		
	})
	
</script>

</head>
<body>
<a id="goHome">홈으로</a>
<a id="callback">새로고침</a>
<h1>이베이쇼핑 테스트!!</h1>
찾으려는 물품 이름 : <input type="text" id="product" placeholder="품명을 적어주세요"/>
<button id="find">검색하기</button>
<div id="results"></div>

</body>
</html>