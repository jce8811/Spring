<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script>
 	$(document).ready(function(){
 		$("#bWrite").click(function(){
 			location.href = "${path}/board/write.do";
 		});
 	});
</script>
<style>
.container{
margin-top: 200px;
  width: 1500px;
  max-width: none !important;
}
</style>
<c:import url="/resources/nav/header.jsp"/>
<body>
<div class="container">
	<form name="form" method="post" action="${path}/board/list.do">
		<select name="searchOption">
			<option value="all"<c:out value="${map.searchOption == 'all'?'selected':''}"/>>모든</option>
			<option value="mid"<c:out value="${map.searchOption == 'mid'?'selected':''}"/>>작성자</option>
			<option value="btitle"<c:out value="${map.searchOption == 'btitle'?'selected':''}"/>>제목</option>
			<option value="bcontent"<c:out value="${map.searchOption == 'bcontent'?'selected':''}"/>>내용</option>
		</select>
		<input name="keyword" value="${map.keyword}">
		<input type="submit" value="검색">
	</form>	
		<table class="table">
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${map.list}">
					<tr>
						<td>${row.bidx}</td>
						<td><a href="${path}/board/content.do?bidx=${row.bidx}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.btitle}</a></td>
						<td>${row.mid}</td>
						<td><fmt:formatDate value="${row.bdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${row.bcnt}</td>
					</tr>	
				</c:forEach>
			</tbody>
			<tr>
		</table>
			
	<c:if test="${sessionScope.mid != null}">	
		<a class="btn btn-default" id="bWrite">글작성</a>
	</c:if>
</div>
</body>
</html>