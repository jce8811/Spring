<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상단바</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
.navbar{
	background: #000;
}
.container-fluid {
  width: 1500px;
  max-width: none !important;
}
.navbar-header{
	margin-right:200px;
}
a{
	margin-top: 7px;
	font-size: 15px;
	font-weight:bold;
	font-color:#ffffff;
}
</style>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="${path}/">지철언의 포트폴리오</a>
        </div>
        <div id="navbar">
          <ul class="nav navbar-nav">
            <li><a href="${path}/board/list.do">게시판</a></li>
          </ul>
          <ul class="nav navbar-nav">
            <li><a href="#">갤러리</a></li>
          </ul>
          <ul class="nav navbar-nav">
            <li><a href="#">회원관리</a></li>
          </ul>
          
          <div>
	          <ul class="nav navbar-nav navbar-right">
	          	<c:choose>
	          		<c:when test="${sessionScope.mid == null}">
			            <li><a href="${path}/member/step.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			      		<li><a href="${path}/member/login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	          		</c:when>
	          		<c:otherwise>
	          			<li><a href="${path}/member/info.do?mid=${mid}">${sessionScope.mid}님이 환영합니다.</a></li>
	          			<li><a href="${path}/member/logout.do"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
	          		</c:otherwise>
	          	</c:choose>
	          </ul>
          </div>
          
          
          
        </div>
      </div>
    </nav>

</body>
</html>