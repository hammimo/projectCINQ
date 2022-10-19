
<!-- login.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.login {
	text-align: center;
	height: 300px;
}
</style>
</head>
<body>
	<!-- <c:import url="../default/header.jsp"/>  -->
	<div class="wrap login">
		<h1>로그인</h1>
		<br>
		<form action="login" method="post">
			<input type="text" name="id" placeholder="input id"><br><br>
			<input type="password" name="pw" placeholder="input password"><br><br>
			<input type="submit" value="login"> &nbsp; 
			<button>회원가입</button>
		</form>
	</div>
	<!--  <c:import url="../default/footer.jsp"/> -->
</body>
</html>
