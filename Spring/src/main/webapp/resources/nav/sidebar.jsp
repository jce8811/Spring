<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 사이드바</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
.container-fluid {
  width: 1500px;
  max-width: none !important;
}
</style>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<body>
<div class="col-sm-6">
	<hr class="hr1">
	<h3><font color="#000000" size="4" face="맑은 고딕" style="padding-left: 50px;">My Page</font></h3>
	<br>
		<ul class="nav nav-pills nav-stacked">
			  <li><a href="${path}/member/info.do?mid=${mid}" target="_self"><font color="#000000">회원정보 수정</font></a></li>
			  <li><a href="${ContextPath}/controller/IntroGuideServlet.do" target="_self"><font color="#000000">내글 보기</font></a></li>
			  <li><a href="${path}/member/drop.do"><font color="#000000">회원탈퇴</font></a></li>
		</ul>
	<hr class="hr1">
</div>		
</body>
</html>