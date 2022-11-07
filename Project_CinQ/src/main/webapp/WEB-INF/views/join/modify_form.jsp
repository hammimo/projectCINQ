
<!-- modify_form.jsp  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/modify_form.jsp</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src='<c:url value="/resources/script/js/file.js"/>'></script>
<link href="${contextPath}/resources/script/css/form.css" rel="stylesheet" type="text/css">

<style type="text/css">
*{
font-family: 'Hahmlet', serif;
}
.modify_title {
	text-align: center;
}
.modify {
	width: 500px;
	margin: auto;
}
p{
	font-size: 18px;
	font-weight : bold;
	padding-top: 2%;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<hr>
	<div id="wrapper">
	<br>
	<h1 class="modify_title">수정하기</h1>
	<br>
	<div class="modify" align="center">
		<div class="modify_save">
		<form action="${contextPath }/join/modify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="id" value="${ProjectInfo.id}">
			<input type="hidden" name="originFileName" value="${ProjectInfo.image}">
			<input type="hidden" name="write_no" value="${ProjectInfo.write_no}">
			<!-- 이미지 변경 시 삭제에 사용  -->
			<p>제 목</p>
			<input type="text" name="title" value="${ProjectInfo.title}" size="50"><br>
			<p>내 용</p>
			<textarea rows="10" cols="50" name="content">${ProjectInfo.content }</textarea><br>
			<p>파일 첨부</p>
			<img src="${contextPath }/join/download?imageFileName=${ProjectInfo.image}" id="preview" width="450px" height="350px"><br><br>
			<input type="file" name="image_file_name" onchange="readURL(this)"><br>
			<p>현재 인원</p>
			<input type="number" name ="cur_count" value="${ProjectInfo.cur_count}"> <br>
			<p>모집 정원</p>
			<input type="number" name ="max_count" value="${ProjectInfo.max_count}">
			<br><br>
			<button type="submit" value="작성완료">수정완료</button>
		</form>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>