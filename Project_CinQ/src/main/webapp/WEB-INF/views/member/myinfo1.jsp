<!-- member/info.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>


<link href="${contextPath}/resources/script/css/info.css" rel="stylesheet" type="text/css">

<meta charset="UTF-8">
<title>member/info.jsp</title>

</head>
<body>
   <c:import url="../default/header.jsp"/>
   <div id="wrapper">
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
        <br><br><br><br><br><br><br><br><br><br><br><br><br>
   </div>
   </div>
   <c:import url="../default/footer.jsp"/>

</body>
</html>