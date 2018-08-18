var arr;
$(function() {
	$("#button").on("click", function() {
		var tagstr = $("#text").val();
		var tags = tagstr.split(',');
		
		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			data : {
				tags : tags
			}
			, method : "POST"
			, url : "search"
			, success : function(resp) {
				$("#result >").remove();
				var list = resp["list"];
				for (var i in list) {
					var id = list[i].id;
					var url = list[i].squareImageUrl;
					$("#result").append("<img alt='" + id + "' src='" + url + "' style='width:300px;height:300px;'>");
					if ((i+1)%3 == 0) {
						$("#result").append("<br>");
					}
				}
			}
		});
	});
});