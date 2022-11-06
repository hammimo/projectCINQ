<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberAllList</title>
<style type="text/css">
#memberList {
	margin: 50px; width: 800px;
    border-spacing: 0;
    border-collapse: collapse; 
    font-size: 22px;
    text-align: center;
}
#memberList th,td {
	border: 1px solid black;
}
</style>
</head>
<body>
    <c:import url="../default/header.jsp"/>
    <c:import url="../default/aside.jsp"/>
	<c:import url="../default/adminMenu.jsp"/>
    <div align="center">
        <h1>회원정보</h1>

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