<!-- default/header.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<title>default/header.jsp</title>
<style type="text/css">
* { 
    margin: 0;
}
.header {
	padding: 10px;
}

a{
	text-decoration: none;
	color: black;
}
a:hover{
	color: black;
}

.wrap {
	width:100%;
    margin: auto;
    text-align: center;
}
.header {
    margin: 0;
    flex: 0 0 auto;
}
.title {
    font-size: 60px;
    text-align: center;
}
.loginUser li{
	list-style: none;
}
.loginUser li a {
	float: right;
	padding-right: 50px;
	font-size: 20px;
	font-weight: bold;
	color: green;
	list-style: none;
}


nav {
	font-size:18px;
    margin: 0;
    width: 100%;
    display: inline-block;
}
nav ul {
    list-style: none;
    font-size:23px;
    display: flex;
}
nav ul li {
    padding: 8px;
    font-size:14px;
    
}

.memberInfo{
	clear: both;
	float:left;
}
.menu{
	padding-right: 10px;
	float: right;
}
.joinList {
	
	text-align: left;
}
.logo {
	width: 250px;
	height: 110px;
}
.marker{
	width: 10px;
	height: 10px;
}
</style>
</head>
<body>
    <div class="wrap">
        <div class="header">
         	<a href="${contextPath}/index">
         		<img class="logo" src="${contextPath}/resources/script/image/projectCINQ_logo.png">
         	</a>
		</div>
    </div>
    <div class="wrap">
				<c:if test="${loginUser != null }">
	            	<ul class="loginUser">
		            	<li>
		            		<a href="/root/member/myinfo1?id=${loginUser}">
		            			<img class="marker" src="${contextPath}/resources/script/image/marker.gif">
         							${loginUser} 님
		            		</a>
		            	</li>
	            	</ul> 
            	</c:if>
    </div>
    <!-- // wrap -->
        <div class="wrap">
			<nav>
                <ul class="memberInfo">
                    <li><a href = "/root/index">HOME</a></li>
                    <li>
                        <c:if test="${loginUser == null}">
                            <a href = "/root/member/register_form">회원가입</a>&nbsp;
                            <a href="/root/member/login">로그인</a>
                        </c:if>
                        <c:if test="${loginUser != null}">
                            <a href="/root/member/myinfo1?id=${loginUser}">MY PAGE</a>&nbsp;
                            <a href="/root/member/logout">LOGOUT</a>
                        </c:if>
                    </li>
                </ul>
                <ul class="menu">
                	<c:if test="${loginUser == 'admin'}">
                    	<li><a href="/root/admin/memberAllList">관리자페이지</a></li>
                    </c:if>
            		<c:if test="${loginUser == 'admin'}">
                    	<li><a href="/root/reservation/reservationAllListNum">예매관리</a></li>
                    </c:if>
            		<c:if test="${loginUser != 'admin'}">
                    	<li><a href="/root/reservation/reservationForm">예매등록</a></li>
                    </c:if>        
      				<li><a href="/root/join/joinAllListNum">구인하기</a></li>
     				<li><a href="/root/place/placeAllListNum">장소등록</a></li>
            	</ul>
            </nav>
        </div>
    <!-- // navdiv -->
</body>
</html>