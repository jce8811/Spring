<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트(관리자)</title>
</head>
<c:import url="/resources/nav/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script>
$(document).ready(function(){
	$("#bDelete").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			document.form1.action = "${path}/admin/boardDelete.do?bidx=${row.bidx}";
			document.form1.submit();
		}
	});
});
</script>
<style>
a:link { 
color: black; text-decoration: none;
}
a:visited{ 
color: black; text-decoration: none;
}
a:hover { 
color: black; text-decoration: none;
}
</style>
<body>
<div class="container" style="margin-top:200px;">
	<div class="col-sm-4">
	<c:import url="/resources/nav/sidebar.jsp"/>
	</div>
	<div class="col-sm-8" style="margin-top:20px;">
	<h3>게시물 목록</h3>
	<form id="form1" name="form1" method="post">
	<table class="table">
		<thead>
				<tr>
					<th style="width:10%">번호</th>
					<th style="width:30%">제목</th>
					<th style="width:20%">작성자</th>
					<th style="width:30%">작성일</th>
					<th style="width:10%">삭제유무</th>
				</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.bidx}</td>
				<c:choose>
					<c:when test="${row.bvalue == 'y'}">
						<td>${row.btitle}</td>
					</c:when>
					<c:otherwise>
						<td>${row.btitle}</td>
					</c:otherwise>
				</c:choose>
				<td>${row.bwriter}</td>
				<td><fmt:formatDate value="${row.bdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<c:choose>
					<c:when test="${row.bvalue == 'y'}">
						<td><a class="btn btn-warning" href="${path}/board/content.do?bidx=${row.bidx}" target="_blank">바로가기</a></td>
					</c:when>
					<c:otherwise>
						<td>삭제상태</td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tbody>
	</table>
	<div class="text-center">
			 <ul class="pagination">
			  <c:if test="${pagemakeradmin.prev}">
			   <li><a href="boardList.do${pagemakeradmin.makeQueryAdmin(pagemakeradmin.startPage - 1)}">이전</a></li>
			  </c:if> 
			  
			  <c:forEach begin="${pagemakeradmin.startPage}" end="${pagemakeradmin.endPage}" var="idx">
			   <li><a href="boardList.do${pagemakeradmin.makeQueryAdmin(idx)}">${idx}</a></li>
			  </c:forEach>
			    
			  <c:if test="${pagemakeradmin.next && pagemakeradmin.endPage > 0}">
			   <li><a href="boardList.do${pagemakeradmin.makeQueryAdmin(pagemakeradmin.endPage + 1)}">다음</a></li>
			  </c:if> 
			 </ul>
	</div>
	</form>
	</div>
</div>
</body>
</html>