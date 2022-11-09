<!-- place/placeAllListNum.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>placeAllListNum</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<link href="${contextPath}/resources/script/css/listNum.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/script/css/search.css" rel="stylesheet" type="text/css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

<script type="text/javascript">

</script>
<style type="text/css">
.main {
	width: 100%;
	height: 100vh;
	
}
.ticket_list {
	clear: both;
	display: inline-block;
	padding-left: 20px;
	width: 350px;
	height: 350px;
}
.ticket_num {
	padding-top: 50px;
	text-align: center;
}
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <!-- <div align="center"> -->
   <div class="main">
   <br>
   <div class="subject" >
		 <b>진행중인 티켓 목록</b>
   </div>
       <form action="ticketSearchList" method="post" enctype='multipart/form-data'>
		    <div class="search-box">
			    <input type="text" class="search-txt" name="loc_sep_name" placeholder="티켓제목 검색 "> 
				    <a class="search-btn" href="#"> <i class="fas fa-search"></i></a>
			</div>
		</form>
    <br><br>
    <div class="list">
	
		<c:if test="${ticketingList.size() == 0}">
		<div>
			<b>진행중인 티켓이 없습니다.</b>
		</div>
		</c:if>
		<c:forEach var="dto" items="${ticketingList}">
  			<div class="ticket_list">
 				<a href="${contextPath}/reservation/ticketView?write_no=${dto.write_no}&location=${dto.location}&show_num=${dto.show_num}">
 					<img src="${contextPath}/reservation/download?imageFileName=${dto.image}" width="250px" height="250px">
 				</a><br>
  				<label>제목 : ${dto.title}</label><br>
  				<label>날짜 : ${dto.start_date} ~ ${dto.end_date}</label>
  			</div>
		</c:forEach>
		<c:forEach var="num" begin="1" end="${repeat}">
			<div class="ticket_num">
				<a href="ticketingAllListNum?num=${num}">[${num}]</a>
			</div>
		</c:forEach>
     </div>
     </div>
   <c:import url="../default/footer.jsp"/>
</body>
</html> 