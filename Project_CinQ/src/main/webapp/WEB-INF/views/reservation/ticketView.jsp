<!-- reservation/ticketView -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet"><script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="${contextPath}/resources/script/css/datepicker.css" rel="stylesheet" type="text/css">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
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
body{
	background-color: rgba(0, 0, 0, 0.04);
}
.place_title {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 39px;
	font-weight: lighter;
}
.Sproject{
   align : center;
   border-collapse: collapse;
}
#content {
	padding-left: 5%;
}
span {
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
}
table {
	width: 800px;
	height: 400px;
}
label {
	font-family: 'IBM Plex Sans KR', sans-serif;
	font-weight: bold;
}
tr {border-top: 1px solid black;}
td {padding: 5px;}
button {
	margin: 0;
	padding: 0;
	position: relative;
    border: none;
    display: inline-block;
    padding: 6px 15px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 200;
    transition: 0.25s;
	box-sizing: border-box;
	margin: 20px;
	background-color: #323232;
    color: white;
    font-family: 'Hahmlet', serif;
	}
button:hover {
	letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
	background-color: #323232;
    color: white;
	}
#countList {
	list-style : none;
}
#ticket_date{
	font-weight : lighter;
}	
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
         			<img src="${contextPath}/place/download?imageFileName=${data.image}" width="400px" height="400px">
         		</td>
         		<td id="content">
         			<span>공연 : ${data.title}</span><br><br>
         			<span>장소 : ${placeData.loc_name}</span><br><br><br>
         			<span>공연기간 : ${data.start_date} ~ ${data.end_date}</span><br><br><br>
         			<span>가격 : ${data.price} 원</span><br><br><br>
         			<span>공연 세부 내용 : ${data.content }</span><br><br>
         			<span>총관람인원 : ${data.max_count}</span><br><br>
         			<c:if test="${tData.size() != 0 }">
         				<span>날짜별 표 매수</span><br>
	         			<c:forEach var="dto_t" items="${tData}">
	         				<ul id="countList">	
	         					<li><span id="ticket_date">${dto_t.show_date } &nbsp;&nbsp; ${dto_t.ticket_count } 매</span>
	         					</li>
	         				</ul>
	         			</c:forEach>
         			</c:if>
         		</td>
         	</tr>
         </table>
         <form id="ticket_form" class="ticketingRegisterForm"  action="${contextPath }/ticket/TicketingSave" enctype="multipart/form-data" method="post">
         	<input type="hidden" name="id" value="${loginUser }">
         	<input type="hidden" name="title" value="${data.title }">
         	<input type="hidden" name="location" value="${placeData.loc_name }">
         	<input type="hidden" name="image" value="${data.image }">
         	<input type="hidden" id="StartDate" value="${data.start_date }">
         	<input type="hidden" id="EndDate" value="${data.end_date }">
         	<label for="show_date"> 날짜선택</label>
         	<input id="show_date" class="datepicker" name="show_date" autocomplete="off"><br>
         	<input type="hidden" name="show_num" value="${data.show_num }">
         	<input type="hidden" name="price" value="${data.price }">
         	<label for="ticket_count"> 구매수량</label>
         	<input type="number" id="ticket_count" name="ticket_count" value="1" min="1" max="3"><br><br>
         	<button id="check_module" type="button">예매하기</button>&nbsp;
         	<script type="text/javascript">
				$("#check_module").click(function () {
					if(${loginUser == null}){
						alert('로그인이 필요합니다');
						location.href='${contextPath}/member/login';
					}
					var count = $("#ticket_count").val();
					var IMP = window.IMP; // 생략가능
					IMP.init('imp52681348'); 
					// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
					// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
					IMP.request_pay({
						pg: 'kakaopay.TC0ONETIME',
						pay_method: 'card',
						merchant_uid: 'merchant_' + new Date().getTime(),
						/* 
						 *  merchant_uid에 경우 
						 *  https://docs.iamport.kr/implementation/payment
						 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
						 */
						name: '주문명 : ${data.title}',
						// 결제창에서 보여질 이름
						// name: '주문명 : ${auction.a_title}',
						// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
						amount: ${data.price}*count,
						// amount: ${bid.b_bid},
						// 가격 
						buyer_name: '${loginUser}',
						// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
						// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
						}, function (rsp) {
							console.log(rsp);
						if (rsp.success) {
							var msg = '결제가 완료되었습니다.';
							msg += '결제 금액 : ' + rsp.paid_amount;
							$('#ticket_form').submit();
							// success.submit();
							// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
							// 자세한 설명은 구글링으로 보시는게 좋습니다.
						} else {
							var msg = '결제에 실패하였습니다.';
							msg += '에러내용 : ' + rsp.error_msg;
						}
						alert(msg);
					});
				});
			</script>
         </form>
      </div>
      <br><br><br>
   <c:import url="../default/footer.jsp"/>

</body>