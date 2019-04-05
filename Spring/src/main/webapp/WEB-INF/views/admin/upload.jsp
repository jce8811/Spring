<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 업로드</title>
</head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="/resources/nav/header.jsp"/>
<script>
$(document).ready(function(){
	$("#pUpload").click(function(){
		var pname = $("#pname").val();
		var pprice = $("#pprice").val();
		var pinfo = $("#pinfo").val();
		
		if(pname == ""){
			alert("상품명을 입력하세요.");
			pname.focus();
		} else if (pprice == ""){
			alert("가격을 입력하세요.");
			pprice.focus();
		} else if (pinfo == ""){
			alert("상품정보를 입력하세요.");
			pinfo.focus();
		}
		document.form1.action = "${path}/admin/productUpload.do";
		document.form1.submit();
	});

});		
</script>
<body>
<div class="container" style="margin-top:200px;">
	<div class="col-sm-6">
	<img src="" width="400px" height="300px">
	</div>
		<div class="col-sm-6">
		<form id="form1" name="form1" method="post">
			<div>	
				<label for="pname">상품명: </label>
				<input type="text" id="pname" name="pname">
				
				<label for="pprice" style="margin-left:10px;">상품가격: </label>
				<input type="text" id="pprice" name="pprice">
			</div>	
			<div class="panel panel-default" style="margin-top:20px;">
			  <div class="panel-heading">
			    <h3 class="panel-title" align="center">상품소개</h3>
			  </div>
			  <div class="panel-body" style="height:250px;">
				<textarea rows="10" cols="70" type="text" id="pinfo" name="pinfo"></textarea>
			  </div>
			</div>
			<div>
				<input type="button" id="pUpload" class="btn btn-default" value="상품등록" style="float:right;">
			</div>
		</form>
	</div>
</div>
</body>
</html>