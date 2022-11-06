<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationForm.jsp</title>
<script src='<c:url value="/resources/script/js/file.js"/>'></script>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<link href="${contextPath}/resources/script/css/reservationForm.css"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src='<c:url value="/resources/script/js/reservation.js"/>'></script>
<style type="text/css">
*{
	font-family: 'Hahmlet', serif;
}
#reservationForm {
	text-align: center;
	
}
.Box1{
	position: relative;
	width: 40%;
	height: 60%;
	display:inline-block;
	right: 0%;
}
.Box{
	display:inline-block;
	position: absolute;
	left: 30%;
	margin-left: 20%;
	width: 30%;
	height: 80%;
}
img {
		width: 100%;
		height: 100%
		object-fit: cover;
	}
.date {
	display: inline-block;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="wrapper">
	<div id="reservationForm">
		<br>
		<br>
		<!-- <button type="button" onclick="location.href='reservationForm'">취소</button><br><br>-->

		<form id="form" class="reservationForm"
			action="${contextPath }/reservation/reservation"
			enctype="multipart/form-data" method="post">
		<div class="Box1">
			<div class="textbox">
				<label>작성자</label> <input type="text" name="id" value="${loginUser}"
					readonly><br>
				<br>
			</div>
			<div class="textbox">
				<label>제목</label> <input type="text" name="title"><br>
				
			</div>
			<br>
			<div class="textbox">
				<label>관람인원</label> <input type="number" name="max_count"><br>
				<br>
			</div>
			<div class="textbox">
				<label>내용</label>
				<textarea  id="contentc" rows="8" cols="30" name="content"
					placeholder="필수 입력 사항 *관람연령 *공연시간"></textarea>
				<br>
				<br>
			</div>
			<div class="textbox">
				<label>연락처</label> 
				<input type="text" name="tel"  placeholder=" - 를 포함한 13자리 숫자를 입력해 주세요 "><br>
				<br>
			</div>
			<div class="textbox">
				<label>티켓가격</label> 
				<input type="text" name="price"><br>
			</div>
			<br> 
			<div class="textbox">
				<label>공연팀 인원</label> 
				<input type="number" min="0" max="100" name="team_count" /><br>
				<br>
			</div>
			<br>
			<div class="textbox">
				<label>공연 날짜</label>
			<div class="date">
				<input type="date" id="start_date" name="start_date">  
			</div>
			<div class="date">
				 <input type="date" id="end_date" name="end_date"><br>
			</div>
			</div>
			<br>
			<br> 
		</div>
		<div class="Box">
			
			
			<c:if test="${placeData != null}">
				<input type="hidden" id="location" name="location"
					value="${placeData.write_no}">
				<c:if test="${placeData.image == 'nan'}">
					<b>이미지가 없습니다</b>
					<br>
				</c:if>
				<c:if test="${placeData.image != 'nan'}">
					<img
						src="${contextPath}/place/download?imageFileName=${placeData.image}"
						width="200px" height="200px">
					<br>
				</c:if>
				
				<div class="textbox">
					<label>지역</label> <input type="text" name="title"
						value="${placeData.loc_sep_name}"><br>
					<br>
				</div>
				<b>장소명 : ${placeData.loc_name} </b>
				<br>
				<br>
			</c:if>
			<c:if test="${placeData == null}">
				<button type="button" onclick="rentOkView()">대관가능 장소보기</button>
				장소추천받을게요 <input type="checkbox" id="location" name="location"
					value="0" checked="checked">
				
			</c:if>
			<br> <img src="#" id="preview" width="350px" height="250px"><br> 
				<input type="file" name="image"
				value="팀원프로필" onchange="readURL(this)"><br>
				
		</div>
		<div class="button">
			<button type="submit" value="제출하기">제출하기</button>
			<button type="button" onclick="location.href='../member/myinfo2?id=${loginUser}'">돌아가기</button>
		</div>
	</form>
</div>

<br><br><br><br><br><br>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>