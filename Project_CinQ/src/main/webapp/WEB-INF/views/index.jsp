<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>index.jsp</title>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script type="text/javascript">
$(document).ready(function(){
	$('.responsive').slick({
		  dots: true,
		  infinite: true,
		  autoplay: true,
	      autoplaySpeed: 3000,
		  speed: 300,
		  slidesToShow: 1,
		  slidesToScroll: 1,
		  responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 3,
		        slidesToScroll: 3,
		        infinite: true,
		        dots: true,
		        arrows: false
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
<link href="${path}/resources/css/test.css" rel="stylesheet"/>

<style type="text/css">
	*{
	background-color: 	#bebebe;
	font-family: 'Hahmlet', serif;
	}
  .projects {
  	text-align:center;
    position : relative;
    width : 87%;
    height: 500px;
    background-color : 	#bebebe;
 }
  .pre_projects {
  	float: left;
    display: inline-block;
  	text-align:center;
    width : 45%;
    height: 250px;
    background-color : 	#bebebe;
 }
  .place {
  	display: inline-block;
  	text-align:center;
    width : 43%;
    height: 250px;
    background-color : 	#bebebe;
 }
 img {
    width: 450px;
    height: 150px;
 }
 #test {
 	width: 800px;
 	height: 350px;
 }
 
.Join_list {
   position : relative;
   float : right;
   
} 
.Join_Image {
   position : relative;
   left: 160px;
   
}
.Join_Title {
   position : bottom;
}
.Place_list {
   position : relative;
   float : right;
   
} 
.Place_Image {
   position : relative;
   left: 160px;
   
}
.Place_Title {
   position : bottom;
}
#wrapper{
	height: auto;
 	 min-height: 100%;
 	 padding-bottom: 10px;
}
</style>
</head>
<body>
	
	<c:import url="default/header.jsp"/>
	<c:import url="default/aside.jsp"/>
	<div class="wrapper">
	<div class="projects">
	<br>
		<h3>PROJECT</h3>
		<br>
		<img id="test" src=https://images.unsplash.com/photo-1536924940846-227afb31e2a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1166&q=80>
	</div>
	<section>
	<div class="pre_projects">
		<h3>JOIN MEMBER</h3>
		<br>
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
					
				</div>
				
				<div class="Join_Title">
					<a href="${contextPath}/join/joinView?write_no=${dto.write_no}">${dto.title}</a>
				</div>
				<!--  <div class="Join_Content">${dto.content}</div>-->
			</div>
		</c:forEach>
		</div>
	</div>
	<div class="place">
		<h3>LENT PLACE</h3>
		<br>
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
				<!-- <div class="Place_Content">${dto_P.content}</div> -->
			</div>
		</c:forEach>
		</div>
	</div>
	
	</section>
	</div>
	<c:import url="default/footer.jsp"/>
</body>
</html>