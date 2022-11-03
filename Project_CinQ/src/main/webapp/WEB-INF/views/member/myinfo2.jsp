<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<title>mypage_1</title>

<style type="text/css">
    *{
        margin: 0;
        background-color: 	#bebebe
    }
    section {
	float: right;
	width: 200px;
	background: gray;
	height: 700px;
	line-height: 100px;
	font-size: 24px;
	font-family: 'Hahmlet', serif;
	text-align: center;
	background-color: 	#bebebe;
	
	}
	img {
		width: 100%;
		height: 100%
		object-fit: cover;
	}
    
    .img {
    	
        width: 35%;
        height: 30%;
        display: inline-block;
    }
    .wrap{
    	height: auto;
 		min-height: 100%;
 	 	padding-bottom: 10px;
    }
    .info{
    	margin-left:20px;
    	width: 40%;
    	height: 30%;
        display: inline-block;
        text-align: center;
    }
    .submit {
            margin: 0 auto;
            width: 250px;
        }
    

.participating {
	padding-left: 50px;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<section>
		<p><a href="/root/member/myinfo1?id=${loginUser}">MY INFO</a></p>
		<p><a href="/root/member/myinfo2?id=${loginUser}">PROJECT</a></p>
	</section>
	<br>
	<div class="wrap">
	<h2 align="center">Project</h2>
    <br><br>
    
    <div class="participating"> 
    
   
 		<c:if test="${ProjectInfo.size() == 0}">
		<nav class="img">
            <p>진행중인 프로젝트가 없습니다</p>
        </nav>
		<nav class="info">
            <p>진행중인 프로젝트가 없습니다</p>
        </nav>
        </c:if> 
        
		 <c:if test="${ProjectInfo.size() != 0}">	 
			<c:forEach var="data" items="${ProjectInfo}">
			<nav class="img">
			<a href="${contextPath}/join/joinView?write_no=${data.write_no}">
	           <c:if test="${data.image == 'nan'}">
					<b>이미지가 없습니다</b>
				</c:if>
				<c:if test="${data.image != 'nan'}">
					<img src="${contextPath}/join/download?imageFileName=${data.image}" width="200px" height="200px">
				</c:if> 
	        </a>
	        </nav>
			<nav class="info">
	           <p>프로젝트 이름 : ${data.title }</p><br>
	           <p>프로젝트 내용 : ${data.content }</p><br>
	        	<input type="button" value="수정하기" onclick="location.href='${contextPath}/join/modify_form?write_no=${data.write_no}'">&nbsp;
				<input type="button" value="삭제하기" onclick="location.href='${contextPath}/join/delete?id=${data.id}&write_no=${data.write_no}&imageFileName=${data.image}'">	
	         	<input type="button" value="제출하기" onclick="location.href='#'">
	        </nav>
	        </c:forEach>
		</c:if> 
	</div>
    <br>
	<div class="endParticipating"> 
        <h2 align="center">Participation is over</h2>
        <br>
        <nav class="img">
            데이터가 들어오면 이미지
        </nav>
        <nav class="info">
            데이터가 들어오면 설명
        </nav>
	</div>
    <br><br>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>