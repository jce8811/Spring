<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
</head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="/resources/nav/header.jsp"/>
<script>
	$(document).ready(function(){
		$("#pList").click(function(){
			location.href="${path}/product/list.do";
		});
	});
</script>
<body>
<div class="container" style="margin-top:200px;">
	<div class="col-sm-6">
		<c:import url="/resources/nav/sidebar.jsp"/>
	</div>
	<div class="col-sm-6">
		<h3>내 장바구니</h3>
		<button type="button" class="btn btn-success" id="pList" style="margin-bottom:10px; float:right;">상품목록페이지</button>
		<c:choose>
			<c:when test="${map.count == 0 }">
				장바구니가 비어있습니다.
			</c:when>
			<c:otherwise>
			<form name="cart" method="post" action="${path}/cart/update.do">
			<table class="table">
				<tr>
					<th>상품명</th>
					<th>금액</th>
					<th>수량</th>
					<th>총금액</th>
					<th>삭제</th>
				</tr>
				<c:forEach var="row" items="${map.list}">
					<tr>
						<td>${row.pname}</td>
						<td><fmt:formatNumber value="${row.pprice}" pattern="###,###,###"/> 원</td>
						<td>
							<input type="number" style="width:50px;" name="camount" value="${row.camount}" min="1">
							<input type="hidden" name="pidx" value="${row.pidx}">
						</td>
						<td><fmt:formatNumber value="${row.cprice}" pattern="###,###,###"/> 원</td>
						<td><a href="${path}/cart/delete.do?cidx=${row.cidx}">삭제</a></td>
					</tr>
				</c:forEach>
				</table>
			<hr>
				<tr>
					<td>
						<div colspan="5" align="right">
							장바구니 합계 금액 : <fmt:formatNumber value="${map.sumPrice}" pattern="###,###,###"/> 원<br/>
							배송료 : ${map.fee} 원<br/>
							<hr size="2">
							전체 결제금액 : <fmt:formatNumber value="${map.totalPrice}" pattern="###,###,###"/> 원<br/>
						</div>
					</td>
				</tr>
				<input type="hidden" name="count" value="${map.count}">
				<button type="submit" class="btn btn-default">수정</button>
			</form>	
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>