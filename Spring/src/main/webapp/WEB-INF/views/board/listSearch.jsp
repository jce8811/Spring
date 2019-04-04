<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<style>
.container{
	margin-top: 200px;
}
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
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="/resources/nav/header.jsp"/>
<body>
<div class="container">
		<h3>게시판</h3>
		<table class="table">
			<thead>
				<tr>
					<th style="width:10%">글번호</th>
					<th style="width:40%">제목</th>
					<th style="width:10%">작성자</th>
					<th style="width:20%">날짜</th>
					<th style="width:10%">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list}">
					<c:choose>
						<c:when test="${row.bvalue == 'y'}">
							<tr>
								<td>${row.bidx}</td>
								<td><a href="${path}/board/content.do?bidx=${row.bidx}">${row.btitle}
									<c:if test="${row.bcntNum >0}">
									<span style="color:red;">[${row.bcntNum}]</span>
									</c:if></a>
								</td>
								<td>${row.mid}</td>
								<td><fmt:formatDate value="${row.bdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>${row.bcnt}</td>
							</tr>
						</c:when>
						<c:otherwise>
						<tr>
							<td>${row.bidx}</td>
							<td>----삭제된 게시물입니다.----</td>
							<td>${row.mid}</td>
							<td><fmt:formatDate value="${row.bdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${row.bcnt}</td>
						</tr>
						</c:otherwise>
					</c:choose>	
				</c:forEach>
			</tbody>
		</table>
			 
		<c:if test="${sessionScope.mid != null}">	
			<a class="btn btn-default" id="bWrite">글작성</a>
		</c:if>
		
		<div class="search" style="float:right;">
		 <select name="searchType">
		  <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>모두보기</option>
		  <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
		  <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
		  <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
		 </select>
		 
		 <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
		 <button class="btn btn-default" id="searchBtn">검색</button>
		
		<script>
				 $(function(){
				  $('#searchBtn').click(function() {
				   self.location = "${path}/board/listSearch.do" + '${pagemaker.makeQuery(1)}'
				     + "&searchType=" + $("select option:selected").val()
				     + "&keyword=" + encodeURIComponent($('#keywordInput').val());
				    });
				 });   
		</script>
	</div>
		<div class="text-center">
			 <ul class="pagination">
			  <c:if test="${pagemaker.prev}">
			   <li><a href="listSearch.do${pagemaker.makeSearch(pagemaker.startPage - 1)}">이전</a></li>
			  </c:if> 
			  
			  <c:forEach begin="${pagemaker.startPage}" end="${pagemaker.endPage}" var="bidx">
			   <li><a href="listSearch.do${pagemaker.makeSearch(bidx)}">${bidx}</a></li>
			  </c:forEach>
			    
			  <c:if test="${pagemaker.next && pagemaker.endPage > 0}">
			   <li><a href="listSearch.do${pagemaker.makeSearch(pagemaker.endPage + 1)}">다음</a></li>
			  </c:if> 
			 </ul>
		</div>
</div>
<script>
 	$(document).ready(function(){
 		$("#bWrite").click(function(){
 			location.href = "${path}/board/write.do";
 		});
 	});
</script>
</body>
</html>