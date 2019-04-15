<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<c:import url="/resources/nav/header.jsp"/>
</head>
<script>
 function updateInfo(mpw){
	 if(!document.info.mpw.value){
			alert("새로운 비밀번호를 입력하세요.");
			document.info.mpw.focus();
			return false;
	 }else if(!/^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/g.test(info.mpw.value)){
			alert('숫자와 영문자 조합으로 6~20자리를 사용해야 합니다.');
			return false;
	}else if(document.info.mpw.value != document.info.mpwCheck.value){
			alert("새로운 비밀번호와 동일하게 입력하세요.");
			document.info.mpwCheck.focus();
			return false;		
	 }else if(!document.info.mname.value){
			alert("이름을 입력하세요.");
			document.info.mname.focus();
			return false;
	 }
 }
</script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<body>
<div class="container" style="margin-top:200px;">
	<div class="col-sm-6">
	<c:import url="/resources/nav/sidebar.jsp"/>
	</div>
	<c:choose>
		<c:when test="${sessionScope.mvalu == '0' }">
			<div class="col-sm-6" style="margin-top:50px;">
					<form name="info" method="post" action="${path}/member/infoUpdate.do" onsubmit="return updateInfo()">
							<div class="form-group">	
								<label for="mid" class="col-sm-3 control-label">아이디</label>
									<input type="text" class="form-control" id="mid" name="mid" value="${vo.mid}" readonly="readonly">
							</div>
							<div class="form-group">	
								<label for="mpw" class="col-sm-3 control-label">비밀번호</label>
									<input type="password" class="form-control" id="mpw" name="mpw" value="${vo.mpw}">
							</div>
							<div class="form-group">	
								<label for="mpwCheck" class="col-sm-3 control-label">비밀번호 확인</label>	
									<input type="password" class="form-control" id="mpwCheck" name="mpwCheck">
							</div>
							<div class="form-group">	
								<label for="mname" class="col-sm-3 control-label">이름</label>	
									<input type="text" class="form-control" id="mname" name="mname" value="${vo.mname}">
							</div>
							<div class="form-group">	
								<label for="mmail" class="col-sm-3 control-label">이메일</label>	
									<input type="email" class="form-control" id="mmail" name="mmail" value="${vo.mmail}" readonly="readonly">
							</div>
							<div class="form-group">	
								<label for="menter" class="col-sm-3 control-label">가입날짜</label>	
									<fmt:formatDate value="${vo.menter}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</div>
						<button type="submit" class="btn btn-default" style="float:right;">수정완료</button>
					</form>	
			</div>
	</c:when>
	<c:otherwise>
	</c:otherwise>
	</c:choose>
</div>
</body>
</html>