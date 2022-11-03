<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.placeTable {
	width: 400px;
}
td {
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src='<c:url value="/resources/script/js/reservation.js"/>'></script>
<script src='<c:url value="/resources/script/js/ticketingRegister.js"/>'></script>
</head>
<body>
   <div>
   <table class="placeTable" border="1">
      <tr class= "title1">
         <th width="100px">NUMBER</th>
         <th width="500px">TITLE</th>
        <th width="300px">PROFILE</th>
         <th width="100px">LOCATION</th>
         <th width="800px">CONTENT</th>
         <th width="800px">신청</th>
         
      </tr>
      <c:if test="${rentOkList.size() == 0}">
            <tr>
               <th colspan="6">등록된 글이 없습니다</th>
            </tr>   
      </c:if>
      <c:forEach var="dto" items="${rentOkList}">    
           <tr>
				<td>
				${dto.write_no}
				</td>
				<td>${dto.title}</td>
				  <c:if test="${dto.image == 'nan'}">
                    <td>
                     	<b>이미지가 없습니다..</b>
                  	</td>
                  </c:if>
                  <c:if test="${dto.image != 'nan'}">
                 	<td>
                 	<img src="${contextPath}/place/download?imageFileName=${dto.image}" width="200px" height="200px">
                  	</td>
                  </c:if>
                <td>${dto.loc_sep_name}</td>
				<td>${dto.content}</td>
	            <td>
	            	<input type="hidden" id="place_no" value="${dto.write_no} ">
	            	<input type="button" value="신청하기" onclick="placeSubmit()">
	            </td>
            </tr>
      </c:forEach>
	      <tr>
		         <td colspan="6" align="center">
		             <c:forEach var="num" begin="1" end="${repeat}">
		                 <a href="rentOkPlaceView?num=${num}">[${num}]</a>
		             </c:forEach>
		         </td>
	     </tr>
     </table>
     </div>
</body>
</html>