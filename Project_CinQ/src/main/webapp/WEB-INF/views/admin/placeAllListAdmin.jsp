<!-- admin/placeAllListAdmin.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>place Manage</title>
<style type="text/css">
#Y {
	opacity : 0.1;
}
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <br>
   <h1 align="center"> 등록된 장소 목록 </h1>
   <form action="placeSearchList" method="post" enctype='multipart/form-data'>
   	<div class="searchPlace">
   		<input name="loc_sep_name" type="text" placeholder="지역 입력(예시:강남)">&nbsp;<input type="submit" value="검색">
   	</div>
   </form>
   <br>
   <div>
   <table class="placeTable">
      <tr class= "title1">
         <th width="100px">ID</th>
         <th width="100px">NUMBER</th>
         <th width="500px">TITLE</th>
        <th width="300px">PROFILE</th>
         <th width="100px">LOCATION</th>
         <th width="800px">CONTENT</th>
         <th width="200px">PLACEMANAGE</th>
      </tr>
      <c:if test="${placeList.size() == 0}">
            <tr>
               <th colspan="6">등록된 글이 없습니다</th>
            </tr>   
      </c:if>
      <c:forEach var="dto" items="${placeList}">
            <tr>
				<td>${dto.id}</td>
				<td><a href="/root/place/placeView?write_no=${dto.write_no}">${dto.write_no}</a></td>
				<td>${dto.title}</td>
				  <c:if test="${dto.image == 'nan'}">
                    <c:if test="${dto.checkbox=='N' }">                    	
                 		<td>
                 			<a href="/root/place/placeView?write_no=${dto.write_no}">
                 				<img id="N" src="https://via.placeholder.com/200">
                 			</a>
                 		</td>
                    </c:if>
                    <c:if test="${dto.checkbox=='Y' }">                    	
                 		<td>
                 			<a href="/root/place/placeView?write_no=${dto.write_no}">
                 				<img id="Y" src="https://via.placeholder.com/200">
                 			</a>
                 		</td>	
                    </c:if>
                  </c:if>
                  <c:if test="${dto.image != 'nan'}">
                 	<c:if test="${dto.checkbox=='N' }">
                 		<td>
	                 		<a href="/root/place/placeView?write_no=${dto.write_no}">
	                 			<img id="N" src="${contextPath}/place/download?imageFileName=${dto.image}" width="200px" height="200px">
	                 		</a>
                 		</td>
                 	</c:if>
                 	<c:if test="${dto.checkbox=='Y' }">
                 		<td>
                 			<a href="/root/place/placeView?write_no=${dto.write_no}">
                 				<img id="Y" src="${contextPath}/place/download?imageFileName=${dto.image}" width="200px" height="200px">
                 			</a>
                  		</td>	
                 	</c:if>
                  </c:if>
                <td><a href="/root/place/placeView?write_no=${dto.write_no}">${dto.loc_sep_name}</a></td>
				<td><a href="/root/place/placeView?write_no=${dto.write_no}">${dto.content}</a></td>
				<td>
					<input type="button" value="사용하기" onclick="location.href='${contextPath}/admin/placeUpdateY?write_no=${dto.write_no }'">
					<input type="button" value="사용종료" onclick="location.href='${contextPath}/admin/placeUpdateN?write_no=${dto.write_no }'">
					<input type="button" value="삭제" onclick="location.href='${contextPath}/admin/deletePlace?write_no=${dto.write_no }'">
				</td>
            </tr>
      </c:forEach>
	 <tr>
	     <td colspan="6" align="center">
	         <c:forEach var="num" begin="1" end="${repeat_a}">
	           <a href="placeAllListNum?num=${num}">[${num}]</a>
	         </c:forEach>
	     </td>
	 </tr>
     <tr>
        <td colspan="6">
            <a href="${contextPath }/place/rentPlace">글작성</a>
        </td>
     </tr>
     </table>
     </div>
   
   <c:import url="../default/footer.jsp"/>
</body>
</html> 