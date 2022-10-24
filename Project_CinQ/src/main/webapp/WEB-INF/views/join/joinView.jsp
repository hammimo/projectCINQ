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
@font-face {
   font-family: "Maruburi";
   src: url("D:\fullstack\project\util\마루 부리\MaruBuriTTF") format("truetype");
}
*{
   font-family: 'Maruburi', serif;
}
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
      <h1 class="view_title" align="center">프로젝트가 만들어졌습니다!</h1>
      <br><br>
      <div class ="join_view" align="center">
         <table class="Sproject" >
            <tr>
               <th width="150px">작성자</th><td colspan="2">${data.id }</td>
            </tr>
            <tr>
               <th>제 목</th><td colspan="2">${data.title }</td>
            </tr>
            <tr>
               <th>내용</th>
               <td colspan="2">
                  <c:if test="${data.image == 'nan'}">
                     <b>이미지가 없습니다..</b>
                  </c:if>
                  <c:if test="${data.image != 'nan'}">
                     <img src="${contextPath}/join/download?image=${data.image}" width="200px" height="200px">
                  </c:if>
               </td>
               <td>${data.content}</td>
            </tr>
            <tr>
               <td colspan="4" align="center">
                  <div id="reply"></div>
                  <c:if test="${data.id == loginUser}">
                     <input type="button" value="수정하기" onclick="location.href='${contextPath}/join/join_modify_form?title=${data.title}'">&nbsp;
                     <input type="button" value="삭제하기" onclick="location.href='${contextPath}/join/join_delete?title=${data.title}&image=${data.image}'">
                  </c:if> &nbsp;
                  <input type="button" value="답글달기" onclick="slide_click()"> &nbsp;
                  <input type="button" value="글목록" onclick="location.href='${contextPath}/join/joinAllList'">
               </td>
            </tr>
         </table>
      </div>
      <br><br><br>
   <c:import url="../default/footer.jsp"/>

</body>
</html>