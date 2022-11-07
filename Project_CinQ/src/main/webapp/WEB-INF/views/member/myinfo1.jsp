<!-- member/info.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">

<title>member/info.jsp</title>
<style type="text/css">
label{
	font-family: 'Noto Sans KR', sans-serif;
}
b {
	font-family: 'Noto Sans KR', sans-serif;
}
#wrapper{
	height: auto;
 	 min-height: 100%;
 	 padding-bottom: 10px;
 	 background-color :rgba(0, 13, 0, 0.04);
}

#infoSection{
	float: right;
	width: 150px;
	height: 700px;
	line-height: 100px;
	font-family: 'Hahmlet', serif;
}
#infoSection li {
	font-family: 'Hahmlet', serif;
	list-style: none;
	font-size: 18px;
	line-height: 50px;
	}


button {
	margin: 0;
	padding: 0;
	position: relative;
    border: none;
    display: inline-block;
    padding: 8px 18px;
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

</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <hr>
   <div id="wrapper">
   <section id ="infoSection">
   <ul>
      <li><a href="/root/member/myinfo1?id=${loginUser}">MY INFO</a></li>
      <li><a href="/root/member/myinfo2?id=${loginUser}">PROJECT</a></li>
      <li>HISTORY</li>
   </ul>
   </section>
   <br>
   <br>
   <div class="member_info" align="center">
      
      <h1>MY INFO</h1>
      <br><br>
      <form id="memberInfo">
      <label>NAME : </label>
      <b>${info.name}</b>
      <br><br>
      <label>ID : </label>
      <b>${info.id }</b>
      <br><br>
       <c:choose>
         <c:when test="${info.tel eq '' }">
            <label>TEL : </label>
         </c:when>
         <c:when test="${info.tel ne '' }">
         	<label>TEL : </label>
            <b>${info.tel } </b>
         </c:when>
         <c:otherwise>
         	<label>TEL : </label>
            <b>오류 발생</b>
         </c:otherwise>
       </c:choose>
       <br><br>
       <c:choose>
         <c:when test="${info.gender eq 'm' }">
         	<label>GENDER : </label>
            <b>MAN</b>
         </c:when>
         <c:when test="${info.gender eq 'f' }">
         	<label>GENDER : </label>
            <b>WOMAN </b>
         </c:when>
         <c:otherwise>
         	<label>GENDER : </label>
            <b>오류 발생</b>
         </c:otherwise>
      </c:choose>
      <br><br>
      <label>E-mail : </label>
      <b>${info.email }</b>
      <br><br>
      <label>BirthDay : </label>
      <b>${info.birthday }</b>
      <br><br><br>
      <div class="member_info_btn">
      <button type="button" onclick="location.href='/root/member/modify_form?id=${loginUser}'">회원정보 수정</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button type="button" onclick="location.href='/root/member/delete?id=${loginUser}'">회원탈퇴</button>
      <!-- <a href="/root/member/modify_form?id=${loginUser}"><input type="button" value="회원정보 수정"></a>&nbsp;-->
      <!--<a href="/root/member/delete?id=${loginUser}"><input type="button" value="회원탈퇴"></a>-->
   </div>
      </form>
   </div>
   <br>
   
   <br>
   <!--  
   <div class="Ticketing"> 
        <h2>Ticketing</h2>
        <br>
        <div class="img">
            데이터가 들어오면 이미지
        </div>
        <div class="info">
            데이터가 들어오면 설명
        </div>-->
        <br><br><br><br><br><br><br><br><br><br><br><br><br>
   </div>
   </div>
   <c:import url="../default/footer.jsp"/>

</body>
</html>