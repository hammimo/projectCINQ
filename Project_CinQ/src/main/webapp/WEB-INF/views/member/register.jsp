<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>

</head>
<body>
	<c:import url="../default/header.jsp"/>
	
   <h2>회원가입</h2>
   
<!--    <form id="register_form" action="register" method="post">
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
      
   </form> -->
   
   <div class="wrap">
	<form id="register_form" action="register" method="post">
		<table id="form" border="1">
			<tr>
				<th> 아이디 </th> 
				<td><input type="text" id="id" name="id" maxlength="20"></td>
			</tr>
			<tr>
				<th> 비밀번호 </th> 
				<td><input type="password" id="pw" name="pw" ></td>
			</tr>
			<tr>
				<th> 주소 </th> 
				<!-- <td><input type="text" id="addr" name="addr"></td> -->
				<td>
					<input type="text" id="addr1" name="addr" placeholder="우편번호" readonly>
					<input type="button" class="btn btn-info" value="우편번호 찾기" onclick="daumPost()"><br>
					<input type="text" id="addr2" placeholder="주소" readonly><br>
					<input type="text" id="addr3" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<!-- <td colspan="2"><input type="submit" value="회원가입"></td> -->
				<td colspan="2" align="center">
					<input type="button" onclick="register()" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
	</div>
   <c:import url="../default/footer.jsp"/>

</body>
</html>