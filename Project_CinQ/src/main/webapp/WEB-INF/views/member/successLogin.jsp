
<!-- member/successLogin.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/successLogin.jsp</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap login">
		<h1>로그인 성공 : ${loginUser}님 안녕하세요 ^^</h1>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>