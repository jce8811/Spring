<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 작성글</title>
</head>
<c:import url="/resources/nav/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<body>
<div class="container" style="margin-top:200px;">
	<div class="col-sm-4">
	<c:import url="/resources/nav/sidebar.jsp"/>
	</div>
	<div class="col-sm-8" style="margin-top:20px;">
	<h3>내 작성글</h3>
	<table class="table">
		<thead>
				<tr>
					<th style="width:10%">번호</th>
					<th style="width:30%">제목</th>
					<th style="width:20%">작성자</th>
					<th style="width:30%">작성일</th>
				</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
			<tr>
			<c:if test="${sessionScope.mid == row.bwriter }">
				<td>${row.bidx}</td>
				<c:choose>
					<c:when test="${row.bvalue == 'y'}">
						<td><a href="${path}/board/content.do?bidx=${row.bidx}" target="_blank">${row.btitle}</a></td>
					</c:when>
					<c:otherwise>
						<td style="color:red">----삭제된 게시물입니다.----</td>
					</c:otherwise>
				</c:choose>
				<td>${row.bwriter}</td>
				<td><fmt:formatDate value="${row.bdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</c:if>	
			</c:forEach>
		</tbody>
	</table>
	<div class="text-center">
			 <ul class="pagination">
			  <c:if test="${pagemaker.prev}">
			   <li><a href="myBoardWrite.do${pagemaker.makeQuery(pagemaker.startPage - 1)}">이전</a></li>
			  </c:if> 
			  
			  <c:forEach begin="${pagemaker.startPage}" end="${pagemaker.endPage}" var="idx">
			   <li><a href="myBoardWrite.do${pagemaker.makeQuery(idx)}">${idx}</a></li>
			  </c:forEach>
			    
			  <c:if test="${pagemaker.next && pagemaker.endPage > 0}">
			   <li><a href="myBoardWrite.do${pagemaker.makeQuery(pagemaker.endPage + 1)}">다음</a></li>
			  </c:if> 
			 </ul>
		</div>
	</div>
</div>
</body>
</html>