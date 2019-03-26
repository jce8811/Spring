<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.container{
	margin-top: 200px;
	width: 1500px;
	max-width: none !important;
}
</style>
</head>
<c:import url="/resources/nav/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<body>
<div class="container">
	<div class="col-sm-4"></div>
		<div class="col-sm-6">
				<%-- 아이디 찾기 성공했을 때 --%>
				<c:choose>
					<c:when test="${mid != null }">
						<p>아이디 찾기</p>
						<p>회원님의 아이디는<strong>${mid}</strong>입니다.</p>
						
						<a href="${path}/member/findPw.do" class="btn btn-default">비밀번호찾기</a>
						<a href="${path}/member/login.do" class="btn btn-default">로그인하기</a>
					</c:when>
				<%-- 아이디 찾기 성공했을 때 --%>
					<c:otherwise>
						<%-- 아이디 찾기를 실패했을 때 --%>
						<p>아이디 찾기</p>
						<p>아이디를 찾을 수 없습니다</p>
						<a href="${path}/member/findId.do" class="btn btn-default">아이디찾기</a>
						<%-- 아이디 찾기를 실패했을 때 --%>
					</c:otherwise>
				</c:choose>
		</div>
	<div class="col-sm-4"></div>	
</div>	
</body>
</html>