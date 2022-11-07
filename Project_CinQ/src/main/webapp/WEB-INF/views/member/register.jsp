<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINQ</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src='<c:url value="/resources/script/js/checkRegister.js"/>'></script>
<link href="${contextPath}/resources/script/css/login.css" 
	  rel="stylesheet" type="text/css">	  
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <div class="login-wrap">
        <div class="login-html">
          <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign-up</label>
          <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign-in</label>
          <div class="login-form">  
               <div class="sign-up-htm">
                  <form action="${contextPath }/member/user_check" method="post" autocomplete="off">
                    <div class="group">
                         <label for="id" class="label">Id</label>
                         <input id="id1" name="id" type="text" class="input">
                    </div>
                    <div class="group">
                         <label for="pw" class="label">Password</label>
                         <input id="pw1" name="pw" type="password" class="input" data-type="password">
                         <br>
                    </div>
                    <div class="group">
                         <input type="submit" class="button" value="Sign In">
                    </div>
                    <div class="hr"><br></div>
                 </form>
               </div>
               <div class="sign-in-htm">
                  <form name="registerForm" action="register" method="post" autocomplete="off">
                     <div class="group">
                        <label for="id" class="label">Id</label>
                        <input id="id" name="id" type="text" class="input" onkeyup="javascript:checkID()" onblur="javascript:checkID()">
                         <label class="labelOk" id="idLabel1" for="id" >OK</label>
                         <label class="labelFail" id="idLabel2" for="id"> 아이디를 입력하세요! </label>
                     <label class="labelFail" id="idLabel3" for="id"> 아이디가 중복값 입니다. </label>
                    </div>
                    <div class="group">
                         <label for="pw" class="label">Password</label>
                         <input id="pw" name="pw" type="password" class="input" onkeyup="javascript:checkPw()">
                         <label class="labelOk" id="pwLabel1" for="pw"> OK </label>
                     <label class="labelFail" id="pwLabel2" for="pw"> 비밀번호를 입력하세요! </label>
                    </div>
                    <div class="group">
                         <label for="pwChk" class="label">Repeat Password</label>
                         <input id="pwChk" name="pwChk" type="password" class="input" onkeyup="javascript:checkPwChk()">
                         <label class="labelOk" id="pwChkLabel1" for="pwChk"> OK </label>
                     <label class="labelFail" id="pwChkLabel2" for="pwChk"> 비밀번호가 일치하지 않습니다 </label>
                    </div>
                    <div class="group">
                         <label for="name" class="label">name</label>
                         <input id="name" name="name" type="text" class="input" onkeyup="javascript:checkName()"> <!-- pattern="^[가-힣a-zA-Z]+$" -->
                         <label class="labelOk" id="nameLabel1" for="name"> OK </label>
                     <label class="labelFail" id="nameLabel2" for="name"> 이름을 입력하세요! </label>
                    </div>
                    <div class="group">
                         <label for="email" class="label">Email Address</label>
                         <input id="email" name="email" type="text" class="input" onkeyup="javascript:checkEmail()"> <!--pattern="^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$"  -->
                         <label class="labelOk" id="emailLabel1" for="email"> OK </label>
                     <label class="labelFail" id="emailLabel2" for="email"> 이메일을 입력하세요! </label>
                    </div>
                    <div class="group">
                         <label for="tel" class="label">Tel number</label>
                         <input type="text" id="tel1" name="tel1" class="tel" value="010" size="2" readonly>
                     <input type="text" id="tel2" name="tel2" class="tel" maxlength="4" size="2"><!--pattern="^[0-9]+$"  -->
                     <input type="text" id="tel3" name="tel3" class="tel" onkeyup="javascript:checkTel()" maxlength="4" size="2" ><!--pattern="^[0-9]+$"  -->
                     <input type="hidden" id = "tel" name="tel">
                    </div>
                    <div class="group">
                         <label for="gender" class="label">Gender</label>
                         <input type="radio" name="gender" value="m" checked> 남성 &nbsp;<input type="radio" name="gender" value="f"> 여성
                    </div>
                    <div class="group">
                         <label for="birthday" class="label">생년월일</label>
                         <input id="birthday" name="birthday" type="text" class="input" onkeyup="javascript:checkBd()" maxlength="8"> <!--pattern="^[0-9]+$"  -->
                         <label class="labelOk" id="bdLabel1" for="birthDay"> OK </label>
                     <label class="labelFail" id="bdLabel2" for="birthDay"> 생일을 입력하세요! </label>
                    </div>
                    
                    <div class="group">
                         <input type="button" class="button" value="Sign Up" onclick="checkWrite()">&nbsp;<input type="reset" class="button" value="Reset">
                    </div>
                    <div class="hr"></div>
                    <div class="foot-lnk">
                         <label for="tab-1">Already Member? </label> 
                    </div>
                 </form>
            </div>
          </div>
        </div>
   </div>
   <c:import url="../default/footer.jsp"/>
</body> 
</html>