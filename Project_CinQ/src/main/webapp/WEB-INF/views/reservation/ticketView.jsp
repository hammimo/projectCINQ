<!-- reservation/ticketView -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationView</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="${contextPath}/resources/script/css/datepicker.css" rel="stylesheet" type="text/css">
<script>
	$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});

	$(function () {
	  	var start = $("#StartDate").val()
	  	var end = $("#EndDate").val()
		$('.datepicker').datepicker({
		 minDate : new Date(start),
		 maxDate : new Date(end)
	  });
	});
</script>

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
         <form id="ticket_form" class="ticketingRegisterForm"  action="${contextPath }/" enctype="multipart/form-data" method="post">
         	<input type="hidden" name="id" value="${loginUser }">
         	<input type="hidden" name="title" value="${data.title }">
         	<input type="hidden" name="location" value="${placeData.loc_name }">
         	<input type="hidden" name="image" value="${data.image }">
         	<input type="hidden" id="StartDate" value="${data.start_date }">
         	<input type="hidden" id="EndDate" value="${data.end_date }">
         	<label for="show_date"> 날짜선택</label>
         	<input id="show_date" class="datepicker" name="show_date"><br>
         	<input type="hidden" name="show_num" value="${data.show_num }">
         	<input type="hidden" name="price" value="${data.price }">
         	<label for="ticket_count"> 구매수량</label>
         	<input type="number" id="ticket_count" name="ticket_count" value="1" min="1" max="3"><br>
         	<input type="button" value="예매하기" onclick="">
         </form>
      </div>
      <br><br><br>
   <c:import url="../default/footer.jsp"/>

</body>