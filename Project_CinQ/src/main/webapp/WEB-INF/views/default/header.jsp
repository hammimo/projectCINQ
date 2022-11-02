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
	color: #646464;
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
    background-color: 	#bebebe;
}

nav {
	font-family: 'Hahmlet', serif;
	font-size:23px;
    margin: 0;
    width: 100%;
}
nav ul {
    list-style: none;
    display: flex;
    justify-content: first;
    font-size:23px;
}
nav ul li {
    padding: 10px;
    font-size:23px;
    
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
            	
                <ul>
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
            </nav>
        </div>
    <!-- // navdiv -->
</body>
</html>