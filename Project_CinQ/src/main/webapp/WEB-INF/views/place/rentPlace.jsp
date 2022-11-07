<!-- form/rentPlace.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='<c:url value="/resources/script/js/post.js"/>'></script>
<script src='<c:url value="/resources/script/js/file.js"/>'></script>

<style type="text/css">
*{
font-family: 'Hahmlet', serif;
}
#wrapper{
	height: auto;
 	 min-height: 100%;
 	 padding-bottom: 10px;
 	 background-color :rgba(0, 13, 0, 0.04);
}
#infoSection{
	float: right;
	width: 150px;
	height: 700px;
	line-height: 100px;
	font-family: 'Hahmlet', serif;
}
.textbox label {
  position: relative;
  top: 1px;  
  left: 1px;  
  padding: .8em .5em; 
  color: 	#464646;
  cursor: text;
  font-size: 17px;
  font-weight: bold;
  
}
.textbox input[type="text"] {
  width: 38%;  
  height: auto; 
  line-height : normal;  
  padding: .5em .4em; 
  font-family: inherit; 
  border: 1.3px solid 	#464646;
  border-radius: .4em;  
  outline-style: none;  
  -webkit-appearance: none; 
  -moz-appearance: none;
  appearance: none;
}
.textbox input[type="number"] {
  width: 15%;  
  height: auto; 
  line-height : normal;  
  padding: .4em .3em; 
  font-family: inherit; 
  border: 1.3px solid 	#464646;
  border-radius: .4em;  
  outline-style: none;  
  -webkit-appearance: none; 
  -moz-appearance: none;
  appearance: none;
}
button {
	margin: 0;
	padding: 0;
	position: relative;
    border: none;
    display: inline-block;
    padding: 6px 15px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 200;
    transition: 0.25s;
	box-sizing: border-box;
	margin: 20px;
	background-color: #323232;
    color: white;
    font-family: 'Hahmlet', serif;
	}
button:hover {
	letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
	background-color: #323232;
    color: white;
	}
li {
	font-family: 'Hahmlet', serif;
	list-style: none;
	font-size: 18px;
	line-height: 50px;
	}
textarea {
	resize: none;
	border-radius: .7em;  
}
.title_content {
	vertical-align: top;
	display: inline-block;
	width : 30%;
}
.addr_num {
	display: inline-block;
	width: 30%;
}
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <hr>
   <div id='wrapper'>
   <p class="title">RENT PLACE</p><br>
   <hr>
   <br><br><br>
   		<section id ="infoSection">
   		<ul>
      		<li><a href="/root/member/myinfo1?id=${loginUser}">MY INFO</a></li>
      		<li><a href="/root/member/myinfo2?id=${loginUser}">PROJECT</a></li>
      		<li>HISTORY</li>
   		</ul>
   		</section>
   		<div class="div_1" align="center"> 
      		<form id="form" action="rentPlaceSave" method="post" enctype='multipart/form-data'> 
      			<div id="writeForm">
      			<div class="title_content">
	      		<div class="textbox">
				  <label for="input" >작성자</label>
	 			  <input type="text" name="id" value="${loginUser}" readonly><br><br>
				</div>
				<div class="textbox">
			  		<label for="input">제목</label>
	 		 		<input type="text"  name="title" size="50"><br><br>
				</div>
	        	
				<!--<input type="file" name="image" value="장소사진" onchange="readURL(this)"><br><br>-->
				<div class="textbox">
					<label for="input">내용</label>
			  		<textarea rows="10" cols="50" name="content" placeholder="모집 분야, 일시, 희망 가격을 입력해 주세요"></textarea><br><br>
				</div>
				</div>
				<div class="addr_num">
				
	        	<img src="#" id="preview" width="300px" height="200px"><br>	      
	      			<label for="upload-file"></label>
	   				<input type="file" name="image" id="upload-file" onchange="readURL(this)">
	   			<div class="textbox">
			  		<label for="input">지역</label><br>
			  		<input type="text" id="addr1" name="addr" readonly><br><br>
			  		<input type="text" id="addr2" placeholder="주소" readonly><br><br>
			  		<input type="text" id="addr3" placeholder="상세주소"><br><br>
	 		  		<input type="hidden" id="addrResult" name="addrResult">
	 		  		<input type="hidden" id="loc_sep_name" name="loc_sep_name"><br><br>
	 		  		<input type="button" class="btn btn-info" value="우편번호 찾기" onclick="daumPost()"><br>
				</div>
	          	<br>
	          	<div class="textbox">
			  		<label for="input">모집인원</label>
			  		<input type="number" min="0" max="100" id="max_count" name="max_count" />      
				</div>
	   			</div>
	   			</div>
	        	<br>
	        	<button type="button" onclick="writeSave()" value="작성완료">작성완료</button>
	      </form>
	   </div>
	</div>
   <c:import url="../default/footer.jsp"/>
</body>
</html>  