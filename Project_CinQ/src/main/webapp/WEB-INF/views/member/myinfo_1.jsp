<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage_1</title>
<style type="text/css">
    *{
        margin: 0;
    }
    .wrap1{
        width: 100%;
	    margin: auto;
	    text-align: center;
    }
    .img {
        width: 250px;
        height: 250px;
        margin: 0 auto;
        border: 1px solid black;
        display: inline-block;
    }
    .info{
        border: 1px solid black;
        margin: 0 auto;
        height: 250px;
        width: 700px;
        display: inline-block;
    }
    .submit {
            margin: 0 auto;
            width: 250px;
        }
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap1">
	<h2>Project</h2>
    <br><br>
    <div class="participating"> 
		<div class="img">
            데이터가 들어오면 이미지
        </div>
		<div class="info">
            데이터가 들어오면 설명
        </div>
	</div>
    <br>
	<div class="endParticipating"> 
        <h2>Participation is over</h2>
        <br>
        <div class="img">
            데이터가 들어오면 이미지
        </div>
        <div class="info">
            데이터가 들어오면 설명
        </div>
	</div>
    </div>
    <br><br>
    <div class="submit">
	<input type="button" value="프로젝트생성" name="createP">
	<input type="button" value="예매하기" name="ticketing">
	<input type="button" value="대관하기" name="rent">
    </div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>