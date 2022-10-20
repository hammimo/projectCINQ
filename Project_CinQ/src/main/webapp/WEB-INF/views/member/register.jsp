<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<style type="text/css">
.wrap {

}

</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	
   <h2>회원가입</h2>
   <div class="wrap">
	<form id="register_form" action="register" method="post">
		<table id="form" border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" id="name" name="name"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" id="nickname" name="nickname"></td>
			</tr>
			<tr>
				<th> 아이디 </th> 
				<td><input type="text" id="id" name="id" maxlength="20"></td>
			</tr>
			<tr>
				<th> 비밀번호 </th> 
				<td><input type="password" id="pw" name="pw" ></td>
			</tr>
			<tr>
				<th> 주민등록번호</th>
				<td><input type="text" id="pid" name="pid"></td>
			</tr>
			<tr>
				<th>휴대전화 번호</th>
				<td><input type="tel" id="tel" name="tel"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td> 
					 <input type="radio" name="gender" value="m" checked>남자
     				 <input type="radio" name="gender" value="f">여자
      			</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입"> &nbsp;
					<input type="reset" value="다시 작성">
				</td>
			</tr>
		</table>
	</form>
	</div>
   <c:import url="../default/footer.jsp"/>

</body>
</html>