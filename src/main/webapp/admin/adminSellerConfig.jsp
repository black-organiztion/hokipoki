<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="seller" items="${sellerList}" varStatus="">
	<div class="card list_item">
		${seller.seller_author == 99? "미승인":"승인" }<br>
		${seller.seller_id }<br>
		${seller.seller_pw }<br>
		${seller.seller_name }<br>
		${seller.seller_number }
		<c:if test="${seller.seller_author == 99 }">
			<a href="adminSellerJoinCheck.ad?seller_id=${seller.seller_id}" class="btn btn-primary">승인</a>
		</c:if>
	</div>
</c:forEach>