<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form/artistForm.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='<c:url value="/resources/script/js/file.js"/>'></script>
<script src='<c:url value="/resources/script/js/post.js"/>'></script>
<style type="text/css">
.artist_title {
   text-align: center;
}
.artist_img {
   right : 200px;
   position: fixed;
   
}
.artist { 
   width: 500px;
   margin: auto;
}
.artist_form {
   text-align: left;
}
p {
   font-size : 10px;
   color: gray
}
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <h1 class="artist_title">멤버모집</h1>
   <br><br><br>
   <div class ="artist_img"><img src="#" id="preview" width="200px" height="200px"></div>
   <div class="artist" align="center">
      <form  id="form" class="artist_form"  action="${contextPath }/join/JoinSave" enctype="multipart/form-data" method="post">      
         <b>작성자</b>
         <input type="text" name="id" value= "${loginUser}" readonly><br><br>
         <b>제 목</b>
         <input type="text" name="title" size="50"><br><br>
         <b>내 용</b>
         <textarea rows="10" cols="50" name="content"></textarea><br><br>
         <b>지 역</b>&nbsp;
          <input type="text" id="addr1" name="addr" placeholder="우편번호" readonly>
		  <input type="button" class="btn btn-info" value="우편번호 찾기" onclick="daumPost()"><br>
		  <input type="text" id="addr2" placeholder="주소" readonly><br>
		  <input type="text" id="addr3" placeholder="상세주소">
 		  <input type="hidden" id="addrResult" name="addrResult">
 		  <input type="hidden" id="loc_sep_name" name="loc_sep_name"><br><br>
         <b>현재인원</b>
         <input type="number" min="0" max="100" name="cur_count"/>      
         <b>모집인원</b>
         <input type="number" min="0" max="100" name="max_count" />      
         <br><br>   
         <b>프로필 올리기</b>
         <input type="file" name="image" value="팀장프로필" onchange="readURL(this)"><br><br>
         <input type="button" value="완료" onclick="writeSave()"> &nbsp;
         <input type="button" value="돌아가기" onclick="location.href='../index'"><br><br><br>
      </form>
   </div> 
   <c:import url="../default/footer.jsp"/>
</body>
</html>