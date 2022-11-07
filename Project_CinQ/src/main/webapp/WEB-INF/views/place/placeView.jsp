
<!-- place/placeView -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlaceView</title>
<!-- <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet"> -->
<link href="${contextPath}/resources/script/css/view.css" rel="stylesheet" type="text/css">
<style type="text/css">


*{
	font-family: 'Hahmlet', serif;
}

.main{
	background-color: rgba(0, 0, 0, 0.04);
	align: center;
	width:100%;
	height:100vh%;
}

/* .subject{
	text-align:center;
	font-size:36px;
	width:60%;
	border-bottom: 3px solid black;
	margin:0 auto;
	text-align: left;
	color: #bfbfbf;
} */

.view{
	width: 50%;
	margin: 0 auto;
	font-size: 28px;
}

.Sproject{
   border-collapse: collapse;
} 
tr {border-top: 1px solid black;}
td {padding: 15px;}
.custom-btn {
	width: 130px;
	height: 40px;
	padding: 10px 25px;
	border: 2px solid #000;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
}

button {
   /* margin: 0;
   padding: 0; */
   position: relative;
    border: none;
    display: inline-block;
    padding: 8px 18px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
   box-sizing: border-box;
   margin: 20px;
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

#i_button{
	position: relative;
    border: none;
    display: inline-block;
    padding: 8px 18px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
   box-sizing: border-box;
   margin: 20px;
   background-color: #323232;
    color: white;
    font-family: 'Hahmlet', serif;
}	
	
#i_button:hover{
	letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
	background-color: #323232;
	color: white;
}

img{
	max-width: 900px;
	max-height: 550px;
}
	
</style>
</head>
<body>
   <c:import url="../default/header.jsp"/>
      <div class="main">
      
		 <h1 align="center"><b>등록된 장소</b></h1>
	  
      <br><br>
      <div class ="view" align="center">
         <table class="Sproject" >
            <tr>
               <td colspan="2"><b>작성자</b>&emsp;:&emsp; ${placeData.id }</td>
            </tr>
            <tr>
               <td colspan="2"><b>제 목</b>&emsp;:&emsp;${placeData.title }</td>
            </tr>
            <tr>
               <td colspan="2"><b>위 치</b>&emsp;:&emsp;${placeData.loc_name}</td>
            </tr>
            <tr>
               <td><b>사 진</b></td>
               <td>
                  <c:if test="${placeData.image == 'nan'}">
                     <b>이미지가 없습니다..</b>
                  </c:if>
                  <c:if test="${placeData.image != 'nan'}">
                 	<img src="${contextPath}/place/download?imageFileName=${placeData.image}" width="100%" height="60%">
                  </c:if>
               </td>
            </tr>
            <tr>
            	<td colspan="2"><b>내용</b>&emsp;:&emsp; ${placeData.content}</td>
            	<%-- <td>${placeData.content}</td> --%>
            </tr>
            <tr>
				<td colspan="4" align="center">
				<div id="reply"></div>
                  <c:if test="${placeData.id == loginUser}">
                  	<input id="i_button" type="button" value="수정하기" onclick="location.href='${contextPath}/place/placeModifyForm?write_no=${placeData.write_no}'">
					<%-- <button onclick="location.href='location.href='${contextPath}/place/placeModifyForm?write_no=${placeData.write_no}'">수정하기</button> --%>
                  </c:if> &nbsp;
                  <button onclick="location.href='${contextPath }/place/placeAllListNum'">글목록</button>
               </td>
            </tr>
         </table>
      </div>
      </div>
   <c:import url="../default/footer.jsp"/>

</body>
</html> 