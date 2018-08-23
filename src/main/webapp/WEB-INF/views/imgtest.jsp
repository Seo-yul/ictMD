<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
 이미지 분석
</h1>
<form action="./imageRekognition" method="post">
<input name ='imgurl' type="text">
<input type="submit" value="제출">
</form>

<h1>
 POST webhook
</h1>
<form action="./webhook" method="post">
<input name ='events' type="text">
<input type="submit" value="제출">
</form>


</body>
</html>
