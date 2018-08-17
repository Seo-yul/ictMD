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
		$("#logout").click(function(){
			$.ajax({
				url:"logout",
				type:"get",
				success:function(data){
					alert("bye~");
					location.href="/ictmd"
				}
			});
		});
		
		$("#fixUser").click(function(){
			alert("아직 안만듬 ㅋ");
		});
	});
</script>
</head>
<body>
<h1>뀨뀨 로그인성공 ㅊㅋㅊㅋ</h1>
<h1>${sessionScope.userId }님 안녕?</h1>
<h1>${sessionScope.userName }님 ㅎㅇㅎㅇ</h1>
<a id="logout">로그인하고싶으면 이거눌러 ㅋ</a>
<br>
<br>
<a id="fixUser">아니면 회원정보수정하고싶은 이거 누르고 ㅋㅋ</a>
</body>
</html>