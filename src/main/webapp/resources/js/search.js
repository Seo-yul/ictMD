var arr;

// 5. 서버로부터 가져온 상세 사진 정보를 화면에 그리는 함수
var popup = function(resp) {
	var photo = resp["photo"];
	var exif = JSON.stringify(resp["exif"]);
	$("body").append("<div id='dim'></div>");
	$("body").append("<div id='layer'></div>");
	var layer = $("#layer");
	layer.css("top", Math.max(0, $(window).scrollTop() + 60) + "px");
	layer.append("<div id='close'>X</div>");
	layer.append("<img id='pic' src='" + photo["url"] + "' align='center'>");
	var pic = $("#pic");
	pic.on("load", function() {
		if (this.naturalWidth > 1024) {
			pic.css("width", "1024px");
			pic.css("height", (this.naturalHeight * 1024 / this.naturalWidth) + "px");
		}
	});
	layer.append("<div>Tags: </div>");
	$.each(photo["tags"], function(index, item) {
		layer.append("<div class='tags'>#" + item + "　</div>");
	});
	if (photo["latitude"] !== 0) {
		layer.append("<div>latitude : " + photo["latitude"] + "</div>");
		layer.append("<div>longitude : " + photo["longitude"] + "</div>");
	}
	if (exif.length > 2) {
		layer.append("<div>EXIF : </div>");
		layer.append("<div>" + exif + "</div>");
	}
	$("#dim, #close").on("click", function() {
		layer.remove();
		$("#dim").remove();
	});
}

// 4. 검색된 사진 목록에서 임의의 사진 하나를 클릭하면 서버에서 해당 사진에 대한 상세 정보를 가져오는 함수.
var detail = function(e) {
	var num = e.target.getAttribute("alt");
	$.ajax({
		  data : {
			id : arr[num]
		}
		, method : "POST"
		, url : "detail"
		, success : function(resp) {
			popup(resp);
		}
	});
}

// 3. 서버로부터 전송받은 사진 목록을 화면에 그리는 함수.
var listup = function(resp) {
	arr = new Array();
	if ($("#list >").length) {
		$("#list").off();
		$("#list >").remove();
	}
	var list = resp["list"];
	for (var i in list) {
		arr[i] = list[i].id;
		var url = list[i].squareImageUrl;
		$("#list").append("<img alt='" + i + "' src='" + url + "' style='width:300px;height:300px;'>");
		if ((i+1)%3 == 0) {
			$("#list").append("<br>");
		}
	}
	$("#list").on("click", "img", function(e) {
		detail(e);
	});
}

// 2. 검색 이벤트가 발생할 경우 호출되는 함수. 서버에서 사진 목록을 가져오고, 화면에 그리는 함수를 호출함.
var search = function() {
	var tagstr = $("#text").val().trim();
	if (tagstr.length <= 0) {
		alert("Please insert any tags.");
		$("#text").focus();
		return;
	}
	var tags = tagstr.split(',');
	
	jQuery.ajaxSettings.traditional = true;

	$.ajax({
		  data : {
			tags : tags
		}
		, method : "POST"
		, url : "list"
		, success : function(resp) {
			listup(resp);
		}
	});
}

// 1. 검색 이벤트를 본문에 걸어두는 부분.
$(function() {
	$("#button").on("click", search);
	$("#text").keydown(function(key) {
		if (key.keyCode == 13)
			search();
	});
});