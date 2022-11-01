
<!-- place/placeSearchListNum.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>placeSearchListNum</title>
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
  <input type="text" value="${placeList}">
   <!-- <div align="center"> -->
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
      </tr> 
       <c:if test="${placeList.size() == 0}">
            <tr>
               <th colspan="6">검색하신 지역중에 등록된 장소가 없습니다</th>
            </tr>   
      </c:if>
       <c:forEach var="dto_s" items="${placeList}">
            <tr>
				<td>${dto_s.id}</td>
				<td><a href="/root/place/placeView?write_no=${dto_s.write_no}">${dto_s.write_no}</a></td>
				<td>${dto_s.title}</td>
				  <c:if test="${dto_s.image == 'nan'}">
                    <td>
                     	<b>이미지가 없습니다..</b>
                  	</td>
                  </c:if>
                  <c:if test="${dto_s.image != 'nan'}">
                 	<td>
                 	<a href="/root/place/placeView?write_no=${dto_s.write_no}"><img src="${contextPath}/place/download?imageFileName=${dto_s.image}" width="200px" height="200px"></a>
                  	</td>
                  </c:if>
                <td><a href="/root/place/placeView?write_no=${dto_s.write_no}">${dto_s.loc_sep_name}</a></td>
				<td><a href="/root/place/placeView?write_no=${dto_s.write_no}">${dto_s.content}</a></td>
            </tr>
      </c:forEach>
      
      <tr>
         <td colspan="6" align="center">
             <c:forEach var="num" begin="1" end="${repeat}">
                 <a href="placeSearchList?loc_sep_name=${loc_sep_name}&num=${num}">[${num}]</a>
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