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
	@import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");
    *{
        margin: 0;
        background-color: 	#bebebe
        
    }
    section {
	float: right;
	width: 200px;
	background: 	#bebebe;
	height: 700px;
	line-height: 100px;
	font-family: 'Hahmlet', serif;
	}
	li {
	list-style: none;
	font-size: 24px;
	font-family: 'Hahmlet', serif;
	}
	button {
	margin: 0;
	padding: 0;
	position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
	box-sizing: border-box;
	margin: 20px;
	background-color: #323232;
    color: white;
    font-family: 'Hahmlet', serif;
	}
	button:hover {
	letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
	background-color: #323232;
    color: white;
	}
.member_info {
	margin: auto;
	text-align: center;
	font-family: 'Hahmlet', serif;
}
.member_info_btn {
	margin: auto;
	text-align: center;
	font-family: 'Hahmlet', serif;
}
.Ticketing {
	text-align: center;
	border: 1px solid black;
	font-family: 'Hahmlet', serif;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<section>
	<ul>
		<li><a href="/root/member/myinfo1?id=${loginUser}">MY INFO</a></li>
		<li><a href="/root/member/myinfo2?id=${loginUser}">PROJECT</a></li>
	</ul>
	</section>
	<br>
	<br>
	<div class="member_info">
		<h1 align="center">MY INFO</h1>
		<br>
		<p>NAME : ${info.name } </p>
		<br>
		<p>ID : ${info.id } </p>
		<br>
		<c:choose>
			<c:when test="${info.tel eq '' }">
				<p>TEL :  </p>
			</c:when>
			<c:when test="${info.tel ne '' }">
				<p>TEL : ${info.tel } </p>
			</c:when>
			<c:otherwise>
				<p> TEL : 오류 발생
			</c:otherwise>
		</c:choose>
		<br>
		<c:choose>
			<c:when test="${info.gender eq 'm' }">
				<p>GENDER : MAN </p>
			</c:when>
			<c:when test="${info.gender eq 'f' }">
				<p>GENDER : WOMAN </p>
			</c:when>
			<c:otherwise>
				<p> GENDER : 오류 발생
			</c:otherwise>
		</c:choose>
		<br>
		<p>E-mail : ${info.email } </p>
		<br>
		<p>Birthday : ${info.birthday } </p>
		
	</div>
	<br>
	<div class="member_info_btn">
		<button type="button" onclick="location.href='/root/member/modify_form?id=${loginUser}'">회원정보 수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" onclick="location.href='/root/member/delete?id=${loginUser}'">회원탈퇴</button>
		<!-- <a href="/root/member/modify_form?id=${loginUser}"><input type="button" value="회원정보 수정"></a>&nbsp;-->
		<!--<a href="/root/member/delete?id=${loginUser}"><input type="button" value="회원탈퇴"></a>-->
	</div>
	<br>
	<div class="Ticketing"> 
        <h2>Ticketing</h2>
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