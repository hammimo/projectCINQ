<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JoinView</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
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
				alert("답글이 추가되었습니다..");
			}, error: function(){
				alert("문제 발생~");
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
					let date = new Date(redata.write_date)
					let writeDate = date.getFullYear()+"년 " + (date.getMonth()+1)+"월 "
					writeDate += date.getDate()+"일 " + date.getHours()+"시 "
					writeDate += date.getMinutes()+"분 " + date.getSeconds()+"초"
					html += "<div align='left'><b>아이디 : </b>" + redata.id + "님 / "
					html += "<b>작성일</b> : " + writeDate + "<br>"
					html += "<b>제목</b> : " + redata.title + "<br>"
					html += "<b>내용</b> : " + redata.content + "<hr></div>"
				})
				$("#reply").html(html)
			}, error: function(){
				alert("데이터를 가져올 수 없습니다~");
			}
		})
	}

	
</script>

<style type="text/css">


.Sproject{
   align : center;
   border-collapse: collapse;
}
tr {border-top: 1px solid black;}
td {padding: 5px;}
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
      <br><br>
      <h1 class="view_title" align="center">구인중인 프로젝트</h1>
      <br><br>
      <div class ="join_view" align="center">
         <table class="Sproject" >
            <tr>
               <th width="150px">작성자</th><td colspan="2">${data.id }</td>
            </tr>
            <tr>
               <th>제 목</th><td colspan="2">${data.title }</td>
            </tr>
            <tr>
               <th>내용</th>
               <td colspan="2">
                  <c:if test="${data.image == 'nan'}">
                     <b>이미지가 없습니다..</b>
                  </c:if>
                  <c:if test="${data.image != 'nan'}">
                 	<img src="${contextPath}/join/download?imageFileName=${data.image}" width="200px" height="200px">
                  </c:if>
               </td>
               <td>${data.content}</td>
            </tr>
            <tr>
				<td colspan="4" align="center">
                  <c:if test="${data.id == loginUser}">
					<input type="button" value="수정하기" onclick="location.href='${contextPath}/join/modify_form?write_no=${data.write_no}'">&nbsp;
					<input type="button" value="삭제하기" onclick="location.href='${contextPath}/join/delete?id=${data.id}&write_no=${data.write_no}&imageFileName=${data.image}'">
                  	<input type="button" value="제출하기" onclick="location.href='#'">
                  </c:if>
                  <input type="button" value="글목록" onclick="location.href='${contextPath}/join/joinAllListNum'">
                  <input type="button" value="답글보기" onclick="reply_data()">
               </td>
            </tr>		
         </table>
         <div id="modal_wrap">
			<div id="first">
				<div style="width: 250px; margin: 0 auto; padding-top: 20px;">
					<c:if test="${loginUser != null}">
					<form id="frm">
						<b> 답글 달기</b>
						<hr>
						<b> 작성자 : ${loginUser}</b>&nbsp;<br>
						<b>제 목</b>&nbsp;<input type="text" id="title" name="title" size="30">
						<hr>
						<b>내 용</b><br>
						<textarea id="content" name="content" rows="5" cols="30"></textarea>
						<hr>
						<b>연락처</b>&nbsp;<input type="text" id ="tel" name="tel" size="15">
						<hr><br>
						<button type="button" onclick="rep()"> 답글 </button> &nbsp;
						<button type="reset"> 취소 </button>
					</form>
					</c:if>
				</div>
			</div>	
		</div>
      	<div id="reply"></div>
      </div>
      
      <br><br><br>
   <c:import url="../default/footer.jsp"/>

</body>
</html>