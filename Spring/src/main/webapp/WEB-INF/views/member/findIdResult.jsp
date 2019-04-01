<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<style>
.container{
	margin-top: 200px;
}
</style>
</head>
<c:import url="/resources/nav/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<body>
<div class="container">
	<div class="col-sm-4"></div>
		<div class="col-sm-6" style="margin-top:50px;">
				<%-- 아이디 찾기 성공했을 때 --%>
				<c:choose>
					<c:when test="${mid != null }">
						<h3>아이디 찾기</h3>
						<div>
						<p>회원님의 아이디는<strong>${mid}</strong>입니다.</p>
						<a href="${path}/member/findPw.do" class="btn btn-default">비밀번호찾기</a>
						<a href="${path}/member/login.do" class="btn btn-default">로그인하기</a>
						</div>
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