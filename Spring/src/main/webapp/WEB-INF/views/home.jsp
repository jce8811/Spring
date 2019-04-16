<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<style>
</style>
<c:import url="/resources/nav/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
p {
   font-family: "Arial Black", sans-serif;
   font-size: 36px;
   font-weight: bold;
   color: #ffffff;
  }
.s3 { 
text-shadow: 4px 2px 2px black; 
 }
img{
	width:700px;
	margin-top:300px;
} 
</style>
<body>
<div class="container">
	<div class="col-sm-6" style="margin-top:200px;">
		<p class="s3">스프링 프레임워크를 이용한</p>	
		<p class="s3">웹사이트</p>	
	</div>
	<div class="col-sm-6">
		<img src="${path}/resources/image/main.png" alt="메인이미지">
	</div>
</div>
</body>
</html>
