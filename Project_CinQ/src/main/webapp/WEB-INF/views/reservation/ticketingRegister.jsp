<!-- reservation/ticketingRegister -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ticketingRegister</title>
<script src='<c:url value="/resources/script/js/file.js"/>'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src='<c:url value="/resources/script/js/ticketingRegister.js"/>'></script>
<style type="text/css">
body {
	background-color: rgba(0, 0, 0, 0.04);
}

#wrap {
	font-family: 'Hahmlet', serif;
}

#title {
	position : relative;
	display:inline-block;
	margin : 50px;
	left : 50px;
	text-align : left;
}

#ticketingStartForm {
   position : relative;
   width : 100%;
   height: 100%;
   text-align: center;
}

.ticket_title {
   position : absolute;
   display: block;
   top : 50px;
   left : 255px;
   font-size: 20px;
   height : 50px;
   width : 800px;
   
}
.ticket_title input {
	height : 30px;
	width : 400px;
	font-size : 24px;
}


.location {
   position : absolute;
   display: block;
   top : 100px;
   right : 600px;
   align: center;
   width: 300px;
   height: 300px;
}

.locationButton {
	position : absolute;
	display: block;
	top : 300px;
	right : 600px;
	height : 50px;
	width : 300px;
	margin-top :100px;
}
.location_name {
   clear: both;
   display: inline-block;
}
.team_profile {
   position : absolute;
   display: block;
   top : 100px;
   left : 400px;
   height : 300px;
   width : 600px;
   text-align: left;
   padding-left: 10px;
}
.team_info input[type="number"] {
	width: 30px;
}
.poster {
   position:absolute;
   display: block;
   top : 400px;
   left : 375px;
   height :400px;
   width : 500px;
}
.ticket{
	position:absolute;
	display: block;
	top : 500px;
    right : 400px;
    height :300px;
    width : 500px;
    align : left;
}
.ticket #ticket_tot{
	position:relative;
	align : left;
	left: -175px;
}
.ticket #ticket_tot input{
	position:relative;
	left: 10px;
	width: 30px;
}
.ticket_content {
	position: relative;
}

.ticket_content b{
	position: relative;
	top : -140px;
}
.ticket_content  textarea{
	position: relative;
	top : 25px;
	left : -115px;
	resize : none;
}


.ticket_price {
	position : relative;
	align : left;
	left : -170px;
	top : 20px;
}
.ticket_price input {
	postion: relative;
	width: 70px;
}


.show_date {
	position:absolute;
   	display: block;
   	top : 800px;
   	left : 750px;
   	height :50px;
   	width : 350px;
   	text-align: left;
}

.tel {
   position : absolute;
   display: block;
   top : 830px;
   left : 750px;
}

#button_div{
	position:absolute;
   	display: block;
	top: 880px;
	left : 780px;
}

#i_button {
   position: relative;
    border: none;
    display: inline-block;
    padding: 8px 18px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
   box-sizing: border-box;
   margin: 20px;
   background-color: #323232;
    color: white;
    font-family: 'Hahmlet', serif;
}   
   
#i_button:hover {
   letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
   background-color: #323232;
   color: white;
}


#hidden_div {
	width : 100%;
	height : 500px;
}

