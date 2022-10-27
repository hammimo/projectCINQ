<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src='<c:url value="/resources/script/js/checkRegister.js"/>'></script>

<style type="text/css">
label {
	display:none;
}
.labelOk {
	color : green;
}
.labelFail {
	color :red;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>	
   <h2>회원가입</h2>
   <div class="wrap">
		<form name="registerForm" action="register">
		<div>
			<input type="text" name="id" id="id" onkeyup="javascript:checkID()" placeholder="ID 입력">
			<label class="labelOk" id="idLabel1" for="id"> OK </label>
			<label class="labelFail" id="idLabel2" for="id"> 아이디를 입력하세요! </label>
			<label class="labelFail" id="idLabel3" for="id"> 아이디가 중복값 입니다. </label>
		</div>
		<div>
			<input type="password" name="pw" id="pw" onkeyup="javascript:checkPw()" placeholder="비밀번호 입력">
			<label class="labelOk" id="pwLabel1" for="pw"> OK </label>
			<label class="labelFail" id="pwLabel2" for="pw"> 비밀번호를 입력하세요! </label>
		</div>
		<div>	
			<input type="password" name="pwChk" id="pwChk" onkeyup="javascript:checkPwChk()" placeholder="비밀번호 확인">
			<label class="labelOk" id="pwChkLabel1" for="pwChk"> OK </label>
			<label class="labelFail" id="pwChkLabel2" for="pwChk"> 비밀번호가 일치하지 않습니다 </label>
		</div>
		<div>	
			<input type="text" name="name" id="name"  placeholder="이름 입력" pattern="^[가-힣a-zA-Z]+$">
			<label class="labelOk" id="nameLabel1" for="name"> OK </label>
			<label class="labelFail" id="nameLabel2" for="name"> 이름을 입력하세요! </label>
		</div>
		<div>
			<input type="text" name="email" id="email" pattern="^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$" placeholder="이메일 입력">
			<label class="labelOk" id="emailLabel1" for="email"> OK </label>
			<label class="labelFail" id="emailLabel2" for="email"> 이메일을 입력하세요! </label>
		</div>
		<div>	
			<input type="text" name="tel1" value="010" size="2" readonly>
			<input type="text" name="tel2" maxlength="4" size="2" pattern="^[0-9]+$">
			<input type="text" name="tel3" maxlength="4" size="2" pattern="^[0-9]+$">
		</div>
		<div>	
			<input type="radio" name="gender" value="m" checked> 남성 &nbsp;<input type="radio" name="gender" value="f"> 여성
		</div>
		<div>	
			<input type="text" name="birthDay" maxlength="8" pattern="^[0-9]+$" placeholder="생일 입력">
		</div>
		<br>	
			<input type="submit" onclick="javascript:checkWrite()" value="회원가입">&nbsp;<input type="reset" value="다시작성">
		</form>
	</div>
   <c:import url="../default/footer.jsp"/>

</body>
</html>
