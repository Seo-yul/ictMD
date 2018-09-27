var arr;
var uarr;
var status = 0;

// 5. 서버로부터 가져온 상세 사진 정보를 화면에 그리는 함수
var popup = function(resp) {
	var photo = resp["photo"];
	var exif = resp["exif"];
	$("body").append("<div id='layer'></div>");
	var layer = $("#layer");
	layer.css("top", Math.max(0, $(window).scrollTop() + 60) + "px");
	layer.append("<div id='close'>X</div>");
	layer.append("<img id='pic' src='" + photo["url"] + "' align='center'><br>");
	var pic = $("#pic");
	pic.on("load", function() {
		if (this.naturalWidth > 1024) {
			pic.css("width", "1024px");
			pic.css("height", (this.naturalHeight * 1024 / this.naturalWidth) + "px");
		}
	});
	layer.append("<div id='layerFrame' style='margin:20px;'></div>");
	var lf = $("#layerFrame");
	lf.append("<div class='detail'>▶ Tags : </div><br>");
	$.each(photo["tags"], function(index, item) {
		lf.append("<input id='taginput' class='form-control tags' value='#"+item+"'/>　");
	});
	if (photo["latitude"] !== 0) {
		lf.append("<div class='detail'>▶ latitude : " + photo["latitude"] + "</div><br>");
		lf.append("<div class='detail'>▶ longitude : " + photo["longitude"] + "</div><br>");
	}
	if (JSON.stringify(exif).length > 2) {
		lf.append("<div class='detail'>▶ EXIFs : </div><br>");
		lf.append("<div id='exifdiv' style='float:center;'></div>");
		$("#exifdiv").append("<div id='cameradiv' style='display:inline-block;'></div>");
		var index = 0;
		$("#cameradiv").append("<img src='./resources/img/exifcamera.png' width='380'>");
		$("#cameradiv").append("<table id='exifCamera' border='1' align='center'></table>");
		var exifCamera = $("#exifCamera");
		var item = exif["Make"];
		if (item != null) {
			exifCamera.append("<tr><td>Maker</td><td>" + item + "</td></tr>");
			index++;
		}
		item = exif["Model"];
		if (item != null) {
			exifCamera.append("<tr><td>Model</td><td>" + item + "</td></tr>");
			index++;
		}
		item = exif["Flash"];
		if (item != null) {
			exifCamera.append("<tr><td>Flash</td><td>" + item + "</td></tr>");
			index++;
		}
		item = exif["Exposure"];
		if (item != null) {
			exifCamera.append("<tr><td>Exposure</td><td>" + item + "</td></tr>");
			index++;
		}
		item = exif["Aperture"];
		if (item != null) {
			exifCamera.append("<tr><td>Aperture</td><td>" + item + "</td></tr>");
			index++;
		}
		item = exif["Focal Length"];
		if (item != null) {
			exifCamera.append("<tr><td>Focal Length</td><td>" + item + "</td></tr>");
			index++;
		}
		item = exif["Lens"];
		if (item != null) {
			exifCamera.append("<tr><td>Lens</td><td>" + item + "</td></tr>");
			index++;
		}
		if (index == 0) {
			$("#cameradiv").remove();
		}
		$("#exifdiv").append("<div id='picturediv' style='display:inline-block;'></div>");
		index = 0;
		$("#picturediv").append("<img src='./resources/img/exifpicture.png' width='380'>");
		$("#picturediv").append("<table id='exifPicture' border='1' align='center'></table>");
		var exifPicture = $("#exifPicture");
		item = exif["Date and Time (Original)"];
		if (item != null) {
			exifPicture.append("<tr><td>Date and Time (Original)</td><td>" + item + "</td></tr>");
			index++;
		}
		item = exif["Image Width"];
		if (item != null) {
			exifPicture.append("<tr><td>Image Width</td><td>" + item + "</td></tr>");
			index++;
		}
		item = exif["Image Height"];
		if (item != null) {
			exifPicture.append("<tr><td>Image Height</td><td>" + item + "</td></tr>");
			index++;
		}
		item = exif["Compression"];
		if (item != null) {
			exifPicture.append("<tr><td>Compression</td><td>" + item + "</td></tr>");
			index++;
		}
		item = exif["Format"];
		if (item != null) {
			exifPicture.append("<tr><td>Format</td><td>" + item + "</td></tr>");
			index++;
		}
		if (index == 0) {
			$("#picturediv").remove();
		}
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
	$("#loading").css("top", Math.max(0, $(window).scrollTop() + 240) + "px");
	$("#loading").show();
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

var timeasc = function() {
	if (!$("#list >").length) {
		return;
	}
	var list = $("#list");
	list.off();
	$("#list >").remove();
	for (var i = 0; i < arr.length; i++) {
		list.append("<img alt='" + i + "' class='result' src='" + uarr[i] + "'>");
	}
	if (status == 0) {
		$("#list > img").css("width", "150px");
		$("#list > img").css("height", "150px");
	} else {
		$("#list > img").css("width", "300px");
		$("#list > img").css("height", "300px");
	}
	list.on("click", "img", function(e) {
		detail(e);
	});
}

var timedesc = function() {
	if (!$("#list >").length) {
		return;
	}
	var list = $("#list");
	list.off();
	$("#list >").remove();
	for (var i = arr.length; i > 0; i--) {
		list.append("<img alt='" + (i - 1) + "' class='result' src='" + uarr[(i - 1)] + "'>");
	}
	if (status == 0) {
		$("#list > img").css("width", "150px");
		$("#list > img").css("height", "150px");
	} else {
		$("#list > img").css("width", "300px");
		$("#list > img").css("height", "300px");
	}
	list.on("click", "img", function(e) {
		detail(e);
	});
}

// 3. 서버로부터 전송받은 사진 목록을 화면에 그리는 함수.
var listup = function(resp) {
	arr = new Array();
	uarr = new Array();
	var modelInfo = $("#modelInfo");
	if (modelInfo.length) {
		$("#modelInfo >").remove();
	}
	var model = resp["model"];
	if (model.length) {
		for (var i in model) {
			modelInfo.append("<br><div><h3 style='color:black; font-weight: bold;'>" + model[i]["maker"] + " " + model[i]["model"] + "</h3>");
			modelInfo.append("<img src='" + model[i]["imgUrl"] + "'>");
			modelInfo.append("<div style='color:black;'>" + JSON.stringify(model[i]) + "</div><br>");
		}
	}
	var result = resp["list"];
	$("#searchResult > ").remove();
	$("#searchResult").append("<h2 style='font-size:15px;'>「<span style='color:#337ab7;font-weight: bold;'>"+ $("#text").val() + "</span>」の検索結果 : <span style='color:#337ab7;font-weight: bold;'>" + result.length + "</span>件の結果があります。</h2>");
	$("#arrange >").remove();
	$("#arrange").append("<input id='timeasc' type='button' value='最新順'>");
	$("#timeasc").on("click", timeasc);
	$("#arrange").append("<input id='timedesc' type='button' value='古い順'>");
	$("#timedesc").on("click", timedesc);
	$("#arrange").append("<input id='bigger' type='button' value='大きく'>");
	$("#bigger").on("click", function() {
		status = 1;
		$("#list > img").css("width", "300px");
		$("#list > img").css("height", "300px");
	});
	$("#arrange").append("<input id='smaller' type='button' value='小さく'>");
	$("#smaller").on("click", function() {
		status = 0;
		$("#list > img").css("width", "150px");
		$("#list > img").css("height", "150px");
	});
	var list = $("#list");
	
	if (result.length) {
		for (var i in result) {
			arr[i] = result[i].id;
			uarr[i] = result[i].squareImageUrl;
			list.append("<img alt='" + i + "' class='result' src='" + uarr[i] + "'>");
		}
		list.off();
		list.on("click", "img", function(e) {
			detail(e);
		});
	}
	$("#loading").hide();
	$("#dim").hide();
}

// 2. 검색 이벤트가 발생할 경우 호출되는 함수. 서버에서 사진 목록을 가져오고, 화면에 그리는 함수를 호출함.
var search = function() {
	$("#dim").show();
	$("#loading").css("top", Math.max(0, $(window).scrollTop() + 240) + "px");
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
			$("#list > img").remove();
			listup(resp);
		}
	});
}

var init = function() {
	$(".bar").css("background-color", "#337ab7");
    $(".navbar-toggle").css("background", "url(./resources/img/navicon2.jpg)");
    $(".navbar-toggle").css("background-repeat", "no-repeat");
    $(".navmenu-fixed-left").css("background-color", "#80c0e0");
    $(".navmenu-nav").css("background-color", "#c0e0ff");
    $(".navmenu-nav > li > a").css("color", "#303030");
    $(".navmenu-nav > li > a").hover(function() {
      $(this).css("color", "#337ab7");
      $(this).css("background-color", "#ffffff");
    }, function() {
      $(this).css("color", "#303030");
      $(this).css("background-color", "#c0e0ff");
    });
    $(".copyright-text").css("color", "#202020");
}

// 1. 검색 이벤트를 본문에 걸어두는 부분.
$(function() {
	init();
	$("#searchButton").on("click", search);
	$("#text").keydown(function(key) {
		if (key.keyCode == 13) {
			search();
		}
	});
	$("#loading").hide();
	$("#dim").hide();
});