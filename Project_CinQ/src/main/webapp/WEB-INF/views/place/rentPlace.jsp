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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function readURL(input){
	   var file = input.files[0]; // 파일 정보
	   if(file != ""){
	      var reader = new FileReader();
	      reader.readAsDataURL(file); // 파일 정보 읽어오기
	      reader.onload = function(e){ // 읽기에 성공하면 결과 표시
	         $("#preview").attr("src", e.target.result)
	      }
	   }
	}

function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
			var addr="";
			// R : 도로명, J : 지번
			if(data.userSelectedType=='R'){
				addr = data.roadAddress
			}
			else {
				addr = data.jibunAddress
			}
			$("#addr1").val(data.zonecode)
			$("#addr2").val(addr)
			$("#addr3").focus()
        }
    }).open();
}

function writeSave(){
	
  	 var addr1 = $("#addr1").val(); 
	 var addr2 = $("#addr2").val();
	 var addr3 = $("#addr3").val();
	
	 var addrResult = "";
	 
	
	 
 	addrResult = addr1 + "/" + addr2 + "/" + addr3;
	$("#addrResult").val(addrResult);   
	  addr2 = addr2.substring(3, 5);
	$("#loc_sep_name").val(addr2);
		
	rentPlace_form.submit();
	
	
}

</script>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <h1 class="rentPlace_title">장소 등록</h1>
   <div class="Place" align="center"> 
      <form id="rentPlace_form" action="rentPlaceSave" method="post" enctype='multipart/form-data'>      
         <b>작성자</b>
         	<input type="text" name="id" value="${loginUser}" readonly><br><br>
         <b>제 목</b>
         	<input type="text" name="title" size="50"><br><br>
         <b>장소 이미지</b>
		 	<img src="#" id="preview" width="350px" height="250px"><br>
			<input type="file" name="image" value="장소사진" onchange="readURL(this)"><br><br>
		 <b>내 용</b>
         	<textarea rows="10" cols="50" name="content" placeholder="모집 분야, 일시, 희망 가격을 입력해 주세요"></textarea><br><br>
         <b>지 역</b>&nbsp;
          <input type="text" id="addr1" name="addr" placeholder="우편번호" readonly>
		  <input type="button" class="btn btn-info" value="우편번호 찾기" onclick="daumPost()"><br>
		  <input type="text" id="addr2" placeholder="주소" readonly><br>
		  <input type="text" id="addr3" placeholder="상세주소">
 		  <input type="hidden" id="addrResult" name="addrResult">
 		   <input type="hidden" id="loc_sep_name" name="loc_sep_name">
          <!-- <input type="text" id="addrRegion" name="addrRegion"> -->
          <br/>
          <br/>
          <!-- <b>주소</b>
          <input type="text" id="loc_name" name="loc_name"> -->
        
         <b>모집인원</b>
         <input type="number" min="0" max="100" id="max_count" name="max_count" />      
         <br><br>   
         <input type="button" onclick="writeSave()" value="작성완료"><br><br>
      </form>
   </div>
   <c:import url="../default/footer.jsp"/> 
</body>
</html>  