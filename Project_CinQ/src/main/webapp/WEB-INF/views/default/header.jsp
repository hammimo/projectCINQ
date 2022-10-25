<!-- default/header.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>default/header.jsp</title>
<style type="text/css">
* { 
    margin: 0;
}
.wrap {
    width: auto;
    margin: auto;
    text-align: center;
    background-color: gray;
}
.header {
    margin: 0;
}
.title {
    font-size: 50px;
    text-align: center;
    background-color: orange;
}

nav {
    margin: 0;
    width: 100%;
    background-color: olive;
}
nav ul {
    list-style: none;
    display: flex;
    justify-content: end;
}
nav ul li {
    padding: 10px;
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
                            <a href="/root/member/myinfo1?id=${loginUser}">마이페이지</a>&nbsp;
                            <a href="/root/member/logout">로그아웃</a>
                        </c:if>
                    </li>
                    


                </ul>
            </nav>
        </div>
    <!-- // navdiv -->
</body>
</html>