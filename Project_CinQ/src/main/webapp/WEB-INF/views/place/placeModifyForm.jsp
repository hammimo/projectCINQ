
<!-- place/placeModifyForm.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/modify_form.jsp</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	<h1 class="modify_title">글쓰기</h1>
	<div class="modify" align="center">
		<div class="modify_save">
		<form action="${contextPath }/place/modify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="id" value="${data.id}">
			<input type="hidden" name="originFileName" value="${data.image}">
			<input type="hidden" name="write_no" value="${data.write_no}">
			<!-- 이미지 변경 시 삭제에 사용  -->
			<b>제 목</b><br>
			<input type="text" name="title" value="${data.title}" size="50"><br>
			<b>내 용</b><br>
			<textarea rows="10" cols="50" name="content">${data.content }</textarea><br>
			<b>파일 첨부</b>
			<img src="${contextPath }/place/download?imageFileName=${data.image}" id="preview" width="100px" height="100px"><br><br>
			<input type="file" name="image_file_name" onchange="readURL(this)">
			<input type="submit" value="수정완료"> &nbsp;
		</form>
		</div>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html> 