<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>index.jsp</title>
<script type="text/javascript" src="../jquery_library/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- script -->
<script type="text/javascript">
   $(document).ready(function(){
      $(".slider").bxSlider({
         auto : true,
         autoControls : true,
         stopAutoOnClick: true,
         pager: true,
         slideWidth : 600
      });
   });
</script>
<style type="text/css">

  .projects {
    position : relative;
    width : 100%;
    height: 200px;
    border : 1px solid black;
    background-color : gray;
 }
  .pre_projects {
     position : relative;
    width : 100%;
    height: 300px;
    border : 1px solid black;
    background-color : gray;
 }
  .place {
     position : relative;
    width : 100%;
    height: 200px;
    border : 1px solid black;
    background-color : gray;
 }
 img {
    width: 150px;
    height: 150px;
 }
 
.Join_list {
   position : relative;
   border : 1px solid black;
   float : right;
   
} 
.Join_Image {
   position : relative;
   float : left;
}
.Join_Title {
   position : relative;
}
.Join_Content {
   position : relative;
}

.Place_list {
   position : relative;
   border : 1px solid black;
   float : right;
   
} 
.Place_Image {
   position : relative;
   float : left;
}
.Place_Title {
   position : relative;
}
.Place_Content {
   position : relative;
}
</style>
</head>
<body>
	<c:import url="default/header.jsp"/>
	<div class="projects">
		<h3>진행중인 프로젝트</h3>
	</div>
	<div class="pre_projects">
		<h3>구인중인 프로젝트</h3>
		<div class="slider">
		<c:forEach var="dto" items="${joinList }">
			<div class="join_list">
				<div class="Join_Image">
					<a href="${contextPath}/join/joinView?title=${dto.title}"><img src="${contextPath}/join/download?imageFileName=${dto.image}"></a><br>
				</div>
				<div class="Join_Title">
					<a href="${contextPath}/join/joinView?title=${dto.title}">${dto.title}</a>
				</div>
				<div class="Join_Content">${dto.content}</div>
			</div>
		</c:forEach>
		</div>
	</div>
	<div class="place">
		<h3>장소대여</h3>
		<div class="slider">
		<c:forEach var="dto_P" items="${placeList }">
			<div class="Place_list">
				<div class="Place_Image">
					<img src="${contextPath}/join/download?imageFileName=${dto_P.image}"><br>
				</div>
				<div class="Place_Title">
					<a href="#">${dto_P.title}</a>
				</div>
				<div class="Place_Content">${dto_P.content}</div>
			</div>
		</c:forEach>
		</div>
	</div>
	<br><br><br>
	<a href="/root/join/joinAllListNum">게시판</a>
	<c:import url="default/footer.jsp"/>
</body>
</html>