<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
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
<c:import url="/resources/nav/header.jsp"/>
</head>
<body>
<div class="container">
	<div class="col-sm-6">
	<c:import url="/resources/nav/sidebar.jsp"/>
	</div>
	<div class="col-sm-6">
	<form name="info" method="post" action="${path}/member/infoUpdate.do">
		<input type="hidden" name="midx" id="midx" value="${vo.midx}">
			<div class="form-group">	
				<label class="col-sm-3 col-form-label">아이디</label>	
					<input type="text" class="form-control" name="mid" value="${vo.mid}" readonly="readonly">
			</div>
			<div class="form-group">	
				<label class="col-sm-3 col-form-label">비밀번호</label>
					<input type="password" class="form-control" name="mpw" value="${vo.mpw}">
			</div>
			<div class="form-group">	
				<label class="col-sm-3 col-form-label">비밀번호 확인</label>	
					<input type="password" class="form-control" name="mpwCheck">
			</div>
			<div class="form-group">	
				<label class="col-sm-3 col-form-label">이름</label>	
					<input type="text" class="form-control" name="mname" value="${vo.mname}">
			</div>
			<div class="form-group">	
				<label class="col-sm-3 col-form-label">이메일</label>	
					<input type="email" class="form-control" name="mmail" value="${vo.mmail}">
			</div>
			<div class="form-group">	
				<label class="col-sm-3 col-form-label">가입날짜</label>	
					<fmt:formatDate value="${vo.menter}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</div>
		<button type="submit" class="btn btn-default">수정완료</button>
	</form>	
	
	</div>
</div>
</body>
</html>