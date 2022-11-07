<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
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

<style type="text/css">
	*{
	
	font-family: 'Hahmlet', serif;
	}
  .wrapper{
    background-color :rgba(0, 13, 0, 0.04);
    height: 100%;
 	min-height: 100%;
 	padding-bottom: 10px;
  }
  #project{
    
  }
  .projects {
    padding-top: 6%;
  	text-align:center;
    position : relative;
    width : 100%;
    height: 50%;
 }
 .project_img{
 	position: relative;
 	
 }
  img{
  	width: 45%;
  	height: 30%;
  }
  .project_title{
  	font-size: 40px;
  	position:absolute;
  	bottom: 20%;
  	left: 30%;
  	color: white;
  }
  .project_Content{
   	font-size: 18px;
   	position:absolute;
  	bottom: 15%;
  	left: 30%;
  	color: white;
  }
  .join {
  	border : 1px solid #F9FFFF;
 	display:inline-block;
  	text-align:center;
    width : 20%;
    height: 250px;
 }
 .place {
 	border : 1px solid #F9FFFF;
 	display:inline-block;
  	text-align:center;
    width : 30%;
    height: 250px;
 }
.Join_list {
   position : relative;
   
} 
.Join_Image {
   position : relative;
   
}
.Join_Title {
   position : bottom;
}
.Place_list {
   position : relative;
   
} 
.Place_Image {
   position : relative;
   
}
.Place_Title {
   position : bottom;
}
#test{
	background-color :rgba(0, 13, 0, 0.04);
    width: 870px;
    height: 450px;
}
</style>
</head>
<body>
	
	<c:import url="default/header.jsp"/>
	<div class="wrapper">
	<div class="projects">
	<br>
		<h3>PROJECT</h3>
		<br>
		<div id="project" class="responsive">
			<c:forEach var="dto_t" items="${ticketingList}">
			<div class="project_img" align="center">
				<a href="${contextPath}/reservation/ticketView?write_no=${dto_t.write_no}&location=${dto_t.location}">
					<img id="test" src="${contextPath}/reservation/download?imageFileName=${dto_t.image}"></a>
				<div class="project_title">
					${dto_t.title }
				</div>
				<div class="project_Content">
					${dto_t.content }
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<br><br><br><br><br><br>
	<h3 align="center">JOIN MEMBER</h3>
	<div class="join">
		<br>
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
			</div>
		</c:forEach>
		</div>
	
	<br><br><br><br>
	<h3 align="center">LENT PLACE</h3>
	<div class="place">
		<br>
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
			</div>
		</c:forEach>
		</div>
		</div>
	<c:import url="default/footer.jsp"/>
	
</body>
</html>