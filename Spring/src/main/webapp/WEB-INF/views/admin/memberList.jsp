<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트(관리자)</title>
</head>
<c:import url="/resources/nav/header.jsp"/>
<body>
<div class="container" style="margin-top:200px;">
	<div class="col-sm-4">
	<c:import url="/resources/nav/sidebar.jsp"/>
	</div>
	<div class="col-sm-8" style="margin-top:20px;">
	<h3>회원 목록</h3>
	<table class="table">
		<thead>
				<tr>
					<th style="width:20%">회원아이디</th>
					<th style="width:20%">회원이름</th>
					<th style="width:20%">회원이메일</th>
					<th style="width:30%">가입날짜</th>
					<th style="width:10%">회원상태</th>
				</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.mid}</td>
				<td>${row.mname}</td>
				<td>${row.mmail}</td>
				<td><fmt:formatDate value="${row.menter}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<c:choose>
					<c:when test="${row.mvalue == 'y'}">
						<td>회원</td>
					</c:when>
					<c:otherwise>
						<td>탈퇴회원</td>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
</body>
</html>