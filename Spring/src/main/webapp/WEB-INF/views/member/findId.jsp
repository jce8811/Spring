<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
}
</style>
<c:import url="/resources/nav/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
<div class= "container">
		<div class="col-sm-4"></div>
		<div class="col-sm-6" style="margin-top:30px;">
		<h3>ID 찾기</h3>
				<form name="member" class="form-horizontal" method="post"  action="${path}/member/findIdResult.do" onsubmit="return findValue()">
					<div class="form-group">
						<div class="col-sm-6">	
							<input type="text" class="form-control" id="mname" name="mname" placeholder="이름을 입력하세요."/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-6">	
							<input type="email" class="form-control" id="mmail" name="mmail" placeholder="이메일을 입력하세요."/>
						</div>
					</div>
					<div class="col-sm-6">
						<button type="submit" class="btn btn-default" style="float:right;">확인</button>					
				    </div>
				</form>
		</div>
		<div class="col-sm-4"></div>
	</div>
</body>
</html>