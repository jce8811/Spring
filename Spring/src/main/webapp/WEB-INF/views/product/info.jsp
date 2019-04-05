<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
</head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="/resources/nav/header.jsp"/>
<style>
.container {
	margin-top : 100px;
}
</style>
<body>
<div class="container">
	<div class="col-sm-6"></div>	
	<div class="col-sm-6">
	<h3>상품 정보</h3>
		<table border="1">
			<tr style="margin-bottom:10px;">
				<td><img src="${path}/productImage/${vo.pimage}" width="400px" height="300px"></td>
			</tr>
				<table border="1" style="width:400px; height:300px;">
					<tr align="center">
						<td>상품명</td>
						<td>${vo.pname}</td>
					</tr>
					<tr align="center">
						<td>가격</td>
						<td><fmt:formatNumber value="${vo.pprice}" pattern="###,###,###"/>원</td>
					</tr>
					<tr align="center">
						<td>상품소개</td>
						<td>${vo.pinfo}</td>
					</tr>
					<tr align="center">
						<td colspan="2">
							<form name="cart" method="post" action="${path}/cart/insert.do">
								<input type="hidden" name="pidx" value="${vo.pidx}">
								<select name="camount">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>&nbsp;개
								<input type="submit" class="btn btn-default" value="장바구니 담기">
							</form>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" class="btn btn-default">뒤로가기</button>
							<button type="button" class="btn btn-default">수정하기</button>
						</td>
					</tr>
				</table>
		</table>
	</div>
</div>
</body>
</html>