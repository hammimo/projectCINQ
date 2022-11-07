
<!-- place/placeView -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<script src='<c:url value="/resources/script/js/file.js"/>'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src='<c:url value="/resources/script/js/ticketingRegister.js"/>'></script>
<style type="text/css">
#reservationForm
{
   text-align: center;
}
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <h1>예매창</h1>
     	<div id="reservationForm">
 			<b>공연장소</b>&nbsp;
 			<input type="hidden" id=register_no value="${data.write_no}">
 			<button type="button" onclick="registOkView()">대관가능 장소보기</button><br><br>
 			<button type="button" onclick="location.href='ticketingRegister?write_no=${data.write_no}&location=${data.location}'">취소</button><br><br>
 			<br><br>
			<form  id="form" class="ticketingRegisterForm"  action="${contextPath }/reservation/ticketingStart?write_no=${data.write_no}" enctype="multipart/form-data" method="post"> 
	        	<b>작성자</b>
	        		<input type="text" name="id" value= "${data.id}" readonly><br><br>
	        	<b>제 목</b>
	        		<input type="text" name="title" size="50" value="${data.title }"><br><br>
				<br><br>
				<c:if test="${data.location == 0}">
					<b>장소를 추천받고 싶어요</b><br><br>
				</c:if>
				<c:if test="${data.location != 0}">
				<input type="hidden" id="location" name="location" value="${placeData.write_no}">
				<b>장소</b><br>
				<c:if test="${placeData.image == 'nan'}">
		       		 <b>이미지가 없습니다</b><br>
		        </c:if>
		        <c:if test="${placeData.image != 'nan'}">
		        <img src="${contextPath}/place/download?imageFileName=${placeData.image}" width="200px" height="200px"><br>
		        </c:if>
		        <b>지역 : ${placeData.loc_sep_name}</b><br>
		        <b>장소명 : ${placeData.loc_name} </b><br><br>
				</c:if>
				<b>팀 프로필</b>
				<c:if test="${data.image == 'nan'}">
	        		<b>프로필이 없습니다.</b><br>
	        	</c:if>
	        	<c:if test="${data.image != 'nan'}">
	        		<img src="${contextPath}/place/download?imageFileName=${data.image}" width="200px" height="200px"><br><br>
	      	 	</c:if>
	        	<b>포스터</b><br>
	        		<img src="#" id="preview" width="350px" height="250px"><br>
	        		<input type="file" name="image" value="poster" onchange="readURL(this)"><br><br>
	        	<p>공연날짜</p>
	         		<input type="date" id="start_date" name="start_date" value="${data.start_date}"> ~ 
	         		<input type="date" id="start_date" name="end_date" value="${data.end_date}"> <br><br>
	         	<b>관람가능 인원</b>
	         		<input type="number" name="max_count" size="50" value="${data.max_count}"><br><br>
	         	<b>공연 상세 내용</b>
	         		<textarea rows="10" cols="50" name="content">${data.content}</textarea><br><br>
	         	<b>연락처</b>
	         		<input type="text" name="tel" value="${data.tel }"><br><br>
	         	<b>티켓가격</b>
	         		<input type="text" name="price" size="50" value="${data.price}">원<br><br>
			 	<b>공연팀인원</b>
	         		<input type="number" min="0" max="100" name="team_count" value="${data.team_count}"/>      
	         	<br><br>
         			<input type="submit" value="예매시작">
			 </form>
   		<button type="button" onclick="location.href='reservation/reservationAllListNum'">돌아가기</button>
   	</div>
   <c:import url="../default/footer.jsp"/>
</body>
</html> 