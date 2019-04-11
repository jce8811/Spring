<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>
</head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
.container{
	margin-top: 100px;
}
</style>
<c:import url="/resources/nav/header.jsp"/>
<body>
<div class="container">
	<h3>글 내용</h3>
	<input type="hidden" id="page" name="page" value="${scri.page}"/>
	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"/>
	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"/>
	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"/>
	<input type="hidden" name="bidx" id="bidx" value="${vo.bidx}">
	<div style="border-bottom:1px solid black; border-top:1px solid black;">
	<h3 style="text-align:center;">${vo.btitle}</h3>
	</div>
	<div style="border-bottom:1px solid gray; margin:10px;">
	<font size="3px">작성자: ${vo.bwriter}</font> 
	<div style="float:right;">작성날짜: <fmt:formatDate value="${vo.bdate}" pattern="yyyy-MM-dd HH:mm:ss"/> &nbsp;&nbsp;조회수 :${vo.bcnt}</div>
	</div>
	<div style="text-align:center; margin-top:10px;">	
		<textarea rows="15" cols="160" readonly="readonly">${vo.bcontent}</textarea>
	</div>	
	<input type="hidden" name="bidx" value="${vo.bidx}">
	
	<c:if test="${sessionScope.mid == vo.bwriter}">
		<a class="btn btn-default" style="float:right;" href="${path}/board/updateRead.do?bidx=${vo.bidx}">글수정</a>
		<a class="btn btn-default" style="float:right;" href="${path}/board/delete.do?bidx=${vo.bidx}">글삭제</a>
	</c:if>
	<a class="btn btn-default" style="float:right;" href="${path}/board/updateRead.do?page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">글목록</a>
	<hr/>
	<h3>댓글</h3>
	<div style="width:650px; text-align:center;">
		<textarea rows="5" cols="130" id="rcontent" placeholder="댓글을 작성해 주세요."></textarea>
		<c:if test="${sessionScope.mid != null }">
		<button type="button" id="writeReply">댓글 작성</button>
		</c:if>
	</div>
	<!-- 댓글 목록 출력 -->
	<table class="table" id="listReply"></table>
</div>
<script>
$("#writeReply").click(function(){
	listReply();
	reply();
});
function reply(){
	var rcontent=$("#rcontent").val();
	var bidx = "${vo.bidx}"
	$.ajax({
		type : "post",
		url : "${path}/reply/insert.do",
		headers: {
			"Content-Type" : "application/json"
		},
		dateType: "text",
		data: JSON.stringify({
			bidx : bidx,
			rcontent : rcontent
		}),
		success:function(){
			alert("댓글이 등록되었습니다.");
			listReply();
		}
	});
}
function listReply(){
	$.ajax({
		type: "get",
		url : "${path}/reply/list.do?bidx=${vo.bidx}",
		success:function(result){
			$("#listReply").html(result);
		}
	});
}
</script>
</body>
</html>