<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<link href="${contextPath}/resources/script/css/adminMember.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
</head>
<body>
    <c:import url="../default/header.jsp"/>
    <c:import url="../default/adminAside.jsp"/>
    <div class="main" align="center">
        <h1>회원정보</h1>
		<br><br>
        <table id="memberList">
            <tr>
                <th> id </th>
                <th> pw </th>
                <th> name </th>
                <th> email </th>
                <th> tel </th>
                <th> gender </th>
                <th> birthday</th>
            </tr>
            <c:forEach var="dto" items="${memberList}">
            <tr>
                <td>${dto.id }</td>
                <td>${dto.pw }</td>
                <td>${dto.name }</td>
                <td>${dto.email }</td>
                <td>${dto.tel }</td>
                <td>${dto.gender }</td>
                <td>${dto.birthday }</td>
            </tr>
            </c:forEach>
            <tr>
                <td colspan="7" align="center">
                   <c:forEach var="num" begin="1" end="${repeat}">
                      <a href="memberAllList?num=${num}">[  ${num} ]</a>
                   </c:forEach>
                </td>
             </tr>
        </table>
    </div>
    <c:import url="../default/footer.jsp"/>
</body>
</html>