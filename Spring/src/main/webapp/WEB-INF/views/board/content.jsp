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
<script>
$(document).ready(function(){
	listReply();
	
	$("#writeReply").click(function(){
		reply();
	
	function reply(){
		var rcontent = $("#rcontent").val();
		var bidx = "${vo.bidx}"
		$.ajax({
			type : "post",
			url : "${path}/reply/insert.do",
			headers : {
				"Content-Type" : "application/json"
			},
			dataType: "text",
			data: JSON.stringify({
				bidx : bidx,
				rcontent : rcontent
			}),
			success:function(result){
				alert("댓글이 등록되었습니다.");
				listReply();
				$("#rcontent").val("");
			}
		});
	}

	});	
	$("#bDelete").click(function(){
		if(confirm("삭제 하시겠습니까?")){
			document.form1.action = "${path}/board/delete.do?bidx=${vo.bidx}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}";
			document.form1.submit();
		}
	});
});
</script>
<body>
<div class="container">
	<form id="form1" name="form1" method="post">
		<h3>글 내용</h3>
		<input type="hidden" id="page" name="page" value="${scri.page}"/>
		<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"/>
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"/>
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"/>
		
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
		<input type="hidden" name="bidx" id="bidx" value="${vo.bidx}">
		<c:if test="${sessionScope.mid == vo.bwriter || sessionScope.mid == 'admin'}">
			<a class="btn btn-default" style="float:right;" href="${path}/board/updateRead.do?bidx=${vo.bidx}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">글수정</a>
			<input type="button" id="bDelete" value="글삭제" class="btn btn-default" style="float:right;">
		</c:if>
		<a class="btn btn-default" style="float:right;" href="${path}/board/list.do?page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">글목록</a>
	</form>
	<c:if test="${sessionScope.mid != null }">
		<textarea rows="5" cols="80" id="rcontent" placeholder="댓글을 작성해 주세요."></textarea>
		<button type="button" id="writeReply">댓글 작성</button>
	</c:if>
	<hr>
	<div id="listReply"></div>
<script>
function listReply(){
	$.ajax({
		type : "get",
		url : "${path}/reply/list.do/${vo.bidx}",
		success:function(result){
			$("#listReply").html(result);
		}
	});
}
</script>	
</div>
</body>
</html>