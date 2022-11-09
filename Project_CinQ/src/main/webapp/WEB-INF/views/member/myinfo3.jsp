<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> <!-- myTicketList -->
<style type="text/css">
body {
	background-color: rgba(0, 13, 0, 0.04);
}
#infoSection{
   float: right;
   width: 150px;
   height: 1000px;
   line-height: 100px;
   font-family: 'Hahmlet', serif;
}
li {
   font-family: 'Hahmlet', serif;
   list-style: none;
   font-size: 18px;
   line-height: 50px;
   }
.ticket{
	width: 400px;
	height: 270px;
	display: inline-block;
	margin-left: 20px;
}
.img{

}
.info{

}
#wrap {
	height : 100%;
}
#div_hidden {
	height : 400px;
}
</style>
<title>History</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<hr>
	<section id="infoSection">
	<ul>
      <li><a href="/root/member/myinfo1?id=${loginUser}">MY INFO</a></li>
      <li><a href="/root/member/myinfo2?id=${loginUser}">PROJECT</a></li>
      <li><a href="/root/member/myinfo3?id=${loginUser}">HISTORY</a></li>
    </ul>
    </section>
    	<br>
    	<div id="wrap">
	    	<h2 align="center">MY TICKET</h2>
	    	<br><br>
	    	<c:if test="${myTicketList.size()==0 }">
	    		<p>결제하신 내역이 없습니다 !</p>
	    	</c:if>
	    	<c:if test="${myTicketList.size()!=0 }">
	    		<c:forEach var="data" items="${myTicketList}">
	    		<div class="ticket">
	    		<div class="img" align="center">
	    			<c:if test="${data.image == 'nan'}">
	               			<b>이미지가 없습니다</b>
	            	</c:if>
	            	<c:if test="${data.image != 'nan'}">
	               			<img id="img_ticket" src="${contextPath}/join/download?imageFileName=${data.image}" width="200px" height="200px">
	            	</c:if> 
	            </div>
	           	<div class="info">
	           	<p id="title" align="center">${data.title}</p>
	           	<p id="date" align="center">${data.show_date}</p>
	           	<p id="ticketCount" align="center">${data.ticket_count}인</p>
	           	</div>
	           	</div>
	    		</c:forEach>
	    	</c:if>
	    	<div id="div_hidden"></div>
	    	<div id="div_hidden"></div>
    	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>