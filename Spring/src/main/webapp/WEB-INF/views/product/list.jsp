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
			location.href="${path}/admin/upload.do";
		});
	});
</script>
<style>
.container {
	margin-top : 150px;
}
div.pthumbimg img { 
width:200px; height:200px; 
}
div.pinfo { 
padding:10px 0; text-align:center; 
}
div.pinfo a { 
color:#000; 
}
</style>
<body>
<div class="container">
	<h3>상품 목록</h3>
	<ul>
	  	<c:forEach var="row" items="${list}">
	  			<li style="list-style: none; display:inline-block; margin:10px;">
	  				<hr>
		  			<div class="pthumbimg">
		  			<a href="${path}/product/info.do/${row.pidx}"><img src="${path}/${row.pthumbimg}"/></a>
		  			</div>
		  			<hr>
		  			<div class="pinfo">
		  			<a href="${path}/product/info.do/${row.pidx}">${row.pname}</a>
		  			<h4><fmt:formatNumber value="${row.pprice}" pattern="###,###,###"/> 원</h4>
		  			</div>
	  			</li>
	  	</c:forEach>
	 </ul>	
	<a class="btn btn-default" id="pWrite" style="float:right;">상품등록</a>
</div>
</body>
</html>