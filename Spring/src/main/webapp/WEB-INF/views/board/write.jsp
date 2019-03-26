<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
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
	$("#bList").click(function(){
		location.href="${path}/board/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
	})
})
function checkValue(){
	if(!document.board.btitle.value){
		alert("제목을 입력하세요.");
		return false;
	}else if(!document.board.bcontent.value){
		alert("내용을 입력하세요.");
		return false;
	}
}
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
	<form name="board" method="post" action="${path}/board/insert.do" onsubmit="return checkValue()">
		<div class="form-group">
			<label for="btitle" class="control-label">제목</label>
			<input type="text" name="btitle" id="btitle" size="80">
		</div>
		<div class="form-group">
			<label for="bcontent" class="control-label">내용</label>
			<textarea name="bcontent" id="bcontent" rows="4" cols="80"></textarea>
		</div>
		<button type="reset" class="btn btn-default" style="float:right;">취소</button>
		<button type="submit" class="btn btn-default" style="float:right;">작성완료</button>
		<button type="button" id="bList">뒤로가기</button>	
	</form>	
</div>
</body>
</html>