<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

function changeValue(){
	if(!document.member.mpw.value){
		alert("새로운 비밀번호를 입력하세요.");
		document.member.mpwd.focus();
		return false;
	}else if((document.member.mpw.value < "0" || document.member.mpw.value > "9") && (document.member.mpw.value < "A" || document.member.mpw.value > "Z") && (document.member.mpw.value < "a" || document.member.mpw.value > "z")){
		alert("한글 및 특수문자는 비밀번호로 사용하실 수 없습니다.");
		return false;
	}else if(document.member.mpw.value.length <= 7 || document.member.mpw.value.length >= 20){
		alert("비밀번호는 8자리 이상 20자리 이하입니다.");
		return false;		
	}else if(document.member.mpw.value!=document.member.mpwcheck.value){
		alert("새로운 비밀번호와 동일하게 입력하세요.");
		document.member.mpwdcheck.focus();
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
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
<div class="container">
	<div class="col-sm-4"></div>
	<div class="col-sm-6">
	<p>비밀번호 변경</p>
		<form name="member" class="form-horizontal" method="post"  action="${path}/member/updatePwResult.do"  onsubmit="return changeValue()">
			<div class="col-sm-6">
				<input type="password" id="mpw" name="mpw" placeholder="변경할 비밀번호를 입력해주세요."/>
			</div>		
			<div class="col-sm-6">
				<input type="password" id="mpwcheck" name="mpwcheck" placeholder="비밀번호를 한번 더 입력해주세요"/>
				<input type="hidden" id="mid" name="mid" value="${requestScope.mid}"/>
			</div>
				<div class="col-sm-6">
				<button type="submit" class="btn btn-default" style="float:right;">변경하기</button>															
				<button type="button" class="btn btn-default" style="float:right;">취소</button>				
			</div>
		</form>
	</div>
	<div class="col-sm-4"></div>			
</body>
</html>