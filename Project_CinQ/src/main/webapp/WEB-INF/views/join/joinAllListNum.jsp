
<!-- join/joinAllListNum -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinAllList</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<%-- <link href="${contextPath}/resources/script/css/listNum.css" rel="stylesheet" type="text/css"> --%>
<link href="${contextPath}/resources/script/css/search.css" rel="stylesheet" type="text/css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

<style type="text/css">

*{
   font-family: 'Hahmlet', serif;
}
   

.main {
   background-color: rgba(0, 0, 0, 0.04);
   align: center;
   width:100%;
   height:100%;
}

.list{
   width: 45%;
   margin: 0 auto;
}

.subject{
   font-size:36px;
   width:60%;
   border-bottom: 3px solid black;
   margin:0 auto;
   text-align: left;
   color: #bfbfbf;
}

b{
   color: black;
}
.Table{
   
   margin:0 auto;
   font-size: 20px;
} 


/*.title1 {
   background-color: #002B22;
   color: white;
}*/



#content_image:hover {
   background-color: rgba();
}

#content_image:hover > a{
   cursor: pointer;
}

#content_id{
   vertical-align: top;
   text-align: left;
   font-size: 20px;
}

#content_title  {
   vertical-align: top;
   text-align: left;
   font-size: 30px;
   
   
}
#content_title a { 
   font-family: 'Spoqa Han Sans Neo', 'sans-serif'; 
   font-weight: bold;
   color:#1B382F
}

#content_loc{
   vertical-align: top;
   text-align: left;
   font-weight: bold;
   font-size: 20px;
   
}

#content_loc_name{
   vertical-align: top;
   text-align: left;
   font-weight: bold;
   font-size: 24px;
}
#content_con{
   vertical-align: bottom;
   text-align: left;
   
}

td {
   padding: 5px;
   text-align: center;
   
}
#content_td{
   
}

a {
   text-decoration: none;
}

a:link {
   color: black;
}

a:visited {
   color: #000069;
}




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
img{
	max-width: 450px;
	min-width: 450px;
	max-height: 300px;
}

.none{
	height: 100vh;
}
</style>
</head>
<body>
    <c:import url="../default/header.jsp"/>
    <%-- <input type="hidden" name="join" value="${title }">--%>
    <div class="main">
    <br>
    <div class="subject" >
      <b>등록된 구인 목록</b> &ensp; Join List
   </div>
       <form action="joinSearchList" method="post" enctype='multipart/form-data'>
           <div class="search-box">
             <input type="text" class="search-txt" name="title" placeholder="글 제목으로 검색"> 
                <a class="search-btn" href="#"> <i class="fas fa-search"></i></a>
          </div>
       </form>
    <br><br>
    <!-- table 부분 -->
    <div class="list">
    <table class="Table">
       <tr height="80px"></tr>
        <c:if test="${joinList.size() == 0}">	
                <tr>
                	<div class="none">    
                    	<th colspan="2">등록된 글이 없습니다</th>
                	</div>
                </tr>   
        </c:if>
         <c:forEach var="dto" items="${joinList}">
            <tr height="50px">
               <td id="content_loc">${dto.loc_sep_name}</td>
               <c:if test="${dto.image == 'nan'}">
                    <td id="content_image" rowspan="4">
                        <b>이미지가 없습니다..</b>
                     </td>
                </c:if>
                <c:if test="${dto.image != 'nan'}">
                    <td id="content_image" rowspan="4">
                    <a href="/root/join/joinView?write_no=${dto.write_no}"><img id="image" src="${contextPath}/join/download?imageFileName=${dto.image}"></a>
                     </td>
                </c:if>
            </tr>
        
            <tr id="content_row">
                <td id="content_title"><a href="/root/join/joinView?write_no=${dto.write_no}">제목 : ${dto.title}</a></td>
            </tr>
            <tr id="content_row">
               <td id="content_loc_name">상세 위치 : ${dto.loc_name}</td>
            </tr>
            <tr id="content_row">
            <td id="content_con">내용 : ${dto.content}</td>
         </tr>
          <tr height="50px"></tr>
         </c:forEach>
         <tr>
            <td colspan="6" align="center">
               <c:forEach var="num" begin="1" end="${repeat}">
                  <button onclick="location.href='joinAllListNum?num=${num}'">${num}</button>
               </c:forEach>
            </td>
        </tr>
        <tr>
           <td colspan="6">
               <button onclick="location.href='${contextPath }/join/artistForm'">글작성</button>
            </td>
        </tr>   
    </table>
    </div>
    </div>
    <c:import url="../default/footer.jsp"/>
</body>
</html>