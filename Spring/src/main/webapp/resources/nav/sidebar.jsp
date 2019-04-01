<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 사이드바</title>
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