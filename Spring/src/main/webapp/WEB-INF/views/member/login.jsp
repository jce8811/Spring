<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
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
</style>
<c:import url="/resources/nav/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<body>
<div class="container">
	<div class="col-sm-6"></div>
		<div class="col-sm-6" id="login_box">
		<p id="p1">로그인</p>
			<div class="login">
				<form name="member" class="form-horizontal" method="post" action="${path}/member/loginCheck.do">
							<input type="text" id="mid" name="mid" autocomplete="off" placeholder="아이디"/>
							<input type="password" id="mpw" name="mpw" autocomplete="off" placeholder="비밀번호"/>
								<c:if test="${msg == 'fail'}">
									<div style="color:red">
										아이디 또는 비밀번호가 일치하지 않습니다. 혹은 탈퇴회원입니다.
									</div>
								</c:if>
							<button type="button" class="btn btn-default" onclick="chkValue()">로그인</button>
							<a href="${path}/member/findId.do" style="color:black">아이디 찾기</a>/<a href="${path}/member/findPw.do" style="color:black">비밀번호 찾기</a>
				</form>
			</div>
		</div>
	</div>

</body>
</html>