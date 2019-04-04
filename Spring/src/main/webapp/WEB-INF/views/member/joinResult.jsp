<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="/resources/nav/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/progressbar.css" type="text/css">
<body>
<div class="container">
	<div class="wrap">
		<ul class="progressbar">
			<li class="active">약관동의</li>
			<li class="active">회원가입 폼</li>
			<li class="active">회원가입 완료!</li>
		</ul>	
	</div>
	<div class="col-sm-6"></div>
	<div class="col-sm-6"> 
		<div class="alert alert-success" style="margin-top:300px;">
		        축하드립니다, 성공적으로 회원가입이 되었습니다!
		</div>
	</div>
</div>
</body>
</html>