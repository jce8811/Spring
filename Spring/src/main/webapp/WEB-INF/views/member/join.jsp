<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<style>
.container{
	margin-top:50px;
}
</style>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="/resources/nav/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/progressbar.css" type="text/css">
<body>
<div class="container">	
		<div class="wrap">
		<ul class="progressbar">
			<li class="active">약관동의</li>
			<li class="active">회원가입 폼</li>
			<li>회원가입 완료!</li>
		</ul>	
	</div> 
		<div class="col-sm-6"></div>
		<div class="col-sm-6" style="margin-top:50px;">
		<h2 align="center" style="padding-bottom:30px;">회원가입</h2>
			<form:form role="form" class="form-horizontal" commandName="register" action="${path}/member/joinResult.do" method="post">
				<div class="form-group">	
						<label for="mid" class="col-sm-3 control-label">아이디</label>
						<div class="col-sm-6">
							<form:input type="text" class="form-control" path="mid"/>
							<form:errors style="color:red" path="mid"/>
						</div>
						<div class="col-sm-3">
							<button type="button" class="btn btn-warning" id="checkId">중복확인</button>
						</div>
						<p class="result" align="center">
						<span class="msg" style="color:red">아이디를 확인해 주세요.</span>
						</p>
				</div>
				
				<div class="form-group">
						<label for="mpw" class="col-sm-3 control-label">비밀번호</label>
						<div class="col-sm-6">
							<form:input type="password" class="form-control" path="mpw"/>
							<form:errors style="color:red" path="mpw"/>
						</div>
				</div>
				
				<div class="form-group">
						<label for="mpwcheck" class="col-sm-3 control-label">비밀번호 확인</label>
						<div class="col-sm-6">
							<form:input type="password" class="form-control"  path="checkPw"/>
							<form:errors style="color:blue" path="checkPw"/>
						</div>	
				</div>
				
				<div class="form-group">
						<label for="mname" class="col-sm-3 control-label">이름</label>
						<div class="col-sm-6">
							<form:input type="text" class="form-control"  path="mname"/>
							<form:errors style="color:red" path="mname"/>
						</div>
				</div>
				
				<div class="form-group">
						<label for="mmail" class="col-sm-3 control-label">이메일</label>
						<div class="col-sm-6">
						<form:input type="email" class="form-control"  path="mmail"/>
						<form:errors style="color:red" path="mmail"/>		
						</div>
				</div>
						
				<button type="reset" class="btn btn-default" style="float:right;">취소</button>
				<button type="submit" class="btn btn-default" id="submit" disabled="disabled" style="float:right; margin-right:10px;">회원등록</button>						
			</form:form>
		</div>		
		</div>
<script> 
$("#checkId").click(function(){
 
	var query = {
		 		mid : $("#mid").val()
			 };
	
	 $.ajax({
	  url : "${path}/member/checkId.do",
	  type : "post",
	  data : query,
	  success : function(data) {
	  
	   if(data == 1 ) {
	    $(".result .msg").text("사용 불가");
	    $(".result .msg").attr("style", "color:#f00");    
	    $("#submit").attr("disabled","disabled");
	   } else{
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