<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
*{
background-color: 	#bebebe
}
aside {
	float: right;
	width:11%;
	height:100%;
	text-align: center;
	line-height: 100px;
	background-color: 	#bebebe;
	top: 144px;
}
li {
	font-family: 'Hahmlet', serif;
	list-style: none;
	font-size: 26px;
}
#a1 {
	text-align: center;
	line-height: 100px;
	font-size: 26px;
}
</style>
</head>
<body>
	<aside>
  		<section>
    		<ul>
      			<li><a id="a1" href="/root/join/joinAllListNum">Project</a></li>
      			<li><a id="a1" href="/root/join/joinAllListNum">Join</a></li>
      			<li><a id="a1" href="/root/place/placeAllListNum">Place</a></li>
      			<c:if test="${loginUser == 'admin' }">
					<li><a href="/root/admin/memberAllList">회원관리</a></li>
					<li><a href="/root/admin/placeAllList">장소관리</a></li>
					<li><a href="/root/reservation/reservationAllListNum">예매관리</a></li>      			
      			</c:if>
    		</ul>
    		
	  </section>
	</aside>
</body>
</html>