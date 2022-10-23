<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage_1</title>

<style type="text/css">
    *{
        margin: 0;
    }
    section {
	float: left;
	width: 250px;
	background: gray;
	height: 700px;
	
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

.participating {
	border: 1px solid black;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<section>
		<p><a href="/root/member/myinfo1?id=${loginUser}">내 정보</a></p>
		<p><a href="/root/member/myinfo2?id=${loginUser}">진행중인 프로젝트</a></p>
	</section>
	<div class="wrap1">
	<h2>Project</h2>
    <br><br>
    
    <div class="participating"> 
    
   
 		<c:if test="${ProjectInfo == null}">
		<div class="img">
            <p>진행중인 프로젝트가 없습니다</p>
        </div>
		<div class="info">
            <p>진행중인 프로젝트가 없습니다</p>
        </div>
        </c:if> 
        
		 <c:if test="${ProjectInfo != null}">	 
		
			<div class="img">
	           <c:if test="${ProjectInfo.image == 'nan'}">
					<b>이미지가 없습니다</b>
				</c:if>
				<c:if test="${ProjectInfo.image != 'nan'}">
					<img src="${contextPath}/join/download?imageFileName=${ProjectInfo.image}" width="200px" height="200px">
				</c:if> 
	        </div>
			<div class="info">
	           <p>프로젝트 이름 : ${ProjectInfo.title }</p><br>
	           <p>프로젝트 내용 : ${ProjectInfo.content }</p><br>
	        	<input type="button" value="수정하기" onclick="location.href='${contextPath}/join/modify_form?id=${ProjectInfo.id}'">&nbsp;
				<input type="button" value="삭제하기" onclick="location.href='${contextPath}/join/delete?id=${ProjectInfo.id}&imageFileName=${ProjectInfo.image}'">
					
	        </div>
		</c:if> 
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
	<a href="/root/join/artistForm?id=${loginUser}"><input type="button" value="프로젝트생성" name="createP" ></a>
	<input type="button" value="예매하기" name="ticketing">
	<input type="button" value="대관하기" name="rent">
    </div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>