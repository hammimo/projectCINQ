<!-- form/artistForm.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form/artistForm.jsp</title>

<style type="text/css">
.artist_title {
	text-align: center;
}
.artist_img {
	right : 200px;
	position: fixed;
	
}
.artist { 
	width: 500px;
	margin: auto;
}
.artist_form {
	text-align: left;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<h1 class="artist_title">멤버모집</h1>
	<div class ="artist_img"><img src="#" id="preview" width="200px" height="200px"></div>
	<div class="artist" align="center">
		<form  class="artist_form" action="#" method="post">		
			<b>작성자</b>
			<input type="text" name="id" value="loginUser" readonly><br><br>
			<b>제 목</b>
			<input type="text" name="title" size="50"><br><br>
			<b>내 용</b>
			<textarea rows="10" cols="50" name="content"></textarea><br><br>
			<b>지 역</b>
			<input type="text" name="title" size="50" placeholder="지역API"><br>
			<p>현재 전시/공연 가능한 지역은 //// 입니다.</p><br><br>
		<!--  
			<b>성별 </b>
			<label><input type="checkbox" name="male" value="M"> 남자만 </label>
      		<label><input type="checkbox" name="female" value="F"> 여자만 </label>
      		<label><input type="checkbox" name="none" value="NN"> 상관없음 </label>
      		<br><br>
      		<b>모집하는 연령층</b>
			<select name="choice">
			  <option value="one">10 ~ 20</option>
			  <option value="two" selected>20 ~ 30</option>
			  <option value="tree">30 ~ 40</option>
			  <option value="four">40 ~ 50</option>
			  <option value="five">50 ~ 60</option>
			  <option value="six">60세 이상</option>
			  <option value="seven">상관없음</option>
			</select>
			<br><br>
		-->
			<b>현재인원</b>
			<input type="number" min="0" max="100" />		
			<b>모집인원</b>
			<input type="number" min="0" max="100" />		
			<br><br>	
			<b>프로필 올리기</b>
			<input type="button" value="팀장프로필" onclick="location.href='#'"><br><br>
			<input type="submit" value="완료"> 
			<input type="button" value="프로젝트 보기" onclick="location.href='#'"><br><br><br>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>

