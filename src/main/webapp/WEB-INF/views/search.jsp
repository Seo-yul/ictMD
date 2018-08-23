<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Search</title>
	<link rel="stylesheet" type="text/css" href="./resources/css/search.css">
	<script src="./resources/js/jquery-3.3.1.min.js"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
	<script src="./resources/js/search.js"></script>
</head>
<body>
	<h1>검색</h1>
	<input id="text" type="text">
	<input id="button" type="button" value="Search">
	<div>',' 구분자로 복수 태그 검색 가능 ex) dog,cat,bird,sheep</div>
	<br>
	<div id="list"></div>
</body>
</html>