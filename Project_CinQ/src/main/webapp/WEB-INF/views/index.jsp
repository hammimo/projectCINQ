<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>index.jsp</title>
<style type="text/css">

 .projects {
 	width : 100%;
 	height: 200px;
 	border : 1px solid black;
 	background-color : gray;
 }
  .pre_projects {
 	width : 100%;
 	height: 200px;
 	border : 1px solid black;
 	background-color : gray;
 }
  .place {
 	width : 100%;
 	height: 200px;
 	border : 1px solid black;
 	background-color : gray;
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
	</div>
	<div class="place">
		<h3>장소대여</h3>
	</div>
	<c:import url="default/footer.jsp"/>
</body>
</html>