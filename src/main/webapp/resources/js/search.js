var arr;
var varr;
var farr;
var carr;
var uarr;
var larr;

// 5. 서버로부터 가져온 상세 사진 정보를 화면에 그리는 함수
var popup = function(resp) {
	var photo = resp["photo"];
	var exif = JSON.stringify(resp["exif"]);
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
	layer.append("<div>Views: " + photo["views"] + "</div>");
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
		$("#dim").off();
		$("#dim").hide();
	});
	$("#loading").hide();
}

// 4. 검색된 사진 목록에서 임의의 사진 하나를 클릭하면 서버에서 해당 사진에 대한 상세 정보를 가져오는 함수.
var detail = function(e) {
	$("#dim").show();
	$("#loading").css("top", Math.max(0, $(window).scrollTop() + 300) + "px");
	$("#loading").show();
	var num = e.target.getAttribute("alt");
	$("#" + num + " > div").remove();
	$("#" + num).append("<div>views : " + (varr[num] + 1) + "</div>");
	varr[num] += 1;
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
	varr = new Array();
	farr = new Array();
	carr = new Array();
	uarr = new Array();
	var list = $("#list");
	if ($("#list >").length) {
		list.off();
		$("#list >").remove();
	}
	var model = resp["model"];
	if (model != null) {
		for (var i in model) {
			list.append("<br><h3>" + model[i]["maker"] + " " + model[i]["model"] + "</h3>");
			list.append("<img src='" + model[i]["imgUrl"] + "'>");
			list.append("<div>" + JSON.stringify(model[i]) + "</div><br>");
		}
	}
	var result = resp["list"];
	$("#searchResult > ").remove();
	$("#searchResult").append("<h3 style='font-size:15px;'>「"+ $("#text").val() + "」の検索結果 : " + result.length + "件の結果があります。</h3>");
	for (var i in result) {
		arr[i] = result[i].id;
		varr[i] = result[i].views;
		farr[i] = result[i].favorites;
		carr[i] = result[i].comments;
		uarr[i] = result[i].squareImageUrl;
		list.append("<div id='" + i + "' class='frame'></div>");
		$("#" + i).append("<img alt='" + i + "' class='result' src='" + uarr[i] + "'>");
		$("#" + i).append("<div>views : " + varr[i] + "</div>");
		if ((i+1)%4 == 0) {
			list.append("<br>");
		}
	}
	list.on("click", "img", function(e) {
		detail(e);
	});
	$("#loading").hide();
	$("#dim").hide();
}

// 2. 검색 이벤트가 발생할 경우 호출되는 함수. 서버에서 사진 목록을 가져오고, 화면에 그리는 함수를 호출함.
var search = function() {
	$("#dim").show();
	$("#loading").css("top", Math.max(0, $(window).scrollTop() + 300) + "px");
	$("#loading").show();
	var tagstr = $("#text").val().trim();
	if (tagstr.length <= 0) {
		$("#loading").hide();
		$("#dim").hide();
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

var timeasc = function() {
	if ($("#list >").length <= 0) {
		return;
	}
	var list = $("#list");
	list.off();
	$("#list >").remove();
	for (var i = 0; i < arr.length; i++) {
		list.append("<div id='" + i + "' class='frame'></div>");
		$("#" + i).append("<img alt='" + i + "' class='result' src='" + uarr[i] + "'>");
		$("#" + i).append("<div>views : " + varr[i] + "</div>");
	}
	list.on("click", "img", function(e) {
		detail(e);
	});
}
var timedesc = function() {
	if ($("#list >").length <= 0) {
		return;
	}
	var list = $("#list");
	list.off();
	$("#list >").remove();
	for (var i = arr.length; i > 0; i--) {
		list.append("<div id='" + (i - 1) + "' class='frame'></div>");
		$("#" + (i - 1)).append("<img alt='" + (i - 1) + "' class='result' src='" + uarr[(i - 1)] + "'>");
		$("#" + (i - 1)).append("<div>views : " + varr[(i - 1)] + "</div>");
	}
	list.on("click", "img", function(e) {
		detail(e);
	});
}
var viewasc = function() {
	if ($("#list >").length <= 0) {
		return;
	}
	larr = new Array();
	larr[0] = varr[0];
	for (var i = 1; i < arr.length; i++) {
		for (var j = 0; j < i; j++) {
			if (varr[i] < varr[j]) {
				larr.splice(j, 0, i);
			} else {
				if (j == i - 1) {
					larr[i] = i;
				} else {
					continue;
				}
			}
		}
	}
	console.log(JSON.stringify(larr));
	var list = $("#list");
	list.off();
	$("#list >").remove();
	for (var k = 0; k < larr.length; k++) {
		var n = larr[k];
		list.append("<div id='" + n + "' class='frame'></div>");
		$("#" + n).append("<img alt='" + n + "' class='result' src='" + uarr[n] + "'>");
		$("#" + n).append("<div>views : " + varr[n] + "</div>");
	}
	list.on("click", "img", function(e) {
		detail(e);
	});
}
var viewdesc = function() {
	if ($("#list >").length <= 0) {
		return;
	}
	$("#list").off();
	$("#list >").remove();
	$("#list").append("<div id='0' class='frame'></div>");
	$("#0").append("<img alt='0' class='result' src='" + arr[0] + "'>");
	$("#0").append("<div>views : " + varr[0] + "</div>");
	for (var i = 1; i < 100; i++) {
		
	}
}

// 1. 검색 이벤트를 본문에 걸어두는 부분.
$(function() {
	$("#loading").hide();
	$("#dim").hide();
	$("#button").on("click", search);
	$("#text").keydown(function(key) {
		if (key.keyCode == 13) {
			search();
		}
	});
	$("#timeasc").on("click", timeasc);
	$("#timedesc").on("click", timedesc);
	$("#viewasc").on("click", viewasc);
	$("#viewdesc").on("click", viewdesc);
});