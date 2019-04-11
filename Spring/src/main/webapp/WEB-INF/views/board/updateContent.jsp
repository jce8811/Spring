<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 페이지</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>
.container{
	margin-top: 200px;
  	width: 1500px;
  	max-width: none !important;
}
</style>
<c:import url="/resources/nav/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<body>
<div class="container">
	<form name="board" method="post" action="${path}/board/update.do">
	<input type="hidden" id="page" name="page" value="${scri.page}"/>
	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"/>
	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"/>
	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"/>
	<input type="hidden" name="bidx" id="bidx" value="${vo.bidx}">
		<div class="form-group">
			<label for="btitle" class="control-label">제목</label>
			<input type="text" name="btitle" id="btitle" size="80" value="${vo.btitle}">
		</div>
		<div class="form-group">
			<label for="bdate" class="control-label">작성날짜</label>
			<fmt:formatDate value="${vo.bdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</div>
		<div class="form-group">
			<label for="bcontent" class="control-label">글내용</label>
			<textarea name="bcontent" id="bcontent" rows="4" cols="80">${vo.bcontent}</textarea>
		</div>
		<button type="reset" class="btn btn-default" style="float:right;">취소</button>
		<button type="submit" class="btn btn-default" style="float:right;">수정완료</button>
	</form>
</div>
</body>
</html>