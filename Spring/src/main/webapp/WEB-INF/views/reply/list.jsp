<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 목록</title>
</head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script>
function showReplyModify(ridx){
	$.ajax({
		type: "get",
		url: "${path}/reply/detail.do/"+ridx,
		success: function(result){
			$("#modifyReply").html(result);
			$("#modifyReply").css("visibility", "visible");
		}
	});
}
</script>
<body>
<div class="container">
		<c:forEach var="row" items="${List}">
		<c:choose>
			<c:when test="${row.rvalue == 'y'}">
			<div style="margin-bottom:20px;">
				<span style="font-size:22px;">${row.mid}</span>
				<span style="font-size:13px;">(<fmt:formatDate value="${row.rdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)</span>
			</div>
			<div>${row.rcontent}</div>
				<c:if test="${sessionScope.mid == row.rwriter}">
					<input class="btn btn-default" type="button" id="showReplyModify" value="상세보기" data-toggle="modal" onclick="showReplyModify('${row.ridx}')"/>
				</c:if>
			</c:when>
			<c:otherwise>
				<div style="font-size:22px;">${row.mid}</div>
				<div style="color:red">----삭제된 답변입니다.----</div>
			</c:otherwise>
		</c:choose>	
		<hr>	
		</c:forEach>
		<div id="modifyReply"></div>
</div>
</body>
</html>