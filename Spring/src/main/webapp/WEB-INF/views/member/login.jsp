<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	//로그인 시 아이디 및 비밀번호 미 입력시 알림 기능.
	function chkValue(){
		if(!document.member.mid.value){
			alert("아이디를 입력하세요.");
			document.member.mid.focus();
			return false;
		}else if(!document.member.mpw.value){
			alert("비밀번호를 입력하세요.");
			document.member.mpw.focus();
			return false;
		}else{
			member.submit();
			return true;	
		}
	}	
</script>
</head>
<style>
.container{
	margin-top: 300px;
	width: 1500px;
	max-width: none !important;
}
input{
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
}
.login button{
	width: 100%;
    height: 55px;
    margin-top: 30px;
    margin-bottom: 10px;
    font-size: 25px;
}
#p1{
	font-size:35px;
}
.login input{
	margin: 5px;
}
img{
	width: 500px;
    height: 550px;
}
</style>
<c:import url="/resources/nav/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<body>
<div class="container">
	<div class="col-sm-6"></div>
		<div class="col-sm-6" id="login_box">
		<p id="p1">Lo-gin</p>
		<div class="login">
			<form name="member" class="form-horizontal" method="post" action="${path}/member/loginCheck.do">
						<input type="text" id="mid" name="mid" autocomplete="off" placeholder="아이디"/>
						<input type="password" id="mpw" name="mpw" autocomplete="off" placeholder="비밀번호"/>
						<button type="button" class="btn btn-outline-dark" onclick="chkValue()">로그인</button>
						<a href="${path}/member/findId.do">아이디 찾기</a>/<a href="${path}/member/findPw.do">비밀번호 찾기</a>
			</form>
		</div>
		<c:if test="${msg == 'fail'}">
			<div style="color:red">
				아이디 또는 비밀번호가 일치하지 않습니다.
			</div>
		</c:if>
		</div>
	</div>

</body>
</html>