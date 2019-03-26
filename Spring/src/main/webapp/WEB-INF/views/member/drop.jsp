<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
.container{
	margin-top: 200px;
	width: 1500px;
	max-width: none !important;
}
</style>
<script>
$(document).ready(function(){
	$('#dropMember').click(function(){
		if(confirm("탈퇴하시겠습니까?")){
			document.drop.action = "${path}/member/dropMember.do";
			document.drop.submit();
		}
	});
});
</script>
<c:import url="/resources/nav/header.jsp"/>
</head>
<body>
<div class="container">
	<div class="col-sm-6">
		<c:import url="/resources/nav/sidebar.jsp"/>
	</div>
	<div class="col-sm-6">
	<form name="drop" method="post">
		<div class=”panel panel-default“>
			<div class=”panel-heading“>비밀번호 확인</div>
			<div class=”panel-body“>
				<input type="password" class="form-control" name="mpw" autocomplete="off" placeholder="비밀번호">
			</div>
		</div>
	<input type="button" class="btn btn-default" id="dropMember" value="탈퇴">
			<div style="color:red;">${msg}</div>
	</form>
	</div>
</div>
</body>
</html>