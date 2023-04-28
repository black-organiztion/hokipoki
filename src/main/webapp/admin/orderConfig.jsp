<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="order" items="${orderList}" varStatus="">
	<div class="card list_item">
		주문번호 : ${order.order_id}<br>		
		주문자 : ${order.member_id}<br>		
		주문상태 :${order.order_status}<br>
		주문날짜 : ${order.order_date }<br>
		수량 : ${order.order_count }<br>
		가격 : ${order.order_price }<br>
	</div>
</c:forEach>