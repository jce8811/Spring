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
		
  <form class="form-inline" id="form1" name="form1" method="post" enctype="multipart/form-data">
	<div class="col-sm-6">
		<input type="file" id="pimage" name="file" />
		<div class="select_img"><img src=""/></div>
	</div>
		<div class="col-sm-6">
			<div class="form-group">	
				<label for="pname" >상품명: </label>
				<input type="text" class="form-control" id="pname" name="pname">
				
			</div>
			<div class="form-group">
				<label for="pprice" style="margin-left:10px;">상품가격: </label>
				<input type="text" class="form-control" id="pprice" name="pprice">
			</div>	
			<div class="panel panel-default" style="margin-top:20px;">
			  <div class="panel-heading">
			    <h3 class="panel-title" align="center">상품소개</h3>
			  </div>
			  <div class="panel-body" style="height:250px;">
				<textarea rows="10"  type="text" id="pinfo" name="pinfo" style="width:100%;"></textarea>
			  </div>
			</div>
			<div>
				<input type="button" id="pUpload" class="btn btn-default" value="상품등록" style="float:right;">
			</div>
		</form>
	</div>
</div>

			<script>
				$("#pimage").change(function(){
					if(this.files && this.files[0]){
						var reader = new FileReader;
						reader.onload = function(data){
							$(".select_img img").attr("src", data.target.result).width(300);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
			</script>
</body>
</html>