
<!-- board/modify_form.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<link href="${contextPath}/resources/script/css/form.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src='<c:url value="/resources/script/js/checkRegister.js"/>'></script>
<style type="text/css">
*{
font-family: 'Hahmlet', serif;
}
.div_1{
	width: 40%
}
.textbox label {
  position: absolute;
  top: 1px;  
  left: 1px;  
  padding: .8em .5em; 
  color: 	#464646;
  cursor: text;
  font-size: 17px;
  font-weight: bold;
  
}
.textbox input[type="text"] {
  width: 80%;  
  height: auto; 
  line-height : normal;  
  padding: .8em .5em; 
  font-family: inherit; 
  border: 1.3px solid 	#464646;
  border-radius: 0em;  
  outline-style: none;  
  -webkit-appearance: none; 
  -moz-appearance: none;
  appearance: none;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<hr>
	<div id="wrapper">
	<br><br>
   	<div class="div_1" align="center">
	<h1 class="modify_title">${info.name } 님의 회원정보 수정</h1>
	<br><br>
		<div class="modify_form">
		<form name="modifyForm" action="${contextPath }/member/modify" enctype="multipart/form-data" method="post">
			<input type="hidden" name="id" value="${info.id}">
			<div class="textbox1">
		  		<label>이   름</label>
 		  		<input type="text" name="name" value="${info.name}" readonly><br><br>
		 	</div> 
		 	<div class="textbox1">
		  		<label>생일</label>
 		  		<input type="text" name="birthday" value="${info.birthday}" readonly><br><br>
		 	</div>
		 	<div class="textbox1">
		  		<label>이메일</label>
 		  		<input type="text" name="email" value="${info.email}" ><br><br>
		 	</div>
		 	<div class="textbox1">
		  		<label>비밀번호</label>
 		  		<input type="text" name="pw" value="${info.pw}" ><br><br>
		 	</div>
		 	<div class="textbox1">
		  		<label>전화번호</label>
 		  		<input type="text" name="tel" value="${info.tel}" ><br><br>
		 	</div>
			
			<b>성 별</b>
			
			<c:if test="${info.gender == 'm'}">
			<input type="radio" name="gender" value="m" checked="checked"> 남성
			<input type="radio" name="gender" value="f"> 여성
			</c:if>
			<c:if test="${info.gender == 'f'}">
			<input type="radio" name="gender" value="m"> 남성
			<input type="radio" name="gender" value="f" checked="checked"> 여성
			</c:if>
			<br><br>
			
			<button type="submit" value="수정완료">작성완료</button> &nbsp;
         	<button type="button" onclick="location.href='${contextPath}/member/myinfo1?id=${loginUser}'" value="돌아가기">돌아가기</button>

		</form>
		</div>
	</div>
	<br><br><br><br>
	<br><br><br><br><br>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>





















