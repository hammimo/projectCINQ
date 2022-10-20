<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--  -->
<!DOCTYPE html>
<html><!--  -->
<head>
<meta charset="UTF-8">
<title>mypage_2</title>
    <style type="text/css">
        *{
            margin: 0;
        }
        .wrap2{
            width: auto;
	        margin: auto;
	        text-align: center;
        }
        .memberInfo {
            border : 1px solid black;
            margin : 0 auto;
            width : 700px;
        }
        .booking {
            border : 1px solid black;	
            margin : 0 auto;
            width : 700px;
        }
        .submit {
            margin: 0 auto;
            width: 250px;
        }
        </style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap2"> 
        <br><br>
	<h2>Member Introduce</h2>
    <br><br>
	<table class="memberInfo">
        <th>Information</th>
        <br>
		<tr>
            <td>ID</td><td>UserA</td>
		</tr>
        <tr>
            <td>NAME</td><td>UserA</td>
        </tr>
        <tr>
            <td>INTRODUCE</td><td>HELLO</td>
        </tr>
	</table>
    <br><br>
	<table class="booking"> 
		<th>Information</th>
		<br>
		<tr>
            <td>DATA1</td><td>영화관람</td>
		</tr>
        <tr>
            <td>DATA2</td><td>미술관</td>
        </tr>
        <tr>
            <td>DATA3</td><td>공연관람</td>
        </tr>
	</table>
	</div>
    <br><br><br>
    <div class="submit">
	<input type="button" value="프로젝트생성" name="createP">
	<input type="button" value="예매하기" name="ticketing">
	<input type="button" value="대관하기" name="rent">
    </div>
    <c:import url="../default/footer.jsp"/>
</body>
</html>