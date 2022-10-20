<!-- form/rentPlace.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form/rentPlace.jsp</title>

<style type="text/css">
.rentPlace_title {
   text-align: center; 
}
 
.rentPlace {
   width: 500px;
   margin: auto;
}

</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <h1 class="rentPlace_title">장소 등록</h1>
   <div class="rentPlace" align="center"> 
      <form  class="artist_form" action="#" method="post">      
         <b>작성자</b>
         	<input type="text" name="id" value="loginUser" readonly><br><br>
         <b>제 목</b>
         	<input type="text" name="title" size="50"><br><br>
         <b>장소 이미지</b>
		 	<img src="#" id="rentPlace_image" width="350px" height="250px"><br>
			<input type="file"><br><br>
		 <b>내 용</b>
         	<textarea rows="10" cols="50" name="content" placeholder="모집 분야, 일시, 희망 가격을 입력해 주세요"></textarea><br><br>
         <b>지 역</b>
         	<input type="text" name="title" size="50" placeholder="지역API"><br>
         	<p>현재 전시/공연 가능한 지역은 //// 입니다.</p><br><br>
         <b>상세 주소</b>
        	 <input type="text" name="title" size="50"><br><br>    
         <b>모집인원</b>
         <input type="number" min="0" max="100" />      
         <br><br>   
         <input type="submit" value="작성완료"><br><br>
      </form>
   </div>
   <c:import url="../default/footer.jsp"/>
</body>
</html>