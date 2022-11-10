
<!-- place/placeModifyForm.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<link href="${contextPath}/resources/script/css/form.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function readURL(input){
		var file = input.files[0]; // 파일 정보
		if(file != ""){
			var reader = new FileReader();
			reader.readAsDataURL(file); // 파일 정보 읽어오기
			reader.onload = function(e){ // 읽기에 성공하면 결과 표시
				$("#preview").attr("src", e.target.result)
			}
		}
	}
</script>
<style type="text/css">
body{
	background-color: rgba(0, 0, 0, 0.04);
}

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
img {
	width: 450px;
	height: 350px;
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
	<div class="modify" align="center">
		<div class="modify_save">
		<form action="${contextPath }/place/modify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="id" value="${placeData.id}">
			<input type="hidden" name="originFileName" value="${placeData.image}">
			<input type="hidden" name="write_no" value="${placeData.write_no}">
			<!-- 이미지 변경 시 삭제에 사용  -->
			<p>제 목</p><br>
			<input type="text" name="title" value="${placeData.title}" size="50"><br>
			<p>내 용</p><br>
			<textarea rows="10" cols="50" name="content">${placeData.content }</textarea><br>
			<p>파일 첨부</p>
			<img src="${contextPath }/place/download?imageFileName=${placeData.image}" id="preview" width="450px" height="350px"><br><br>
			<input type="file" name="image_file_name" onchange="readURL(this)">
			<input type="submit" value="수정완료"> &nbsp;
		</form>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html> 