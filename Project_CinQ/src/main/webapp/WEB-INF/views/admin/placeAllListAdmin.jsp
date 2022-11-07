<!-- admin/placeAllListAdmin.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<style type="text/css">
#Y {
	opacity : 0.3;
}
.placeManage {
	align-content: center;
}
.tg  {
	border-collapse:collapse;
	border-spacing:0;
	text-align: center;
}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:'Hahmlet', sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px; border-top-width: 5px; font-family:'Hahmlet', sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-0pky{border-color:inherit;text-align:center;vertical-align:top;}
.tg .tg-0lax{text-align:center;vertical-align:top}

.tg-0pky input[type="button"]{
	margin: 0;
	padding: 0;
	position: relative;
    border: none;
    display: inline-block;
    padding: 8px 18px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
	box-sizing: border-box;
	margin: 20px;
	background-color: #323232;
    color: white;
    font-family: 'Hahmlet', serif;
}
label {
	color: red;
	font-weight: bold;
}

</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<c:import url="../default/adminAside.jsp"/>
   <br>
   <h1 align="center"> 장소 관리 </h1>
   <br>
   <div class='placeManage' align="center">
	<table class="tg" >
		<c:forEach var="dto" items="${placeList}">
			<thead>
			  <tr>
			    <th class="tg-0pky" width="200">장소</th>
			    <th class="tg-0pky" width="200">제목</th>
			    <th class="tg-0pky" width="400">${dto.title}</th>
			  </tr>
			</thead>
			<tbody>
			  <tr>
			    <c:if test="${dto.image == 'nan'}">
					<c:if test="${dto.checkbox=='N' }">                    	
						<td class="tg-0lax" rowspan="3">
							<a href="/root/place/placeView?write_no=${dto.write_no}">
		                 		<img id="N" src="https://via.placeholder.com/200">
		                 	</a>
						</td>
					</c:if>
					<c:if test="${dto.checkbox=='Y'}">                    	
						<td class="tg-0lax" rowspan="3">
							<a href="/root/place/placeView?write_no=${dto.write_no}">
								<img id="Y" src="https://via.placeholder.com/200">
								<label>사용중입니다</label>
		                 	</a>
						</td>	
					</c:if>
				</c:if>
				<c:if test="${dto.image != 'nan'}">
					<c:if test="${dto.checkbox=='N' }">                    	
						<td class="tg-0lax" rowspan="3">
							<a href="/root/place/placeView?write_no=${dto.write_no}">
                 				<img id='N' src="${contextPath}/place/download?imageFileName=${dto.image}" width="200px" height="200px">
                 			</a>
						</td>
					</c:if>
					<c:if test="${dto.checkbox=='Y'}">                    	
						<td class="tg-0lax" rowspan="3">
							<a href="/root/place/placeView?write_no=${dto.write_no}">
                 				<img id='Y' src="${contextPath}/place/download?imageFileName=${dto.image}" width="200px" height="200px">
                 				<label>사용중입니다</label>
                 			</a>
						</td>	
					</c:if>
				</c:if>	    
			    <td class="tg-0lax" >장소 등록자 </td>
			    <td class="tg-0lax" colspan="3">${dto.id }</td>
			  </tr>
			  <tr>
			    <td class="tg-0pky">수용가능인원</td>
			    <td class="tg-0pky" colspan="3">${dto.max_count } 명</td>
			  </tr>
			  <tr>
			    <td class="tg-0pky">내용</td>
			    <td class="tg-0pky" colspan="3">
				    <a href="/root/place/placeView?write_no=${dto.write_no}">${dto.content}</a>
				</td>
			  </tr>
			  <tr>
			    <td class="tg-0pky">${dto.loc_name}</td>
			    <td class="tg-0pky" colspan="4" >
			    	<input type="button" value="사용하기" onclick="location.href='${contextPath}/admin/placeUpdateY?write_no=${dto.write_no }'">
					<input type="button" value="사용종료" onclick="location.href='${contextPath}/admin/placeUpdateN?write_no=${dto.write_no }'">
					<input type="button" value="삭제" onclick="location.href='${contextPath}/admin/deletePlace?write_no=${dto.write_no }'"></td>
			  </tr>
			</tbody>
			<br>
		</c:forEach>
		<tr>
		     <td colspan="5" align="center">
		         <c:forEach var="num" begin="1" end="${repeat}">
		           <a href="placeAllList?num=${num}">[${num}]</a>
		         </c:forEach>
		     </td>
		</tr>
	</table>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html> 