<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationForm.jsp</title>
<script src='<c:url value="/resources/script/js/file.js"/>'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src='<c:url value="/resources/script/js/reservation.js"/>'></script>
<style type="text/css">
#reservationForm {
	text-align: center;
}
</style>
</head>
<body>
 <c:import url="../default/header.jsp"/>
 	
 	<div id="reservationForm">
 		<b>공연장소</b>&nbsp;
		<button type="button" onclick="rentOkView()">대관가능 장소보기</button><br><br>
 		<button type="button" onclick="location.href='reservationForm'">취소</button><br><br>
 		<br><br>
		<form  id="form" class="reservationForm"  action="${contextPath }/reservation/reservation" enctype="multipart/form-data" method="post"> 
	        <b>작성자</b>
	        <input type="text" name="id" value= "${loginUser}" readonly><br><br>
	        <b>제 목</b>
	        <input type="text" name="title" size="50"><br><br>
			<br><br>
			<c:if test="${placeData != null}">
				<input type="hidden" id="location" name="location" value="${placeData.write_no}">
				<b>장소</b><br>
				<c:if test="${placeData.image == 'nan'}">
		       		 <b>이미지가 없습니다..</b><br>
		        </c:if>
		        <c:if test="${placeData.image != 'nan'}">
		        <img src="${contextPath}/place/download?imageFileName=${placeData.image}" width="200px" height="200px"><br>
		        </c:if>
		        <b>지역 : ${placeData.loc_sep_name}</b><br>
		        <b>장소명 : ${placeData.loc_name} </b><br><br>
			</c:if>
			<c:if test="${placeData == null}">
				<b>장소</b>
				장소추천받을게요 <input type="checkbox" id="location" name="location" value="0" checked="checked"><br><br>
			</c:if>
	        <b>팀 프로필 올리기</b><br>
	        <img src="#" id="preview" width="350px" height="250px"><br>
	        <input type="file" name="image" value="팀원프로필" onchange="readURL(this)"><br><br>
	        <b>공연날짜</b>
	        <p>생각하시는 공연날짜를 입력해 주세요 </p>
	        <input type="date" id="start_date" name="start_date"> ~ 
	        <input type="date" id="end_date" name="end_date"><br><br>
	        <b>관람가능 인원</b>
	        <input type="number" name="max_count" size="50"><br><br>
	        <b>내 용</b>
	        <p>필수 입력 사항 *관람연령 *공연시간 </p>
	        <textarea rows="10" cols="50" name="content"></textarea><br><br>
	        <b>연락처</b>
	        <p> - 를 포함한 13자리 숫자를 입력해 주세요</p>
	        <input type="text" name="tel" placeholder="ex) 010-0000-0000"><br><br>
	        <b>생각하는 티켓가격</b>
	        <input type="text" name="price" size="50">원<br><br>
			<b>공연팀인원</b>
	        <input type="number" min="0" max="100" name="team_count"/>      
	        <br><br>
	        <input type="submit" value="제출하기">   
		 </form>
		 <button type="button" onclick="location.href='../member/myinfo2?id=${loginUser}'">돌아가기</button>
   </div>
 <c:import url="../default/footer.jsp"/>
</body>
</html>