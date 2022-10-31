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
<script src='<c:url value="/resources/script/js/reply.js"/>'></script>
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
#first {
	display: none;
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 30px; left: 0; right: 0;
	width: 300px;
	height: 350px;
	background-color: rgba(212, 244, 250, 0.9);
}
.view_title {
	text-align: center;
}

.Sproject{
   align : center;
   border-collapse: collapse;
}
tr {border-top: 1px solid black;}
td {padding: 5px;}
p {
	font-size: 8px;
	color: red;
 
}
</style>
</head>
<body onload="reply_data()">
	<div id="modal_wrap">
		<div id="first">
			<div style="width: 250px; margin: 0 auto; padding-top: 20px;">
				<form id="frm">
					<input type="hidden" name="write_no" value="${data.write_no}">
					<b> 답글 페이지</b>
					<hr>
					<b> 작성자 : ${loginUser}</b>
					<hr>
					<b> 연락처</b><p>*프로젝트 관리자에게만 보이는 정보입니다.</p>
					<input type="text" id="tel" name="tel" size="30" placeholder=" - 를 포함한 번호를 입력하세요 ">
					<hr>
					<b>제 목</b><br>
					<input type="text" id="title" name="title" size="30">
					<hr>
					<b>내 용</b><br>
					<textarea id="content" name="content" rows="5" cols="30"></textarea>
					<hr>
					<button type="button" onclick="rep()"> 답글 </button> &nbsp;
					<button type="button" onclick="slide_hide()"> 취소 </button>
				</form>
			</div>
		</div>	
	</div>
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
               <th>지 역</th><td colspan="2">${data.loc_sep_name}</td>
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
                  	<input type="button" value="제출하기" onclick="location.href='${contextPath}/admin/reservation/reservationForm'">
                  </c:if>
                  <input type="button" value="글목록" onclick="location.href='${contextPath}/join/joinAllListNum'">
                 <input type="button" value="답글달기" onclick="slide_click()"> &nbsp;
               <div id ="reply"></div>
               </td>
            </tr>		     
         </table>
      	
      </div>
      
      <br><br><br>
   <c:import url="../default/footer.jsp"/>

</body>
</html>
