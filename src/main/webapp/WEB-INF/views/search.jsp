<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>사진 검색</title>
	<link rel="stylesheet" type="text/css" href="./resources/css/search.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="./resources/js/search.js"></script>
</head>
<body>
	<div id="toMain">
		<form action="main">
			<input type="submit" value="메인 화면으로">		
		</form>
	</div>
	<h1>사진 검색</h1>
	<input id="text" type="text">
	<input id="button" type="button" value="Search">
	<div>',' 구분자로 복수 태그 검색 가능 ex) dog,cat,bird,sheep</div>
	<div id="list"></div>
</body>
</html>