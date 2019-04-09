<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 목록</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
		<c:forEach var="row" items="${list}">
		<div style="margin-bottom:20px;">
			<span style="font-size:22px;">${row.mid}</span>
			<span style="font-size:13px;">(<fmt:formatDate value="${row.rdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)</span>
		</div>
		<div>${row.rcontent}</div>
			<c:if test="${sessionScope.mid == row.rwriter}">
				<button type="button" id="modify">수정</button>
			</c:if>
		<hr>	
		</c:forEach>
</div>
</body>
</html>