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
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='<c:url value="/resources/script/js/post.js"/>'></script>
<script src='<c:url value="/resources/script/js/file.js"/>'></script>
<link href="${contextPath}/resources/script/css/form.css" rel="stylesheet" type="text/css">
<style type="text/css">
*{
font-family: 'Hahmlet', serif;
}
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <c:import url="../default/aside.jsp"/>
   <hr>
   <p class="title">RENT PLACE</p><br>
   <hr>
   <br><br><br>
   <div id='wrapper'>
   <div class="div_1" align="center"> 
      <form id="form" action="rentPlaceSave" method="post" enctype='multipart/form-data'>   
         <div class="textbox">
        <label for="input" >작성자</label>
         <input type="text" name="id" value="${loginUser}" readonly><br><br>
      </div>
      <div class="textbox">
        <label for="input">제목</label>
         <input type="text"  name="title" size="50"><br><br>
      </div>
        <div class ="img"><img src="#" id="preview" width="500px" height="300px"><br>
      
         <label for="upload-file">파일선택</label>
         <input type="file" name="image" id="upload-file" onchange="readURL(this)">
         </div>
         <!--<input type="file" name="image" value="장소사진" onchange="readURL(this)"><br><br>-->
      
      <div class="textbox">
        <label for="input">내용</label>
        <textarea rows="10" cols="70" name="content" placeholder="모집 분야, 일시, 희망 가격을 입력해 주세요"></textarea><br><br>
      </div>
      <div class="textbox">
        <label for="input">지역</label>
        <input type="text" id="addr1" name="addr" readonly>
        <input type="button" class="btn btn-info" value="우편번호 찾기" onclick="daumPost()"><br>
        <input type="text" id="addr2" placeholder="주소" readonly><br>
        <input type="text" id="addr3" placeholder="상세주소">
         <input type="hidden" id="addrResult" name="addrResult">
         <input type="hidden" id="loc_sep_name" name="loc_sep_name">
      </div>
          <br>
         <div class="textbox">
        <label for="input">모집인원</label>
        <input type="number" min="0" max="100" id="max_count" name="max_count" />      
      </div>
           <br>
         <button type="button" onclick="writeSave()" value="작성완료">작성완료</button>
           </form>
      </div>
   </div>
   <c:import url="../default/footer.jsp"/>
</body>
</html>  