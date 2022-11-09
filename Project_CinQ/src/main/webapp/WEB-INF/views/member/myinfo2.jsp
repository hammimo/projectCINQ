<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<title>CINQ</title>

<style type="text/css">
body {
	background-color: rgba(0, 13, 0, 0.04);
}
#titleP {
   font-family: 'Noto Sans KR', sans-serif;
}
#titleP1 {
   font-family: 'Noto Sans KR', sans-serif;
   font-size: 25px;
}
 #wrapper{
     height: 100%;
     padding-bottom: 10px;
}

#infoSection{
   float: right;
   width: 150px;
   height: 1000px;
   line-height: 100px;
   font-family: 'Hahmlet', serif;
}
li {
   font-family: 'Hahmlet', serif;
   list-style: none;
   font-size: 18px;
   line-height: 50px;
   }
button {
   margin: 0;
   padding: 0;
   position: relative;
    border: none;
    display: inline-block;
    padding: 5px 13px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 200;
    transition: 0.25s;
   box-sizing: border-box;
   margin: 5px;
   background-color: #323232;
    color: white;
    font-family: 'Hahmlet', serif;
   }
button:hover {
   letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
   background-color: #323232;
    color: white;
   }

.participating {
   position:relative;
   margin-left: 5%;
   width: 80%;
   
}
.img{
   display: inline-block;
   width: 40%;
   height:300px;
}
.info{
   display: inline-block;
   width: 40%;
   height: 300px;
   vertical-align: top;
}
.info button{
   position: relative;
   top: 30%;
}
#img_project{
   width: 90%;
   height: 90%;
   object-fit: cover;
}
#hidden_div{
   width : 100%;
   height : 500px;
}
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
   <hr>
   <div id="wrapper">
   <section id="infoSection">
   <ul>
      <li><a href="/root/member/myinfo1?id=${loginUser}">MY INFO</a></li>
      <li><a href="/root/member/myinfo2?id=${loginUser}">PROJECT</a></li>
      <li><a href="/root/member/myinfo3?id=${loginUser}">HISTORY</a></li>
    </ul>
   </section>
      <div class="participating"> 
      <br>
      <h2 align="center">내가올린 구인정보</h2>
      <br><br>
      
       <c:if test="${ProjectInfo.size() == 0}">
      <div class="img">
            <p>진행중인 프로젝트가 없습니다</p>
        </div>
      <div class="info">
            <p>진행중인 프로젝트가 없습니다</p>
        </div>
        </c:if> 
        <div class="JoinProject">
       <c:if test="${ProjectInfo.size() != 0}">    
         <c:forEach var="data" items="${ProjectInfo}">
         <div class="img">
         <a href="${contextPath}/join/joinView?write_no=${data.write_no}">
              <c:if test="${data.image == 'nan'}">
               <b>이미지가 없습니다</b>
            </c:if>
            <c:if test="${data.image != 'nan'}">
               <img id="img_project" src="${contextPath}/join/download?imageFileName=${data.image}" width="200px" height="200px">
            </c:if> 
           </a>
           </div>
         <div class="info">
              <p id="titleP1">제목 </p>
              <p id="contentP"> ${data.title }</p><br>
              <p id="titleP">내용</p>
              <p id="contentP"> ${data.content }</p><br>
               <button type="button" onclick="location.href='${contextPath}/join/modify_form?write_no=${data.write_no}'">수정하기</button>&nbsp;
               <button type="button" onclick="location.href='${contextPath}/join/delete?id=${data.id}&write_no=${data.write_no}&imageFileName=${data.image}'">삭제하기</button>
           </div>
           </c:forEach>
      </c:if> 
      </div>
   </div>
   </div>
   <div id="hidden_div"></div>
   <c:import url="../default/footer.jsp"/>
</body>
</html>