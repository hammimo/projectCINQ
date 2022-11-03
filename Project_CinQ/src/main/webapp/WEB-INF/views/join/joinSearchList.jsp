
<!-- place/placeSearchListNum.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinSearchListNum</title>
<link href="${contextPath}/resources/script/css/listNum.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/script/css/search.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

<style type="text/css">
*{
font-family: 'Hahmlet', serif;
}
</style>
<script type="text/javascript">


</script>
</head>
<body>
    <c:import url="../default/header.jsp"/>
    <input type="hidden" value="${joinList}">
    <!-- <div align="center"> -->
    <div class="main">
    	<br>
    	<h1 align="center"> Join List </h1>
    	<form action="joinSearchList" method="post" enctype='multipart/form-data'>
    		<div class="search-box">
        		<input type="text" class="search-txt" name="title" placeholder="글 제목으로 검색"> 
	        	<a class="search-btn" href="#"><i class="fas fa-search"></i></a>
			</div>
		</form>
    	<br>
    	<div>
    		<table class="Table">
        		<tr class= "title1">
            		<th width="100px">ID</th>
            		<th width="100px">NUMBER</th>
            		<th width="300px">PROJECT</th>
           			<th width="400px">TITLE</th>
        		    <th width="100px">LOCATION</th>
          			<th width="700px">CONTENT</th>
       			</tr> 
        		<c:if test="${joinSearchList.size() == 0}">
            		<tr>
               			<th colspan="6">검색하신 내용과 일치하는 제목이 없습니다</th>
            		</tr>   
       			</c:if>
        		<c:forEach var="dto_s" items="${joinSearchList}">
            		<tr id="content_row">
		        		<td id="content_td">${dto_s.id}</td>
						<td id="content_td"><a href="/root/join/joinView?write_no=${dto_s.write_no}">${dto_s.write_no}</a></td>
						<c:if test="${dto_s.image == 'nan'}">
                    		<td id="content_td">
                     			<b>이미지가 없습니다..</b>
                  			</td>
                		</c:if>
                		<c:if test="${dto_s.image != 'nan'}">
                    		<td id="content_td">
                 				<a href="/root/join/joinView?write_no=${dto_s.write_no}">
                 					<img src="${contextPath}/place/download?imageFileName=${dto_s.image}" width="200px" height="200px">
                 				</a>
                  			</td>
                		</c:if>
                		<td id="content_td">
                			<a href="/root/join/joinView?write_no=${dto_s.write_no}">${dto_s.title}</a>
                		</td>
                		<td id="content_td">
                			<a href="/root/join/joinView?write_no=${dto_s.write_no}">${dto_s.loc_sep_name}</a>
                		</td>
						<td id="content_td">
							<a href="/root/join/joinView?write_no=${dto_s.write_no}">${dto_s.content}</a>
						</td>
            		</tr>
				</c:forEach>
        		<tr>
            		<td colspan="6" align="center">
                		<c:forEach var="num" begin="1" end="${repeat}">
                			<button onclick="location.href='joinSearchList?title=${title}&num=${num}'">${num}</button>
             			</c:forEach>
         			</td>
     			</tr>
     			<tr>
        			<td colspan="6">
            	 		<button onclick="location.href='${contextPath }/join/artistForm'">글작성</button>
        			</td>
     			</tr>
    		</table>
    	</div>
    	<c:import url="../default/footer.jsp"/>
    </div>
</body>
</html> 