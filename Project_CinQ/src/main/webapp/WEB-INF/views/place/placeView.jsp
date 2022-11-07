<!-- place/placeView -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlaceView</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<link href="${contextPath}/resources/script/css/placeView.css" rel="stylesheet" type="text/css">
 
</head>
<body>
	<c:import url="../default/header.jsp"/>
    <div class="main">
    	<h1 align="center"><b>등록된 장소</b></h1>
	  	<br><br>
      	<div class ="view" align="center">
        	<table class="Sproject" >
            	<tr>
               		<td colspan="2"><b>작성자</b>&emsp;:&emsp; ${placeData.id }</td>
            	</tr>
            	<tr>
               		<td colspan="2"><b>제 목</b>&emsp;:&emsp;${placeData.title }</td>
            	</tr>
            	<tr>
               		<td colspan="2"><b>위 치</b>&emsp;:&emsp;${placeData.loc_name}</td>
            	</tr>
            	<tr>
               		<td>
               			<b>사 진</b>
               		</td>
               		<td>
                  		<c:if test="${placeData.image == 'nan'}">
                     		<b>이미지가 없습니다..</b>
                  		</c:if>
                  		<c:if test="${placeData.image != 'nan'}">
                 			<img src="${contextPath}/place/download?imageFileName=${placeData.image}" width="100%" height="60%">
                  		</c:if>
               		</td>
            	</tr>
            	<tr>
            		<td colspan="2"><b>내용</b>&emsp;:&emsp; ${placeData.content}</td>
            		
            	</tr>
            	<tr>
					<td colspan="4" align="center">
                  		<c:if test="${placeData.id == loginUser}">
                  			<input id="i_button" type="button" value="수정하기" onclick="location.href='${contextPath}/place/placeModifyForm?write_no=${placeData.write_no}'">
                  		</c:if> &nbsp;
                  		<button onclick="location.href='${contextPath }/place/placeAllListNum'">글목록</button>
               		</td>
            	</tr>
         	</table>
		</div>
	</div>
    <c:import url="../default/footer.jsp"/>
</body>
</html> 