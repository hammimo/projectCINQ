<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMenu</title>
<style type="text/css">
.adminMenu { position: fixed; right: 50px; top: 50%; z-index: 100; width: 128px;  margin: -220px 0 0 0; }
.adminMenu a { display: block; width: 123px; padding: 10px 0;color: #fff; text-align: center; border: 1px solid #464646; text-decoration: none;}
.adminMenu li {	list-style-type : none; }
.adminMenu li a{ background-color: gray; }
.adminMenu li a:hover { background-color: #3c3c3c; }
</style>
</head>
<body>
	<div class="adminMenu">
		<ul>
			<li><a href="/root/admin/memberAllList">회원관리</a></li>
			<li><a href="/root/admin/placeAllList">장소관리</a></li>
			<li><a href="/root/admin/reservationList">예약글관리</a></li>
		</ul>
	</div>
</body>
</html>