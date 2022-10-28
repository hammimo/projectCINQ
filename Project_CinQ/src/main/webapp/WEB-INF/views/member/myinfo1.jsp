<!-- member/info.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/info.jsp</title>
<style type="text/css">
    *{
        margin: 0;
    }
    section {
	float: left;
	width: 250px;
	background: gray;
	height: 700px;
	
	}
.member_info {
	border: 1px solid black;
	margin: auto;
	text-align: center;
}
.member_info_btn {
	border: 1px solid black;
	margin: auto;
	text-align: center;
}
.Ticketing {
	border: 1px solid black;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<section>
		<p><a href="/root/member/myinfo1?id=${loginUser}">내 정보</a></p>
		<p><a href="/root/member/myinfo2?id=${loginUser}">진행중인 프로젝트</a></p>
	</section>
	
	<h1 align="center">회원정보</h1>
	<div class="member_info">
		<br>
		<p>이름 : ${info.name } </p>
		<br>
		<p>아이디 : ${info.id } </p>
		<br>
		<c:choose>
			<c:when test="${info.tel eq '' }">
				<p>전화번호 :  </p>
			</c:when>
			<c:when test="${info.tel ne '' }">
				<p>전화번호 : ${info.tel } </p>
			</c:when>
			<c:otherwise>
				<p> 전화번호 : 오류 발생
			</c:otherwise>
		</c:choose>
		<br>
		<c:choose>
			<c:when test="${info.gender eq 'm' }">
				<p>성별 : 남자 </p>
			</c:when>
			<c:when test="${info.gender eq 'f' }">
				<p>성별 : 여자 </p>
			</c:when>
			<c:otherwise>
				<p> 성별 : 오류 발생
			</c:otherwise>
		</c:choose>
		<br>
		<p>이메일 : ${info.email } </p>
		<br>
		<p>생일 : ${info.birthday } </p>
		
	</div>
	<div class="member_info_btn">
		<a href="/root/member/modify_form?id=${loginUser}"><input type="button" value="회원정보 수정"></a>
		<a href="/root/member/delete?id=${loginUser}"><input type="button" value="회원탈퇴"></a>
	</div>
	<div class="Ticketing"> 
        <h2>예매내역</h2>
        <br>
        <div class="img">
            데이터가 들어오면 이미지
        </div>
        <div class="info">
            데이터가 들어오면 설명
        </div>
	</div>
	<c:import url="../default/footer.jsp"/>

</body>
</html>