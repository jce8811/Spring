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
	<div class="text-center">
			 <ul class="pagination">
			  <c:if test="${pagemaker.prev}">
			   <li><a href="list.do${pagemaker.makeQuery(pagemaker.startPage - 1)}">이전</a></li>
			  </c:if> 
			  
			  <c:forEach begin="${pagemaker.startPage}" end="${pagemaker.endPage}" var="pidx">
			   <li><a href="list.do${pagemaker.makeQuery(pidx)}">${pidx}</a></li>
			  </c:forEach>
			    
			  <c:if test="${pagemaker.next && pagemaker.endPage > 0}">
			   <li><a href="list.do${pagemaker.makeQuery(pagemaker.endPage + 1)}">다음</a></li>
			  </c:if> 
			 </ul>
		</div>
</div>
</body>
</html>