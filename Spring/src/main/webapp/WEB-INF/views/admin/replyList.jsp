<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 리스트(관리자)</title>
</head>
<c:import url="/resources/nav/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<body>
<div class="container" style="margin-top:200px;">
	<div class="col-sm-4">
	<c:import url="/resources/nav/sidebar.jsp"/>
	</div>
	<div class="col-sm-8" style="margin-top:20px;">
	<h3>댓글 목록</h3>
	<table class="table">
		<thead>
				<tr>
					<th style="width:10%">번호</th>
					<th style="width:30%">내용</th>
					<th style="width:20%">작성자</th>
					<th style="width:30%">작성일</th>
					<th style="width:10%">삭제유무</th>
				</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.ridx}</td>
				<td>${row.rcontent}</td>
				<td>${row.rwriter}</td>
				<td><fmt:formatDate value="${row.rdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<c:choose>
					<c:when test="${row.rvalue == 'y'}">
						<td><a class="btn btn-warning" href="${path}/admin/replyDelete.do/${row.ridx}">삭제</a></td>
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
			   <li><a href="replyList.do${pagemakeradmin.makeQueryAdmin(pagemakeradmin.startPage - 1)}">이전</a></li>
			  </c:if> 
			  
			  <c:forEach begin="${pagemakeradmin.startPage}" end="${pagemakeradmin.endPage}" var="ridx">
			   <li><a href="replyList.do${pagemakeradmin.makeQueryAdmin(ridx)}">${ridx}</a></li>
			  </c:forEach>
			    
			  <c:if test="${pagemakeradmin.next && pagemakeradmin.endPage > 0}">
			   <li><a href="replyList.do${pagemakeradmin.makeQueryAdmin(pagemakeradmin.endPage + 1)}">다음</a></li>
			  </c:if> 
			 </ul>
	</div>
	</div>
</div>
</body>
</html>