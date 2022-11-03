
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
tr {border-top: 1px solid black;}
td {padding: 5px;}
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
      <br><br>
      <h1 class="place_title" align="center">예매신청 프로젝트</h1>
      <br><br>
      <div class ="place_view" align="center">
         <table class="Sproject" >
            <tr>
               <th width="150px">작성자</th><td colspan="2">${data.id }</td>
            </tr>
            <tr>
               <th>제 목</th><td colspan="2">${data.title}</td>
            </tr>
            <tr>
            	<c:if test="${data.location == 0}">
            	<th>대관 신청 장소</th> <td colspan="2">장소 추천 해주세요</td>
            	</c:if>
               <th>대관 신청 장소</th> <td colspan="2"><button type="button" onclick="location.href='${contextPath}/place/placeView?write_no=${data.location}'">${data.location}</button></td>
            </tr>
            <tr>
               <th>신청팀 프로필</th>
               <td colspan="2">
                  <c:if test="${data.image == 'nan'}">
                     <b>이미지가 없습니다..</b>
                  </c:if>
                  <c:if test="${data.image != 'nan'}">
                 	<img src="${contextPath}/place/download?imageFileName=${data.image}" width="200px" height="200px">
                  </c:if>
               </td>
               <td>${data.content}</td>
            </tr>
            <tr>
            	<th>팀 인원</th><td colspan="2">${data.team_count} 명</td>
           </tr>
            	<th>예상 관객</th><td colspan="2">${data.max_count} 명</td>
           <tr>
            	<th>공연 시작일</th><td colspan="2">${data.start_date}</td>
           </tr>
            	<th>공연 마감일</th><td colspan="2">${data.end_date}</td>
           <tr>
            	<th>연 락 처</th><td colspan="2">${data.tel}</td>
           </tr>
           
           <tr>
            	<th>티켓 가격</th><td colspan="2">${data.price} 원</td>
           </tr>
           <tr>
				<td colspan="4" align="center">
					<input type="button" value="등록하기" onclick="location.href='${contextPath}/reservation/ticketingRegister?write_no=${data.write_no}&location=${data.location}'">&nbsp;
					<input type="button" value="삭제하기" onclick="location.href='${contextPath}/reservation/reservationDelete?write_no=${data.write_no}&imageFileName=${data.image}'">
                  <input type="button" value="전체목록" onclick="location.href='${contextPath}/reservation/reservationAllListNum'">
               </td>
            </tr>
         </table>
      </div>
      <br><br><br>
   <c:import url="../default/footer.jsp"/>

</body>
