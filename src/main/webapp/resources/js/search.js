$(function() {
	$("#button").on("click", function() {
		var str = $("#text").val();
		var strarr = str.split(',');
		
		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			data : {
				tags : strarr
			}
			, method : "POST"
			, url : "list"
			, success : function(resp) {
				$("img").remove();
				$("br").remove();
				var a = 0;
				for (var i in resp) {
					var url = resp[i];
					$("div").append("<img src='" + url + "' style='width:300px;height:300px;'>");
					if (++a%3 == 0) {
						$("div").append("<br>");
					}
				}
			}
		});
	});
});