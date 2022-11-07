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

*{
	font-family: 'Hahmlet', serif;
}

.main{
	background-color: rgba(0, 0, 0, 0.04);
	align: center;
	width:100%;
	height:100vh%;
}

.subject{
	text-align:center;
	font-size:36px;
	width:65%;
	border-bottom: 3px solid black;
	margin:0 auto;
	text-align: left;
	color: #bfbfbf;
}

.view{
	width: 60%;
	margin: 0 auto;
	font-size: 28px;
}

.Sproject{
   border-collapse: collapse;
} 
tr {border-top: 1px solid black;}
td {padding: 15px;}
.custom-btn {
	width: 130px;
	height: 40px;
	padding: 10px 25px;
	border: 2px solid #000;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
}

button {
   /* margin: 0;
   padding: 0; */
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
button:hover {
	letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
	background-color: #323232;
    color: white;
	}

#i_button{
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
	
#i_button:hover{
	letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
	background-color: #323232;
	color: white;
}


</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">


function slide_click(){
	$("#first").slideDown("slow");
	$("#modal_wrap").show();
}

function slide_hide(){
	$("#first").slideUp("fast");
	$("#modal_wrap").hide();
}
function rep(){
	let form = {};
	let arr = $("#frm").serializeArray(); /* 직렬화 [{name: "", value:""}, {name: "", value:""}] */
	for(i=0 ; i<arr.length ; i++){
		form[arr[i].name] = arr[i].value;
	}
	$.ajax({
		url: "addReply",
		type: "POST",
		data: JSON.stringify(form), /* 문자열 json 타입 변경 */
		contentType: "application/json; charset=utf-8",
		success: function(){
			alert("답글 등록완료");
			slide_hide();
			reply_data();
		}, error: function(){
			alert("답글 등록 실패");
		}
	})
}

function reply_data(){
	
$.ajax({
		url: "replyData/"+${data.write_no},
		type: "GET",
		dataType: "json",
		success: function(rep){
			let html = ""
			rep.forEach(function(redata){
				var loginUser = $('#loginUser').val();
				let date = new Date(redata.write_date)
				let writeDate = date.getFullYear()+"년 " + (date.getMonth()+1)+"월 "
				writeDate += date.getDate()+"일 " + date.getHours()+"시 "
				writeDate += date.getMinutes()+"분 " + date.getSeconds()+"초"
				html += "<div align='left'><b>아이디 : </b>" + redata.id + "님 / ";
				html += "<c:if test="${data.id == loginUser}"><b>연락처</b> : " + redata.tel + "<br></c:if>";
				html += "<b>작성일</b> : " + writeDate + "<br>";
				html += "<b>제목</b> : " + redata.title + "<br>";
				html += "<b>내용</b> : " + redata.content + "<br>";
				if(redata.id == loginUser){
				html +="<button type='button' onclick='deleteReply("+redata.write_no+")'> 글삭제 </button>"
				}
				html +="</div><hr>";
			})
			$("#reply").html(html)
		}, error: function(){
			alert("데이터를 가져올 수 없습니다~");
		}
	});
	
}
function deleteReply(a){
$.ajax({
		url: "deleteReply/"+a,
		type: "GET",
		dataType: "json",
		success: function(){
			alert("댓글 삭제 완료");
			reply_data();
		},error: function(){
			alert("댓글 삭제 실패");
		}
	})

}
</script>
<style type="text/css">
#modal_wrap {
	display: none;
	position: fixed;
	z-index: 9;
	margin: 0 auto;
	top: 0; left: 0; right: 0;
	width: 100%; height: 100%;
	background-color: rgba(0, 0, 0, 0.6);
}
#modal_wrap textarea {
	resize: none;
	
}
#first {
	display: none;
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 220px; left: 0; right: 0;
	width: 500px;
	height: 450px;
	background-color: rgba(250, 250, 250, 0.9);
}
/* .view_title {
	text-align: center;
}

.Sproject{
   align : center;
   border-collapse: collapse;
}
 */

img{
	max-width: 900px;
	max-height: 550px;
}
p {
	font-size: 10px;
}
</style>
</head>
<body onload="reply_data()">
	<div class="main">
	<div id="modal_wrap">
		<div id="first">
			<div style="width: 300px; margin: 0 auto; padding-top: 20px;">
				<form id="frm">
					<input type="hidden" id="loginUser" value="${loginUser}">
					<input type="hidden" name="write_no" value="${data.write_no}">
					<h2> 답글 페이지</h2><br>
					<hr>
					<b> 작성자 : ${loginUser}</b><br>
					<hr>
					<b> 연락처</b><p>*프로젝트 관리자에게만 보이는 정보입니다.</p>
					<input type="text" id="tel" name="tel" size="40" placeholder=" - 를 포함한 번호를 입력하세요 ">
					<b>제 목</b>
					<input type="text" id="title" name="title" size="40">
					<b>내 용</b>
					<textarea id="content" name="content" rows="6" cols="40" ></textarea>
					<button type="button" onclick="rep()"> 답글 </button> &nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="slide_hide()"> 취소 </button>
				</form>
			</div>
		</div>	
	</div>
   <c:import url="../default/header.jsp"/>
      
      <h1 align="center"><b>등록된 프로젝트</b></h1>
      <br><br>
      <div class ="view" align="center">
         <table class="Sproject" >
            <tr>
               <td colspan="2"><b>작성자</b>&emsp;:&emsp; ${data.id }</td>
            </tr>
            <tr>
               <td colspan="2"><b>제 목</b>&emsp;:&emsp;${data.title }</td>
            </tr>
            <tr>
               <td colspan="2"><b>위 치</b>&emsp;:&emsp;${data.loc_name}</td>
            </tr>
            <tr>
            
           <tr>
               <td><b>사진</b></td>
               <td>
                  <c:if test="${data.image == 'nan'}">
                     <b>이미지가 없습니다..</b>
                  </c:if>
                  <c:if test="${data.image != 'nan'}">
                 	<img src="${contextPath}/join/download?imageFileName=${data.image}" width="100%" height="60%">
                  </c:if>
               </td>
            </tr>
            <tr>
            	<td colspan="2"><b>내용</b>&emsp;:&emsp; ${data.content}</td>
            	<%-- <td>${placeData.content}</td> --%>
            </tr>
            <tr>
				<td colspan="4" align="center">
                  <c:if test="${data.id == loginUser}">
					<input id="i_button" type="button" value="수정하기" onclick="location.href='${contextPath}/join/modify_form?write_no=${data.write_no}'">&nbsp;
					<input id="i_button" type="button" value="삭제하기" onclick="location.href='${contextPath}/join/delete?id=${data.id}&write_no=${data.write_no}&imageFileName=${data.image}'">
                  	<input id="i_button" type="button" value="제출하기" onclick="location.href='#'">
                  </c:if>
                  <input id="i_button" type="button" value="글목록" onclick="location.href='${contextPath}/join/joinAllListNum'">
                  <c:if test="${loginUser != null }">
                  <input id="i_button" type="button" value="답글달기" onclick="slide_click()"> &nbsp;
				  </c:if>
               <div id ="reply"></div>
               </td>
            </tr>		     
         </table>
      	
      </div>
      </div>
   <c:import url="../default/footer.jsp"/>

</body>
</html>