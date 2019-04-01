<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상단바</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<style>
.navbar-header{
	margin-right:200px;
}
a{
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
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="${path}/">지철언의 포트폴리오</a>
    </div>
        <div class="collapse navbar-collapse" id="myNavbar">
           <ul class="nav navbar-nav">
            <li><a href="${path}/board/listSearch.do">글목록(페이징,검색)</a></li>
          </ul>
          <ul class="nav navbar-nav">
            <li><a href="#">회원관리</a></li>
          </ul>
          
	          <ul class="nav navbar-nav navbar-right">
	          	<c:choose>
	          		<c:when test="${sessionScope.mid == null}">
			            <li><a href="${path}/member/step.do"><span class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a></li>
        				<li><a href="${path}/member/login.do"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그인</a></li>
	          		</c:when>
	          		<c:otherwise>
	          			<li><a href="${path}/member/info.do?mid=${mid}">${sessionScope.mid}님이 환영합니다.</a></li>
	          			<li><a href="${path}/member/logout.do"><span class="glyphicon glyphicon-log-out"></span>&nbsp;로그아웃</a></li>
	          		</c:otherwise>
	          	</c:choose>
	          </ul>
          </div>
       </div>
    </nav>

</body>
</html>