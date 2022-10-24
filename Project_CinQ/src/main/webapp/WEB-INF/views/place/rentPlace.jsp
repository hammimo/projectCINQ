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

 $(function(){
    areaSelectMaker("select[name=addrRegion]");
});

var areaSelectMaker = function(target){
    if(target == null || $(target).length == 0){
        console.warn("Unknown Area Tag");
        return;
    }

    var area = {
        "수도권" :{
            "서울특별시" : [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ],
            "경기도" : [ "수원시 장안구", "수원시 권선구", "수원시 팔달구", "수원시 영통구", "성남시 수정구", "성남시 중원구", "성남시 분당구", "의정부시", "안양시 만안구", "안양시 동안구", "부천시", "광명시", "평택시", "동두천시", "안산시 상록구", "안산시 단원구", "고양시 덕양구", "고양시 일산동구",
                "고양시 일산서구", "과천시", "구리시", "남양주시", "오산시", "시흥시", "군포시", "의왕시", "하남시", "용인시 처인구", "용인시 기흥구", "용인시 수지구", "파주시", "이천시", "안성시", "김포시", "화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군",
                "양평군" ],
            "인천광역시" : [ "계양구", "미추홀구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군" ]      
        }
    };

    for(i=0; i<$(target).length; i++){
        (function(z){
            var a1 = $(target).eq(z);
            var a2 = a1.next();
            var a3 = a2.next();

            //초기화
            init(a1, true);

            //권역 기본 생성
            var areaKeys1 = Object.keys(area);
            areaKeys1.forEach(function(Region){
                a1.append("<option value="+Region+">"+Region+"</option>");
            });

            //변경 이벤트
            $(a1).on("change", function(){
                init($(this), false);
                var Region = $(this).val();
                var keys = Object.keys(area[Region]);
                keys.forEach(function(Do){
                    a2.append("<option value="+Do+">"+Do+"</option>");    
                });
            });

            $(a2).on("change", function(){
                a3.empty().append("<option value=''>선택</option>");
                var Region = a1.val();
                var Do = $(this).val();
                var keys = Object.keys(area[Region][Do]);
                keys.forEach(function(SiGunGu){
                    a3.append("<option value="+area[Region][Do][SiGunGu]+">"+area[Region][Do][SiGunGu]+"</option>");    
                });
            });
        })(i);        

        function init(t, first){
            first ? t.empty().append("<option value=''>선택</option>") : "";
            t.next().empty().append("<option value=''>선택</option>");
            t.next().next().empty().append("<option value=''>선택</option>");
        }
        
    }
} 
function writeSave(){
	
  	 var addrRegion = $("#addrRegion").val(); 
	 var addressDo = $("#addressDo").val();
	 var addressSiGunGu = $("#addressSiGunGu").val();
	 var addrPlus = $("#addrPlus").val(); 
	
	 var addrResult = "";
	 
 	addrResult = addrRegion + "/" + addressDo + "/" + addressSiGunGu + "/" + addrPlus;
	$("#addrResult").val(addrResult);   
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
          <select id="addrRegion" name="addrRegion" ></select>
          <select id="addressDo" name="addressDo" ></select>
          <select id="addressSiGunGu" name="addressSiGunGu" ></select> 
 		  <input type="hidden" id="addrResult" name="addrResult">        
          <!-- <input type="text" id="addrRegion" name="addrRegion"> -->
          <p>현재 모집가능한 지역은 <b>수도권</b> 입니다.</p> <!-- 아직 동적으로 변환 구현 X  -->
          <br/>
          <br/>
          <b>지역명</b>
          <input type="text" id="loc_name" name="loc_name">
         	<p>현재 전시/공연 가능한 지역은 //// 입니다.</p><br><br>
         <b>상세 주소</b>
        	 <input type="text" id="addrPlus" name="addrPlus" size="50"><br><br>    
         <b>모집인원</b>
         <input type="number" min="0" max="100" id="max_count" name="max_count" />      
         <br><br>   
         <input type="button" onclick="writeSave()" value="작성완료"><br><br>
      </form>
   </div>
   <c:import url="../default/footer.jsp"/> 
</body>
</html> 