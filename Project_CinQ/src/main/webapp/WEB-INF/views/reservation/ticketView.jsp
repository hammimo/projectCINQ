<!-- place/placeView -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationView</title>
<style type="text/css">
.Sproject{
   align : center;
   border-collapse: collapse;
}
table {
	width: 800px;
	height: 400px;
}
tr {border-top: 1px solid black;}
td {padding: 5px;}
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
      <br><br>
      <h1 class="place_title" align="center">${data.title} 예매</h1>
      <br><br>
      <div class ="place_view" align="center">
         <table class="Ticketing" >
         <tr>
         <td>
         	<img src="${contextPath}/place/download?imageFileName=${data.image}" width="300px" height="400px">
         </td>
         <td>
         <h3>공연 : ${data.title}</h3><br><br>
         <b>장소 : ${placeData.loc_name}</b><br><br><br>
         <b>공연기간 : ${data.start_date} ~ ${data.end_date}</b><br><br><br>
         <b>가격 : ${data.price} 원</b><br><br><br>
         <b>공연 세부 내용 : ${data.content }</b><br><br>
         </td>
         </tr>
         </table>
      </div>
      <br><br><br>
   <c:import url="../default/footer.jsp"/>

</body>