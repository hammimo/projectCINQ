<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinAllList</title>
<style type="text/css">
@font-face {
   font-family: "Maruburi",sans-serif;
}
*{
   font-family: 'Maruburi',sans-serif;
}
.joinTable{
   align : center;
   border-collapse: collapse;
}
.title1{
   background-color: #e6f1ff;
}
tr {border-top: 1px solid black;
   }

tr:hover {background-color: #dcdcdc; cursor: pointer;}

td {
   padding: 5px;
}
a {
   text-decoration: none;
}
a:link {color:black;}
a:visited {color:#000069;}
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <div align="center">
   <br>
   <h1 align="center"> 등록된 프로젝트 </h1>
   <br>
   <table class="joinTable">
      <tr class= "title1">
         <th width="100px">ID</th>
         <th width="300px">PROFILE</th>
         <th width="300px">PROJECT</th>
         <th width="1100px">CONTENT</th>
      </tr>
      <c:if test="${joinList.size() == 0}">
            <tr>
               <th colspan="6">등록된 글이 없습니다</th>
            </tr>   
      </c:if>
      <c:forEach var="dto" items="${joinList}">
            <tr>
				<td>${dto.id}</td>
				<td><a href="/root/join/joinView?write_no=${dto.write_no}">${dto.title}</a></td>
				  
				  <c:if test="${dto.image == 'nan'}">
                    <td>
                     	<b>이미지가 없습니다..</b>
                  	</td>
                  </c:if>
                  <c:if test="${dto.image != 'nan'}">
                 	<td>
                 	<a href="${contextPath}/join/joinView?write_no=${dto.write_no}"><img src="${contextPath}/join/download?imageFileName=${dto.image}" width="200px" height="200px"></a>
                  	</td>
                  </c:if>
				<td><a href="${contextPath}/join/joinView?write_no=${dto.write_no}">${dto.content}</a></td>
            </tr>
      </c:forEach>
      <tr>
         <tr>
            <td colspan="6" align="center">
               <c:forEach var="num" begin="1" end="${repeat}">
                  <a href="joinAllListNum?num=${num}">[  ${num} ]</a>
               </c:forEach>
            </td>
         </tr>
         <tr>
            <td colspan="6">
               <a href="${contextPath }/join/artistForm">글작성</a>
            </td>
         </tr>
   </table>
   </div>
   <c:import url="../default/footer.jsp"/>
</body>
</html>