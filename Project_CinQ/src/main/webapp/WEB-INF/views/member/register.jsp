<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<script type="text/javascript">

function register_check(){
	if(register_form.name.value.trim() == ""){
		alert('이름을 입력하세요');
		name.focus();
		return;
	}	
	
	/* 아이디 검사 */
	if(register_form.id.value.trim() == ""){
		//db에서 중복검사도 해야됨
		alert('아이디를 입력하세요');
		id.focus();
		return;
	}
	/* 닉네임 검사 */
	if(register_form.nickname.value.trim() == ""){
		//db에서 중복검사도 해야됨
		alert('닉네임를 입력하세요');
		nickname.focus();
		return;
	}
	
	
	/* 패스워드 검사 */
	if(register_form.pw.value.trim() == ""){
		alert('패스워드를 입력하세요');
		register_form.pw.focus();
		return;
	} else {
		if(register_form.pw.value != pw2.value){
			alert('패스워드확인 오류입니다.');
			pw2.value="";
			pw.focus();
			return;
		}
		
	}
	/* 전화번호 검사 */
	if(register_form.tel2.value.trim() == ""){
		alert('전화번호를 입력하세요');
		tel.focus();
		return;
	}else {
	
		
		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();
		var telResult = tel1 + tel2 + tel3;
		$("#telResult").val(telResult);
		
	}
	register_form.submit();	
	
}

</script>
<style>
.wrap {
	width: 1000px;
	margin: auto;
	text-align: center;
}
.notice {
	font-size: 8px;
	color: gray;
}
.joinagree {
	width: 100px;
	height: 200px;	
	font-size: 8px;
	
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<h1 align="center">회원 가입</h1>
	<div class="wrap">
		
	</div>

   <c:import url="../default/footer.jsp"/>

</body>
</html>