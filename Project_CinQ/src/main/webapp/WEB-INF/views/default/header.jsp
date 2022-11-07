<!-- default/header.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
a{
	text-decoration: none;
	color: black;
}
a:hover{
	color: black;
}

.wrap {
	background-color: rgba(0, 0, 0, 0.04);
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
	float:left;
}
.menu{
	float: right;
}
.joinList {
	
	text-align: left;
}
</style>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <h1 class="title">CINQ</h1>	
		</div>
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
                      <li><a id="a1" href="/root/reservation/reservationAllListNum">Project</a></li>
                   </c:if>
                  <c:if test="${loginUser != 'admin'}">
                      <li><a id="a1" href="/root/reservation/reservationForm">Project</a></li>
                   </c:if>
                  <li><a id="a1" href="/root/join/joinAllListNum">Join</a></li>
                 <li><a id="a1" href="/root/place/placeAllListNum">Place</a></li>
               </ul>
            </nav>
        </div>
    <!-- // navdiv -->
</body>
</html>