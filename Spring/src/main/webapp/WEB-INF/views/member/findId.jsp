<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	function findValue(){
		if(!document.member.mname.value){
			alert("이름을 입력하세요.");
			document.member.mname.focus();
			return false;
			
		}else if(!document.member.mmail.value){
			alert("이메일을 입력하세요.");
			document.member.mmail.focus();
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
<div class= "container">
		<div class="col-sm-4"></div>
		<div class="col-sm-6">
		<p>ID 찾기</p>
				<form name="member" class="form-horizontal" method="post"  action="${path}/member/findIdResult.do" onsubmit="return findValue()">
					<div class="col-sm-6">	
							<input type="text" id="mname" name="mname" placeholder="이름을 입력하세요."/>
						</div>
				
						<div class="col-sm-6">	
							<input type="text" id="mmail" name="mmail" placeholder="이메일을 입력하세요."/>
						</div>
						<div class="col-sm-6">														
							<button type="submit" class="btn btn-default">확인</button>					
						</div>
				</form>
		</div>
		<div class="col-sm-4"></div>	
	</div>
</body>
</html>