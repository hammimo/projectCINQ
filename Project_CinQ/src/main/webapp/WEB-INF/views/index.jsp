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

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script type="text/javascript">
$(document).ready(function(){
	$('.responsive').slick({
		  dots: true,
		  infinite: false,
		  speed: 300,
		  slidesToShow: 3,
		  slidesToScroll: 3,
		  responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 3,
		        slidesToScroll: 3,
		        infinite: true,
		        dots: true
		      }
		    },
		    {
		      breakpoint: 600,
		      settings: {
		        slidesToShow: 2,
		        slidesToScroll: 2
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 1,
		        slidesToScroll: 1
		      }
		    }
		    // You can unslick at a given breakpoint now by adding:
		    // settings: "unslick"
		    // instead of a settings object
		  ]
		});
	
})
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
		<div class="responsive">
		<c:forEach var="dto" items="${joinList }">
			<div class="join_list">
				<div class="Join_Image">
						<a href="${contextPath}/join/joinView?write_no=${dto.write_no}">
							<c:if test="${dto.image != 'nan'}">
								<img src="${contextPath}/join/download?imageFileName=${dto.image}">
							</c:if>
							<c:if test="${dto.image == 'nan'}">
								<img src="https://via.placeholder.com/150">
							</c:if>
						</a>
					
					<br>
				</div>
				<div class="Join_Title">
					<a href="${contextPath}/join/joinView?write_no=${dto.write_no}">${dto.title}</a>
				</div>
				<div class="Join_Content">${dto.content}</div>
			</div>
		</c:forEach>
		</div>
	</div>
	<div class="place">
		<h3>장소대여</h3>
		<div class="responsive">
		<c:forEach var="dto_P" items="${placeList }">
			<div class="Place_list">
				<div class="Place_Image">
					<c:if test="${dto_P.image != 'nan'}">
						<img src="${contextPath}/join/download?imageFileName=${dto_P.image}">
					</c:if>
					<c:if test="${dto_P.image == 'nan'}">
						<img src="https://via.placeholder.com/150">
					</c:if>
				</div>
				<div class="Place_Title">
					<a href="${contextPath}/place/placeView/?write_no=${dto_P.write_no}">${dto_P.title} </a>
				</div>
				<div class="Place_Content">${dto_P.content}</div>
			</div>
		</c:forEach>
		</div>
	</div>
	<br><br><br>
	<c:import url="default/footer.jsp"/>
</body>
</html>