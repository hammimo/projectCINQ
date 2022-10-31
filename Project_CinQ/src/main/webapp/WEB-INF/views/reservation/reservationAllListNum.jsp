
<!-- place/placeAllListNum.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>placeAllListNum</title>

<style type="text/css">
/* .searchPlace{
    display: inline-block;
    margin-top: 30px;
    margin-left: 260px;
  }
  .searchArea input{
      height: 30px;
    width: 250px;
  }
  .searchArea button{
     width: 100px;
    height: 36px;
  } */
.placeTable{
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
div {text-align:center;}
</style>
<script type="text/javascript">


</script>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <!-- <div align="center"> -->
   <br>
   <h1 align="center"> 제출된 프로젝트 목록 </h1>
   <br>
   <div>
   <table class="placeTable">
      <tr class= "title1">
         <th width="100px">ID</th>
         <th width="100px">NUMBER</th>
         <th width="500px">TITLE</th>
        <th width="300px">PROFILE</th>
         <th width="100px">신청한 대관장소</th>
         <th width="800px">CONTENT</th>
         <th width="100px">등록/삭제</th>
         
      </tr>
      <c:if test="${reservationList.size() == 0}">
            <tr>
               <th colspan="6">등록된 글이 없습니다</th>
            </tr>   
      </c:if>
      <c:forEach var="dto" items="${reservationList}">
            <tr>
				<td>${dto.id}</td>
				<td>${dto.write_no}</td>
				<td>${dto.title}</td>
				  <c:if test="${dto.image == 'nan'}">
                    <td>
                     	<b>이미지가 없습니다..</b>
                  	</td>
                  </c:if>
                  <c:if test="${dto.image != 'nan'}">
                 	<td>
                 	<a href="${contextPath}/reservation/reservationView?write_no=${dto.write_no}"><img src="${contextPath}/reservation/download?imageFileName=${dto.image}" width="200px" height="200px"></a>
                  	</td>
                  </c:if>
                <td><button type="button" onclick="location.href='${contextPath}/place/placeView?write_no=${dto.location}'">${dto.location}</button></td>
				<td>${dto.content}</td>
				<td><button type="button" onclick="location.href='${contextPath}/reservation/ticketingRegister?write_no=${dto.write_no}'">예매등록</button></td>
				<td><button type="button" onclick="location.href='${contextPath}/reservation/reservationDelete?write_no=${dto.write_no}'">삭제</button></td>
            </tr>
      </c:forEach>
      <tr>
         <td colspan="6" align="center">
             <c:forEach var="num" begin="1" end="${repeat}">
                 <a href="placeAllListNum?num=${num}">[${num}]</a>
             </c:forEach>
         </td>
     </tr>
     </table>
     </div>
   
   <c:import url="../default/footer.jsp"/>
</body>
</html> 