
<!-- default/directButton -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="submit">
    <a href="/root/join/artistForm?id=${loginUser}"><input type="button" value="프로젝트생성" name="createP" ></a>
    <input type="button" value="예매하기" name="ticketing">
    <a href="/root/place/rentPlace"><input type="button" value="장소등록" name="rent"></a>
</div> 
</body>  
</html> 