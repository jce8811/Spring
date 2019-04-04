<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
</head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="/resources/nav/header.jsp"/>
<script>
	$(document).ready(function(){
		$("#pWrite").click(function(){
			location.href="${path}/product/upload.do";
		});
	});
</script>
<style>
.container {
	margin-top : 200px;
}
</style>
<body>
<div class="container">
	<h3>상품 목록</h3>
	<table class="table">
	  <thead>	
		<tr>
			<th style="width:20%">상품이미지</th>
			<th>상품명</th>
			<th>상품가격</th>
		</tr>
	  </thead>
	  	<c:forEach var="row" items="${list}">
	  		<tr>
	  			<td><a href="${path}/product/info.do/${row.pidx}">
	  					<img src="${path}/resources/productImage/${row.pimage}" width="120px" height="110px">
	  				</a>
	  			</td>
	  			<td><a href="${path}/product/info.do/${row.pidx}">${row.pname}</a></td>
	  			<td><fmt:formatNumber value="${row.pprice}" pattern="###,###,###"/></td>
	  		</tr>
	  	</c:forEach>
	</table>
	<a class="btn btn-default" id="pWrite" style="float:right;">상품등록</a>
</div>
</body>
</html>