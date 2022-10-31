
<!-- place/placeView -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JoinView</title>
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
      <h1 class="place_title" align="center">등록된 장소</h1>
      <br><br>
      <div class ="place_view" align="center">
         <table class="Sproject" >
            <tr>
               <th width="150px">작성자</th><td colspan="2">${placeData.id }</td>
            </tr>
            <tr>
               <th>제 목</th><td colspan="2">${placeData.title }</td>
            </tr>
            <tr>
               <th>지 역</th><td colspan="2">${placeData.loc_sep_name}</td>
            </tr>
            <tr>
               <th>내용</th>
               <td colspan="2">
                  <c:if test="${placeData.image == 'nan'}">
                     <b>이미지가 없습니다..</b>
                  </c:if>
                  <c:if test="${placeData.image != 'nan'}">
                 	<img src="${contextPath}/place/download?imageFileName=${placeData.image}" width="200px" height="200px">
                  </c:if>
               </td>
               <td>${data.content}</td>
            </tr>
            <tr>
				<td colspan="4" align="center">
				<div id="reply"></div>
                  <c:if test="${placeData.id == loginUser}">
					<input type="button" value="수정하기" onclick="location.href='${contextPath}/place/placeModifyForm?write_no=${placeData.write_no}'">&nbsp;
					<input type="button" value="삭제하기" onclick="location.href='${contextPath}/place/delete?id=${placeData.id}&write_no=${placeData.write_no}&imageFileName=${data.image}'">
                  </c:if> &nbsp;
                  <input type="button" value="글목록" onclick="location.href='${contextPath}/place/placeAllListNum'">
               	  <c:if test="${loginUser == 'admin'}">
               	<input type="button" value="돌아가기" onclick="location.href='${contextPath}/reservation/reservationAllListNum'">
               	</c:if>
               </td>
            </tr>
         </table>
      </div>
      <br><br><br>
   <c:import url="../default/footer.jsp"/>

</body>
</html> 