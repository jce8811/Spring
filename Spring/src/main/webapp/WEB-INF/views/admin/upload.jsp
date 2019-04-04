<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 업로드</title>
</head>
<style>
.container{
	margin-top:300px;
}
</style>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="/resources/nav/header.jsp"/>
<body>
<div class="container">
	<div class="col-sm-6"></div>
		<div class="col-sm-6">
		<form method="post" action="${path}/admin/productUpload.do">
			<div>
				<label for="pname">상품명</label>
				<input type="text" id="pname" name="pname">
			</div>
			<div>
				<label for="pprice">상품가격</label>
				<input type="text" id="pprice" name="pprice">
			</div>
			<div>
				<label for="pinfo">상품소개</label>
				<textarea row="5" cols="50" type="text" id="pinfo" name="pinfo"></textarea>
			</div>
			<div>
				<button type="submit" class="btn btn-default" id="upload">상품등록</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>