<!-- reservation/reservationView -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationView</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<link href="${contextPath}/resources/script/css/reservationView.css" rel="stylesheet" type="text/css">
 
</head>
<body>
	<c:import url="../default/header.jsp"/>
    <div class="main">
    	<h1 align="center">예매신청 프로젝트</h1>
        <br><br>
      	<div class ="view" align="center">
        	<table class="Sproject" >
            	<tr>
                	<td colspan="2"><b>작성자</b>&emsp;:&emsp; ${data.id }</td>
            	</tr>
            	<tr>
                	<td colspan="2"><b>제목</b>&emsp;:&emsp; ${data.title }</td>
            	</tr>
            	<tr>
            		<c:if test="${data.location == 0}">
            			<td colspan="2"><b>대관 신청 장소</b>&emsp;:&emsp; 장소 추천 해주세요</td>
            		</c:if>
            		<c:if test="${data.location != 0}">
               			<td colspan="2">
               					<b>대관 신청 장소</b>&emsp;:&emsp; 
               					<button type="button" onclick="location.href='${contextPath}/place/placeView?write_no=${data.location}'">장소 보러 가기</button>
               				</td>
            		</c:if>
            	</tr>
            	<tr>
               		<td>
               			<b>신청팀 프로필</b>
               		</td>
               		<td>
                  		<c:if test="${data.image == 'nan'}">
                    		<b>이미지가 없습니다..</b>
                  		</c:if>
                  		<c:if test="${data.image != 'nan'}">
                 			<img src="${contextPath}/place/download?imageFileName=${data.image}" width="100%" height="470px">
                  		</c:if>
               		</td>
            	</tr>
            	<tr>
            		<td colspan="2"><b>내용</b>&emsp;:&emsp; ${data.content}</td>	
            	</tr>
            	<tr>
                	<td colspan="2"><b>팀 인원</b>&emsp;:&emsp; ${data.team_count} 명</td>
           		</tr>
           		<tr>
            		<td colspan="2"><b>예상 관객</b>&emsp;:&emsp; ${data.max_count} 명</td>
           		</tr>
           		<tr>
            		<td colspan="2"><b>공연 시작일</b>&emsp;:&emsp; ${data.start_date}</td>
           		</tr>
           		<tr>
            		<td colspan="2"><b>공연 마감일</b>&emsp;:&emsp; ${data.end_date}</td>
           		</tr>
           		<tr>
            		<td colspan="2"><b>연락처</b>&emsp;:&emsp; ${data.tel}</td>
           		</tr>
           
           		<tr>
               		<td colspan="2"><b>티켓 가격</b>&emsp;:&emsp; ${data.price} 원</td>
           		</tr>
           		<tr>
					<td colspan="4" align="center">
						<input id="i_button" type="button" value="등록하기" onclick="location.href='${contextPath}/reservation/ticketingRegister?write_no=${data.write_no}&location=${data.location}'">&nbsp;
						<input id="i_button" type="button" value="삭제하기" onclick="location.href='${contextPath}/reservation/reservationDelete?write_no=${data.write_no}&imageFileName=${data.image}'">
                  		<input id="i_button" type="button" value="전체목록" onclick="location.href='${contextPath}/reservation/reservationAllListNum'">
               		</td>
                </tr>
            </table>
        </div>
    </div>
    <c:import url="../default/footer.jsp"/>

</body>
</html>	