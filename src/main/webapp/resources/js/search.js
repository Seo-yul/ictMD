var arr;
$(function() {
	$("#button").on("click", function() {
		var tagstr = $("#text").val();
		if (tagstr.length <= 0) {
			alert("!");
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
				$("#list").on("click", function(e) {
					if ($(e.target).is("img")) {
						var num = e.target.getAttribute("alt");
						$.ajax({
							  data : {
								id : arr[num]
							}
							, method : "POST"
							, url : "detail"
							, success : function(resp) {
								var photo = resp["photo"];
								/*console.log(JSON.stringify(photo));*/
								$("body").append("<div id='overlay_t'></div>");
								$("body").append("<div id='popup_layer'></div>");
								$("#popup_layer").css("top", Math.max(0, $(window).scrollTop() + 60) + "px");
								$("#popup_layer").append("<img src='" + photo["url"] + "' align='center'>");
								$("#overlay_t").on("click", function() {
									$("#popup_layer").remove();
									$("#overlay_t").remove();
								})
							}
						});
					}
					
				});
			}
		});
	});
});