<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
	<input type="hidden" name="bidx" id="bidx" value="${vo.bidx}">
	<div class="form-group">
		<label for="btitle" class="control-label">제목</label>
		${vo.btitle}
	</div>
	<div class="form-group">
		<label for="bdate" class="control-label">작성날짜</label>
		<fmt:formatDate value="${vo.bdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
	</div>
	<div class="form-group">
		<label for="bwriter" class="control-label">작성자</label>
		${vo.bwriter}
	</div>
	<div class="form-group">
		<label for="bcontent" class="control-label">글내용</label>
		${vo.bcontent}
	</div>
	<input type="hidden" name="bidx" value="${vo.bidx}">
	<c:if test="${sessionScope.mid == vo.bwriter}">
		<a class="btn btn-default" href="${path}/board/updateRead.do?bidx=${vo.bidx}">글수정</a>
		<a class="btn btn-default" href="${path}/board/delete.do?bidx=${vo.bidx}">글삭제</a>
	</c:if>
	
	<div style="width:650px; text-align:center;">
		<textarea rows="5" cols="80" id="rcontent" placeholder="댓글을 작성해 주세요."></textarea>
		<c:if test="${sessionScope.mid != null }">
		<button type="button" id="btnReply">댓글 작성</button>
		</c:if>
	</div>
	<!-- 댓글 목록 출력 -->
	<div id="listReply"></div>
</div>
<script>
$(document).ready(function(){
	listReply();
	
	$("#btnReply").click(function(){
		var rcontent = $("#rcontent").val();
		var bidx="${vo.bidx}"
		var param="rcontent="+rcontent+"&bidx="+bidx;
		$.ajax({
			type: "post",
			url : "${path}/reply/insert.do",
			data : param,
			success : function(){
				alert("댓글이 등록되었습니다.");
				listReply();
			}
		});
	});

	function listReply(){
		$.ajax({
			 type: "get",
			 url : "${path}/reply/list.do?bidx=${vo.bidx}",
			 success: function(result){
				 var output = "<table>";
				 for(var i in result){
					 output += "<tr>";
					 output += "<td>"+result[i].mid;
					 output += "("+changeDate(result[i].rdate)+")"
					 output += "</td>";
					 output += "<td>"+result[i].rcontent
					 output += "</td>"
					 output += "</tr>";
				 }
				 output += "</table>";
				 $("#listReply").html(output);
			 }		 
		});
	}
	
	function changeDate(date){
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHours();
		minute = date.getMinutes();
		second = date.getSeconds();
		replyDate = year+"-"+month+"-"+day+"-"+hour+":"+minute+":"+second;
		return replyDate;
}
});
	

</script>
</body>
</html>