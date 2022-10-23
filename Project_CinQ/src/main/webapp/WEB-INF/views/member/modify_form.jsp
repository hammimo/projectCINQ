
<!-- board/modify_form.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/modify_form.jsp</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.modify_title {
	text-align: center;
}
.modify {
	width: 500px;
	margin: auto;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<h1 class="modify_title">${info.name } 님의 회원정보 수정</h1>
	<div class="modify" align="center">
		<div class="modify_form">
		<form action="${contextPath }/member/modify" enctype="multipart/form-data" method="post">
			<b>핸 드 폰</b>
			<input type="text" name="tel" value="${info.tel }" size="50"><br>
			<b>닉 네 임</b>
			<input type="text" name="nickname" value="${info.nickname }" size="50"><br>
			<b>비밀번호</b>
			<input type="text" name="pw" value="${info.pw }" size="50"><br>
			<input type="submit" value="수정완료"> &nbsp;
			<input type="button" value="돌아가기" onclick="location.href='${contextPath}/member/myinfo1?id=${loginUser}'"> 
		</form>
		</div>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>

























