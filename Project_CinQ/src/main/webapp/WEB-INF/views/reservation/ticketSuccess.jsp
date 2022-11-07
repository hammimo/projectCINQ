<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function success(){
		alert("예매 성공");
		location.href='/root/index';
	}
</script>
<style type="text/css">
* {
	
	margin : 0;
	padding: 0;
}

.main{
	background-color : rgba(0, 0, 0, 0.04);
	width: 100%;
	height: 90vh;
}
</style>
<meta charset="UTF-8">
<title>reservation/ticketSuccess.jsp</title>
</head>
<body onload="success()">
	<c:import url="../default/header.jsp"/>
	<div class="main">
	
	</div>
	<c:import url="../default/footer.jsp"/>
</html>