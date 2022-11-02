<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinAllList</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<link href="${contextPath}/resources/script/css/form.css" rel="stylesheet" type="text/css">
<style type="text/css">

*{
font-family: 'Hahmlet', serif;
}
.joinTable{
   width: 1300px;
   align : center;
   border-collapse: collapse;
   font-size: 18px;
}
.title1{
}
tr {border-top: 1px solid black;
	height: 35px;
   }

tr:hover {cursor: pointer;}

td {
   padding: 5px;
   
}
a {
   text-decoration: none;
}
a:link {color:black;}
a:visited {color:#000069;}
.searchJoin{
	display: inline-block;
	padding-left: 80%;
}
div {text-align:center;}

</style>
</head>
<body>
<div class="wrapper">
   <c:import url="../default/header.jsp"/>
   <hr>
   <input type="hidden" name="join" value="${title }">
   <div align="center">
   <br>
   <h1 align="center"> 등록된 프로젝트 </h1>
    <form action="joinSearchList" method="post" enctype='multipart/form-data'>
    	
   	 <div class="searchJoin">
   		<input name="title" type="text" placeholder="프로젝트를 검색해주세요">
   	</div>
   	<!--<input name="keyword" value="${map.keyword}">-->
   	<input type="submit" value="검색">
   </form>
   <br>
   <table class="joinTable">
      <tr class= "title1">
         <th width="450px">ID</th>
         <th width="100px">NUMBER</th>
         <th width="500px">PROJECT</th>
         <th width="500px">TITLE</th>
         <th width="800px">CONTENT</th>
      </tr>
      <c:if test="${joinList.size() == 0}">
            <tr>
               <th colspan="6">등록된 글이 없습니다</th>
            </tr>   
      </c:if>
      <c:forEach var="dto" items="${joinList}">
            <tr>
				<td>${dto.id}</td>
				 <td><a href="/root/join/joinView?write_no=${dto.write_no}">${dto.write_no}</a></td>
				  
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
                  <td>${dto.title }</td>
				<td><a href="${contextPath}/join/joinView?write_no=${dto.write_no}">${dto.content}</a></td>
            </tr>
      </c:forEach>               
               
      <c:if test="${joinSearchList.size() == 0}">
            <tr>
               <th colspan="6">검색하신 프로젝트가 없습니다</th>
            </tr>   
      </c:if>
       <c:forEach var="dto_j" items="${joinSearchList}">
            <tr>
				<td>${dto_j.id}</td>
				<td><a href="/root/join/joinView?write_no=${dto_j.write_no}">${dto_j.write_no}</a></td>
				<td>${dto_j.title}</td>
				  <c:if test="${dto_j.image == 'nan'}">
                    <td>
                     	<b>이미지가 없습니다..</b>
                  	</td>
                  </c:if>
                  <c:if test="${dto_j.image != 'nan'}">
                 	<td>
                 	<a href="/root/join/joinView?write_no=${dto_j.write_no}"><img src="${contextPath}/join/download?imageFileName=${dto_j.image}" width="200px" height="200px"></a>
                  	</td>
                  </c:if>
				<td><a href="/root/join/joinView?write_no=${dto_j.write_no}">${dto_j.content}</a></td>
            </tr>
      </c:forEach>
      <!--  <a href="${contextPath }/join/artistForm">글작성</a>--> 
      	<tr>
      		<td colspan="6" align="center">
      			<c:forEach var="num" begin="1" end="${repeat}">
                 	<a href="${contextPath }/join/joinSearchList">[${num}]</a>
                </c:forEach>
            </td>
         </tr>
         
   </table>
   </div>
   </div>
   <c:import url="../default/footer.jsp"/>
</body>
</html>