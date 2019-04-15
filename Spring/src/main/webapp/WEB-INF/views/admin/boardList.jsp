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
<body>
<div class="container" style="margin-top:200px;">
	<div class="col-sm-4">
	<c:import url="/resources/nav/sidebar.jsp"/>
	</div>
	<div class="col-sm-8" style="margin-top:20px;">
	<h3>게시물 목록</h3>
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
				<td>${row.btitle}</td>
				<td>${row.bwriter}</td>
				<td><fmt:formatDate value="${row.bdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<c:choose>
					<c:when test="${row.bvalue == 'y'}">
						<td></td>
					</c:when>
					<c:otherwise>
						<td>삭제</td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
</body>
</html>