</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <div id="wrap">
   <h1 id="title">예매 시작</h1>
        <div id="ticketingStartForm">
          <input type="hidden" id=register_no value="${data.write_no}">
          <div class="locationButton">
             <button type="button" onclick="registOkView()">대관가능 장소보기</button>&nbsp;
             <button type="button" onclick="location.href='ticketingRegister?write_no=${data.write_no}&location=${data.location}'">취소</button><br><br>
         </div>
         <form  id="form" class="ticketingRegisterForm"  action="${contextPath }/reservation/ticketingStart?write_no=${data.write_no}" enctype="multipart/form-data" method="post"> 
              <div>
                 <div class="ticket_title">
                    <b>공연 제목</b>
                       <input type="text" name="title" value="${data.title }">
               	 </div>
                 <div class="location">
                 <b>공연장소</b><br>
                    <c:if test="${data.location == 0}">
                     <input type="hidden" id="location" name="location" value="${placeData.write_no}"><br>
                    	<c:if test="${placeData.image == 'nan'}">
                     		<img src="https://via.placeholder.com/200" width="200px" height="200px"><br>
                     		<b>장소를 추천받고 싶어요</b><br><br>
                  		</c:if>
                  		<c:if test="${placeData.image != 'nan'}">
                          <img src="${contextPath}/place/download?imageFileName=${placeData.image}" width="200px" height="200px">
                           <div class="location_name">
                          	지역 : ${placeData.loc_sep_name}<br>
                          	장소명 : ${placeData.loc_name} <br>
                     		</div>
                       	</c:if>
                  	</c:if>
                  <c:if test="${data.location != 0}">
                     <input type="hidden" id="location" name="location" value="${placeData.write_no}">
                     	<c:if test="${placeData.image == 'nan'}">
                             <img src="https://via.placeholder.com/200" width="200px" height="200px">
                             <p>이미지가 없습니다</p><br>
                       </c:if>
                       <c:if test="${placeData.image != 'nan'}">
                          <img src="${contextPath}/place/download?imageFileName=${placeData.image}" width="200px" height="200px">
                       </c:if>
                       <div class="location_name">
                          지역 : ${placeData.loc_sep_name}<br>
                          장소명 : ${placeData.loc_name} <br>
                     </div>
                  </c:if>
                 </div>
               <div class="team_profile">
                  <b>팀 프로필</b><br>
                     <c:if test="${data.image == 'nan'}">
                          <b>프로필이 없습니다.</b><br>
                       </c:if>
                       <c:if test="${data.image != 'nan'}">
                         <div class="team_info">
                          <img src="${contextPath}/place/download?imageFileName=${data.image}" width="200px" height="200px"><br>                        
                             <b>주최자</b>
                                <input type="text" name="id" size="8" value= "${data.id}" readonly><br>
                             <b>공연팀인원</b>
                             <input type="number" min="0" max="100" name="team_count" value="${data.team_count}"/>      
                         </div>
                      </c:if>
                         <br><br>
                 </div>
                 <div class="poster">
                 	<b>포스터</b><br>
                    <img src="#" id="preview" width="450px" height="350px"><br>
                    <input type="file" name="image" value="poster" onchange="readURL(this)">
                 </div>
                 <div class="show_date">
                 	공연날짜 : 
                     <input type="date" id="start_date" name="start_date" value="${data.start_date}"> ~ 
                     <input type="date" id="start_date" name="end_date" value="${data.end_date}"> <br>
                  </div>
                  <div class="ticket">
	                  <div class="ticket_count">
	                  	<div id="ticket_tot">
	                  		<b>총 티켓매수</b>
	                  	  <input type="number" name="max_count" size="50" value="${data.max_count}"><br><br>
	                    </div>
	                  </div>
	                  <div class="ticket_content">
	                  	<b>공연 상세 내용</b>
	                    <textarea rows="10" cols="50" name="content">${data.content}</textarea><br><br>
	                  </div>
	                  <div class="ticket_price">
	                  	<b>티켓가격</b>
	                    <input type="text" name="price" size="50" value="${data.price}"><br><br>
	                  </div>
                  </div>
                  <div class="tel">
                  <b>관리자 연락처</b>
                     <input type="text" name="tel" value="${data.tel }"><br><br>
                  </div>
                  <br><br>
                  <div id="button_div">
                     <input id="i_button" type="submit" value="예매시작">
                     <button id="i_button" type="button" onclick="location.href='reservation/reservationAllListNum'">돌아가기</button>
             	</div>
             </div>
          </form>
      </div>
      <div id="hidden_div"></div>
      <div id="hidden_div"></div>
    </div>
   <c:import url="../default/footer.jsp"/>
</body>
</html> 