<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
.container{
	margin-top: 200px;
	width: 1500px;
	max-width: none !important;
}
form{
	padding-top: 15px;
}
label{
	margin-top: 6px;
}
</style>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="/resources/nav/header.jsp"/>

<body>
<div class="container">	
		<div class="col-sm-6"></div>
		<div class="col-sm-6">
		<h2>회원가입</h2>
			<form class="form-horizontal" id="member" action="${path}/member/memberInsert.do" method="post" onsubmit="return checkValue()">
				<div class="form-group">	
						<label class="col-sm-3 col-form-label">아이디</label>	
						<div class="col-sm-4">
							<input type="text" class="form-control" name="mid" id="mid">
							<button type="button" class="checkId">중복확인</button>
						</div>
						<p class="result">
						<span class="msg">아이디를 확인해 주세요.</span>
						</p>
				</div>
				
				<div class="form-group">
						<label class="col-sm-3 col-form-label">비밀번호</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" name="mpw">
						</div>
				</div>
				
				<div class="form-group">
						<label class="col-sm-3 col-form-label">비밀번호 확인</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" name="mpwcheck">
						</div>	
				</div>
				
				<div class="form-group">
						<label class="col-sm-3 col-form-label">이름</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="mname">
						</div>
				</div>
				
				<div class="form-group">
						<label class="col-sm-3 col-form-label">이메일</label>
						<div class="col-sm-5">
							<input type="email" class="form-control" name="mmail" path="mmail">
						<errors path="mmail">		
						</div>
				</div>
						
				<button type="reset" class="btn btn-default" style="float:right;">취소</button>
				<button type="submit" class="btn btn-default" id="submit" disabled="disabled" style="float:right;">회원등록</button>						
			</form>
		</div>		
		</div>
<script> 
$(".checkId").click(function(){
 
 var query = {mid : $("#mid").val()};
 
 $.ajax({
  url : "../member/checkId.do",
  type : "post",
  data : query,
  success : function(data) {
  
   if(data == 1) {
    $(".result .msg").text("사용 불가");
    $(".result .msg").attr("style", "color:#f00");    
    $("#submit").attr("disabled","disabled");
   } else {
    $(".result .msg").text("사용 가능");
    $(".result .msg").attr("style", "color:#00f");
    $("#submit").removeAttr("disabled");
   }
  }
 });  // ajax 끝
});
</script>
</body>
</html>