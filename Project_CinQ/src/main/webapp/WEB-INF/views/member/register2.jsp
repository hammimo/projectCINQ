<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>

</head>
<body>
   <h2>회원가입</h2>
   
   <form action="join_ok.jsp" method="post">
      이름 : <input type="text" name="name"><br/>
      아이디 : <input type="text" name="id"><br/>
      비밀번호 : <input type="password" name="pw"><br/>
      주민등록번호 : <input type="text" name="pid"><br/>
      핸드폰번호 : <input type="text" name="tel">   
      
      <br/>
      
      <input type="radio" name="gender" value="m" checked>남자
      <input type="radio" name="gender" value="f">여자
      
      <br><br>
      
      <input type="submit" value="가입">
      <input type="submit" value="로그인">
      <input type="submit" value="관리자">
      
   </form>
   

</body>
</html>