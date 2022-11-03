<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src='<c:url value="/resources/script/js/checkRegister.js"/>'></script>
<style type="text/css">
.labelOk {
   color : #323232;
}
.labelFail {
   color :	#dcdcdc;
}
body{
  margin:0;
  color:#6a6f8c;
  background:#bebebe;
  font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
  display:flex;
  justify-content: center;
  width:100%;
  margin:auto;
  /* max-width:525px; */
  min-height:1100px;
  position:relative;
  background:#bebebe;
}
.login-html{
  border:none;
  border-radius:25px;
  padding:15px 20px;
  width:525px;
  height:90%;
  position:absolute;
  padding:70px 70px 50px 70px;
  background:#a09e9e;
}
.login-html .sign-in-htm,
.login-html .sign-up-htm{
  top:0;
  left:0;
  right:0;
  bottom:0;
  position:absolute;
  transform:rotateY(180deg);
  backface-visibility:hidden;
  transition:all .4s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
  display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
  text-transform:uppercase;
}
.login-html .tab{
  font-size:22px;
  margin-right:15px;
  padding-bottom:5px;
  margin:0 15px 10px 0;
  display:inline-block;
  border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
  color:#fff;
  border-color:#1161ee;
}
.login-form{
  min-height:345px;
  position:relative;
  perspective:1000px;
  transform-style:preserve-3d;
}
.login-form .group{
  margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
  width:100%;
  color:#fff;
  display:block;
  
}
.login-form .group .input,
.login-form .group .button{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:rgba(255,255,255,.1);
  

}
.login-form .group input[data-type="password"]{
  text-security:circle;
  -webkit-text-security:circle;
}
.login-form .group .label{
  color:#aaa;
  font-size:12px;
}
.login-form .group .button{
  background:#323232;
  font-size:14px;
  text-align : center;
}
.login-form .group .tel{
  border:none;
  border-radius:25px;
  padding:15px 20px;
  background:rgba(255,255,255,.1);
  text-align : center;
  color:#fff;
}
.login-form .group label .icon{
  width:15px;
  height:15px;
  border-radius:2px;
  position:relative;
  display:inline-block;
  background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
  content:'';
  width:10px;
  height:2px;
  background:#fff;
  position:absolute;
  transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
  left:3px;
  width:5px;
  bottom:6px;
  transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
  top:6px;
  right:0;
  transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
  color:#fff;
}
.login-form .group .check:checked + label .icon{
  background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
  transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
  transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
  transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
  transform:rotate(0);
}

.hr{
  height:2px;
  margin:60px 0 50px 0;
  background:rgba(255,255,255,.2);
}
.foot-lnk{
  text-align:center;
}
</style>
</head>
<body>
	<br><br><br>
   <c:import url="../default/header.jsp"/>
   <br><br><br>
   <div class="login-wrap">
        <div class="login-html">
          <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign-up</label>
          <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign-in</label>
          <div class="login-form">
             
               <div class="sign-up-htm">
                  <form action="${contextPath }/member/user_check" method="post">
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
                  <form name="registerForm" action="register" method="post">
                     <div class="group">
                        <label for="id" class="label">Id</label>
                        <input id="id" name="id" type="text" class="input" onkeyup="javascript:checkID()">
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
                         <input type="submit" class="button" value="Sign Up">&nbsp;<input type="reset" class="button" value="Reset">
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