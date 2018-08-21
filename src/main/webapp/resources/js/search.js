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
					var num = e.target.getAttribute("alt");
					$.ajax({
						  data : {
							id : arr[num]
						}
						, method : "POST"
						, url : "detail"
						, success : function(resp) {
							var photo = resp["photo"];
							console.log(JSON.stringify(photo));
						}
					});
				});
			}
		});
	});
});