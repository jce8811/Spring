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
<script>
$(document).ready(function(){
	$("#pDelete").click(function(){
		if(confirm("상품을 삭제하시겠습니까?")){
			document.form1.action = "${path}/admin/productDelete.do";
			document.form1.submit();
		}
	});
});
</script>
<body>
<div class="container" style="margin-top:200px;">
	<div class="col-sm-6">
		<img src="${path}/${vo.pthumbimg}" width="400px" height="300px">
	</div>	
		<div class="col-sm-6">
				<h4>${vo.pname}</h4>
				<hr>
				<h4 style="float:right; ">판매가격: <fmt:formatNumber value="${vo.pprice}" pattern="###,###,###"/> 원</h4>
				<div style="clear:both; float:right; padding-bottom:20px;">
					<form name="cart" method="post" action="${path}/cart/insert.do">
						<input type="hidden" name="pidx" value="${vo.pidx}">
							<c:if test="${sessionScope.mid == null || sessionScope.mid != 'admin'}">
							<select name="camount">
								<c:forEach begin="1" end="10" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>&nbsp;개
								<input type="submit" class="btn btn-default" value="장바구니 담기">
							</c:if>	
					</form>
				</div>
				<div class="panel panel-default" style="clear:both;">
				  <div class="panel-heading">
				    <h3 class="panel-title" align="center">상품소개</h3>
				  </div>
				  <div class="panel-body">
					${vo.pinfo}
				  </div>
				</div>
				<c:if test="${sessionScope.mid == 'admin'}">
					<form id="form1" name="form1" method="post">
						<input type="button" id="pDelete" value="상품삭제" class="btn btn-default" style="float:right;">
					</form>					
					<a class="btn btn-default" style="float:right;" href="${path}/admin/modify.do/${vo.pidx}">수정하기</a>
				</c:if>
					<a class="btn btn-default" style="float:right;" href="${path}/product/list.do">목록으로</a>
		</div>
</div>
</body>
</html>