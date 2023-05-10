<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(){
		//header 메뉴 active
		$("#header .header_item").removeClass("active");
		$("#header .order").addClass("active");
	
	});
</script>

<div id="content" class="bg">
	<div class="container">
		<div class="row">
			<div class="section col-12">
				<div class="card">
					<h5>참여공구정보</h5>
					주문번호 : ${order.order_id}<br>
					주문상태 :${order.order_status}<br>
					주문날짜 : ${order.order_date }<br>
					공구명 : ${order.gongu_name}<br>
					수량 : ${order.order_count }<br>
					구매금액 : ${order.order_price}<br>
					<c:if test="${loginId eq 'system' || loginAuthor eq 0 }">
					<hr>
					<h5>판매자 정보</h5>
					판매자ID : ${order.seller_id } 
					회사명 : ${order.seller_name }
					사업자번호 : ${order.seller_number }
					(차후 추가?)
					회사대표전화번호 :
					담당자 이름 : 
					담당자 연락처 : 
					</c:if>
					<hr>
					<h5>구매자정보</h5>
					주문자 : ${order.member_name}<br>		
					주문자 연락처 : ${order.member_tel}<br>
					주문자 이메일주소 : ${order.member_email }
					<c:if test="${loginId eq 'system' || loginAuthor eq 0 }">
						<a href="memberDetailView.me" class="bt">회원상세 정보 보기</a> 
					</c:if>
					<hr>
					<h5>배송지정보</h5>
					받는사람 : ${order.receiver_name }<br>
					받는사람 연락처 : ${order.recevier_tel }<br>
					주소 : ${order.zipcode} ${order.addr1 } ${order.addr2 }<br>
					
					
				
				</div>
			</div>
		</div>
	</div>
</div>
