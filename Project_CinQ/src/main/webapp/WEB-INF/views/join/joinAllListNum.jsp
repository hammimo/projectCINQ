
<!-- join/joinAllListNum -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<link href="${contextPath}/resources/script/css/joinAllListNum.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/script/css/search.css" rel="stylesheet" type="text/css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

</head>
<body>
    <c:import url="../default/header.jsp"/>
    <div class="main">
    <br>
	   <div class="subject" >
	      <b>등록된 구인 목록</b> &ensp; Join List
	   </div>
	       <form action="joinSearchList" method="post" enctype='multipart/form-data'>
	           <div class="search-box">
	             <input type="text" class="search-txt" name="title" placeholder="글 제목으로 검색"> 
	                <a class="search-btn" href="#"> <i class="fas fa-search"></i></a>
	          </div>
	       </form>
	    <br><br>
	    <!-- table 부분 -->
	    <div class="list">
	    <table class="Table">
	       <tr height="50px"></tr>
	        <c:if test="${joinList.size() == 0}">
	            <tr>
	                <th colspan="2">등록된 글이 없습니다</th>
	            </tr> 
	            <tr height="100px"></tr>
        		<tr height="100px"></tr>
        		<tr height="100px"></tr>
        		<tr height="100px"></tr>
        		<tr height="100px"></tr>   
	        </c:if>
	         <c:forEach var="dto" items="${joinList}">
	            <tr height="50px">
	               <td id="content_loc">${dto.loc_sep_name}</td>
	               <c:if test="${dto.image == 'nan'}">
	                    <td id="content_image" rowspan="4">
	                        <b>이미지가 없습니다..</b>
	                     </td>
	                </c:if>
	                <c:if test="${dto.image != 'nan'}">
	                    <td id="content_image" rowspan="4">
	                    	<a href="/root/join/joinView?write_no=${dto.write_no}">
	                    		<img src="${contextPath}/join/download?imageFileName=${dto.image}" width="350px" height="250px">
	                    	</a>
	                     </td>
	                </c:if>
	            </tr>
	        
	            <tr id="content_row">
	                <td id="content_title"><a href="/root/join/joinView?write_no=${dto.write_no}">제목 : ${dto.title}</a></td>
	            </tr>
	            <tr id="content_row">
	               <td id="content_loc_name">상세 위치 : ${dto.loc_name}</td>
	            </tr>
	            <tr id="content_row">
	            	<td id="content_con">
            			<c:choose>
							<c:when test="${fn:length(dto.content) > 27}">
								내용 : ${fn:substring(dto.content, 0, 25)}...	
							</c:when>
							<c:otherwise>
								내용 : ${dto.content}
							</c:otherwise>
						</c:choose>
            		</td>
	        	 </tr>
	          <tr height="50px"></tr>
	         </c:forEach>
	         <tr>
	            <td colspan="6" align="center">
	          		<c:if test="${startPage > block}">
	            		<button onclick="location.href='joinAllListNum?num=${startPage-1}'">이전</button>
	            	</c:if>
	               <c:forEach var="num1" begin="${startPage}" end="${endPage}">
	               	   <c:if test="${num1 == currentPage }">
	               	   	<button id="currrentPage" onclick="location.href='joinAllListNum?num=${num1}'">${num1}</button>
	               	   </c:if>
	                  <c:if test="${num1 != currentPage }">
	                  	<button id="page" onclick="location.href='joinAllListNum?num=${num1}'">${num1}</button>
	                  </c:if>
	               </c:forEach>
	            	<c:if test="${endPage<totalPage}">
	            		<button onclick="location.href='joinAllListNum?num=${endPage+1}'">다음</button>
	            	</c:if>
	            </td>
	        </tr>
	        <tr>
	           <td colspan="6">
	               <button onclick="location.href='${contextPath }/join/artistForm'">글작성</button>
	            </td>
	        </tr>
	        <tr height="100px"></tr>    
	    </table>
	    </div>
    </div>
    <c:import url="../default/footer.jsp"/>
</body>
</html>