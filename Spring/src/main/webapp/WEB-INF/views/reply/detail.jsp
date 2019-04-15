<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 상세보기</title>
</head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
 div.mdofiyReply { 
 	position:relative; z-index:1; display:none;
 }
 div.modalContent { 
 	position:fixed; top:20%; left:calc(50% - 250px); width:550px; padding:20px 10px; background:#fff; border:2px solid #666; 
 }
 div.modalContent textarea { 
 	font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; 
 }
 div.modalContent button { 
 	font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; 
 }
 div.modalContent button.replyClose { 
 	margin-left:20px; 
 }
</style>
<script>
$("#replyClose").click(function(){
	$("#modifyReply").css("visibility", "hidden");
});

$("#replyUpdate").click(function(){
	var detailRcontent = $("#detailRcontent").val();
	$.ajax({
		type: "post",
		url: "${path}/reply/update.do/${vo.ridx}",
		headers : {
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			rcontent : detailRcontent
		}),
		dataType: "text",
		success:function(result){
			if(result == "success"){
				alert("댓글이 수정되었습니다.");
				$("#modifyReply").css("visibility", "hidden");
				listReply();
			}
		}
	});
});

$("#replyDelete").click(function(){
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type:"post",
			url : "${path}/reply/delete.do/${vo.ridx}",
			success:function(result){
				if(result == "success"){
					alert("삭제되었습니다.");
					$("#modifyReply").css("visibility", "hidden");
					listReply();
				}
			}
		});
	}
});
</script>
<body>
 <div class="modalContent">
 	<h4>댓글 번호 : ${vo.ridx}</h4>
	 <textarea id="detailRcontent" name="detailRcontent" rows="5" cols="80">${vo.rcontent}</textarea>
	 <c:if test="${sessionScope.mid == vo.rwriter}">
	 	<button type="button" id="replyUpdate">수정</button>
	 	<button type="button" id="replyDelete">삭제</button>
	 </c:if>
	 <button type="button" id="replyClose">닫기</button>
 	 
 </div>
</body>
</html>