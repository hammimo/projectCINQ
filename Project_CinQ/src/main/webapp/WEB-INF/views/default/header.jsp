
<!-- default/header.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>default/header.jsp</title>
<style type="text/css">
* { 
	margin: 0;
}
.wrap {
	width: 1000px;
	margin: auto;
	background-color: gray;
}
.header {
	width: 1000px;
}
.title {
	font-size: 50px;
	text-align: center;
	margin-top: 40px;
	padding-bottom: 20px;
	background-color: orange;
}
.navdiv {
	width: 100%;
	background-color: green
}
nav {
	width: 1000px;
	background-color: olive;
}

</style>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<h1 class="title">CINQ</h1>
		</div>
	</div>
	<!-- // wrap -->
	<div class="navdiv">
		<div class="wrap">


		</div>
	</div>
	<!-- // navdiv -->
</body>
</html>