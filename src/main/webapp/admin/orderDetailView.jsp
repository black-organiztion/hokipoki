<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
	<h5>참여공구정보</h5>
	주문번호 : ${order.order_id}<br>
	주문상태 :${order.order_status}<br>
	주문날짜 : ${order.order_date }<br>
	공구명 : ${order.gongu_name}<br>
	수량 : ${order.order_count }<br>
	구매금액 : ${order.order_price}<br>
	<hr>
	<h5>구매자정보</h5>
	주문자 : ${order.member_name}<br>		
	주문자 연락처 : ${order.member_tel}<br>
	주문자 이메일주소 : ${order.member_email }
	<hr>
	<h5>배송지정보</h5>
	받는사람 : ${order.receiver_name }<br>
	받는사람 연락처 : ${order.recevier_tel }<br>
	주소 : ${order.zipcode} ${order.addr1 } ${order.addr2 }<br>
	
	
	
</div>