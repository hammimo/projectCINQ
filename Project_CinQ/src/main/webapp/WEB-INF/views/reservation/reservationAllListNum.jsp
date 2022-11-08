
<!-- place/placeAllListNum.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<link href="${contextPath}/resources/script/css/listNum.css" rel="stylesheet" type="text/css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

<script type="text/javascript">

</script>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <div class="main">
   	<div class="subject" >
		 <b>등록된 프로젝트 목록</b> &ensp; Project List
   	</div>
    <div class="list">
    	<table class="Table">
    	  <c:if test="${reservationList.size() == 0}">
            <tr>
               <th colspan="6">등록된 글이 없습니다</th>
            </tr> 
            <tr height="100px"></tr>
        	<tr height="100px"></tr>
        	<tr height="100px"></tr>
        	<tr height="100px"></tr>
        	<tr height="100px"></tr>   
      	  </c:if>
      	  <c:forEach var="dto" items="${reservationList}">
      		<tr height="100px"></tr>
        	<tr>
			<td id="content_id">작성자 : ${dto.id}</td>
		    	<c:if test="${dto.image == 'nan'}">
                	<td id="content_image" rowspan="5">
                 		<b>이미지가 없습니다..</b>
              		</td>
            	</c:if>
            	<c:if test="${dto.image != 'nan'}">
                	<td id="content_image" rowspan="5">
         				<a href="${contextPath}/reservation/reservationView?write_no=${dto.write_no}">
         					<img src="${contextPath}/reservation/download?imageFileName=${dto.image}" width="650px" height="400px">
         				</a>
                	</td>
            	</c:if>
        	</tr>
        	<tr id="content_row">   
				<td id="content_title">제목 : ${dto.title}</td>
			</tr>
			<tr id="content_row">   
				<td id="content_con">내용 정보 : ${dto.content}</td>
			</tr>
        	<tr>    
        	    <c:if test="${dto.location == 0}">
        	        <td>장소 추천 희망</td>
       		    </c:if>
            	<c:if test="${dto.location != 0}">
            		<td>
            			<a href="/root/place/placeView?write_no=${dto.location}">상세 장소 정보</a>
            		</td>
                <%-- <td><button type="button" onclick="location.href='${contextPath}/place/placeView?write_no=${dto.location}'">${dto.location}</button></td> --%>
		    	</c:if>
			</tr> 
			<tr id="content_row">   
				<td><%-- ${dto.loc_name } --%></td>
			</tr>
			<tr>
				<td>
					<button type="button" onclick="location.href='${contextPath}/reservation/ticketingRegister?write_no=${dto.write_no}&location=${dto.location}'">예매등록</button>
				</td>
				<td>
					<button type="button" onclick="location.href='${contextPath}/reservation/reservationDelete?write_no=${dto.write_no}&imageFileName=${data.image}'">삭제</button>
				</td>
			</tr>
			<tr height="100px"></tr> 
    	  </c:forEach>
      	  <tr>
	            <td colspan="6" align="center">
	          		<c:if test="${startPage > block}">
	            		<button onclick="location.href='reservationAllListNum?num=${startPage-1}'">이전</button>
	            	</c:if>
	               <c:forEach var="num1" begin="${startPage}" end="${endPage}">
	               	   <c:if test="${num1 == currentPage }">
	               	   	<button id="currrentPage" onclick="location.href='reservationAllListNum?num=${num1}'">${num1}</button>
	               	   </c:if>
	                  <c:if test="${num1 != currentPage }">
	                  	<button id="page" onclick="location.href='reservationAllListNum?num=${num1}'">${num1}</button>
	                  </c:if>
	               </c:forEach>
	            	<c:if test="${endPage<totalPage}">
	            		<button onclick="location.href='reservationAllListNum?num=${endPage+1}'">다음</button>
	            	</c:if>
	            </td>
	        </tr>

     </table>
    </div>
   </div>
  <c:import url="../default/footer.jsp"/>
</body>
</html> 