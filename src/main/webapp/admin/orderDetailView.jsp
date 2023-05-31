<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(){
		//header 메뉴 active
		$(".header_item").removeClass("active");
		$(".header_item.order").addClass("active");
	
	});
</script>

<div id="content" class="bg order_detail">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="cont_header">
					<a id="btn_list" href="adminOrderListAction.or" >목록</a>
					<h2>주문상세조회</h2>
				</div>
			</div>
			<div class="col-lg-6 col-12">
				<div class="row">
					<div class="section col-12">
						<div class="card">
							<h5>구매공구정보</h5>
							<ul class="card_list">
								<li>
									<em>주문번호</em>
									<span>${order.order_id}</span>
								</li>
								<li>
									<em>주문상태</em>
									<c:choose>
										<c:when test="${order.order_status eq '0' }">
											<c:set var="status" value="주문취소"/>
										</c:when>
										<c:when test="${order.order_status eq '1' }">
											<c:set var="status" value="주문완료"/>
										</c:when>
										<c:when test="${order.order_status eq '2' }">
											<c:set var="status" value="결제완료"/>
										</c:when>
										<c:when test="${order.order_status eq '3' }">
											<c:set var="status" value="배송중"/>
										</c:when>
										<c:when test="${order.order_status eq '4' }">
											<c:set var="status" value="배송완료"/>
										</c:when>
										<c:when test="${order.order_status eq '5' }">
											<c:set var="status" value="구매확정"/>
										</c:when>
										<c:when test="${order.order_status eq '9' }">
											<c:set var="status" value="주문실패"/>
										</c:when>
									</c:choose>
									<div>
										<span>${status}</span>
										<c:if test="${order.order_status eq '3' }">
											<a class="bt">배송조회</a>
										</c:if>
									</div>
								</li>
								<li>
									<em>주문날짜</em>
									<span>${order.order_date }</span>
								</li>
								<li>
									<em>공구명</em>
									<span>${order.gongu_name}</span>
								</li>
								<li>
									<em>수량</em>
									<span>${order.order_count }</span>
								</li>
								<li>
									<em>구매금액</em>
									<span>${order.order_price}</span>
								</li>
							</ul>
						</div>
					</div>
					
					<c:if test="${sessionScope.loginAuthor eq 0 }">
					<div class="section col-12">
						<div class="card">
							<h5>판매자 정보</h5>
							<ul class="card_list">
								<li>
									<em>판매자ID</em>
									<span>${order.seller_id }</span>
								</li>
								<li>
									<em>회사명</em>
									<span>${order.seller_name }</span>
								</li>
								<li>
									<em>사업자번호</em>
									<span>${order.seller_number }</span>
								</li>
							</ul>
						</div>
					</div>
					</c:if>
				</div>
			</div>
			<div class="col-lg-6 col-12">
				<div class="row">
					<div class="section col-12">
						<div class="card">
							<h5>구매자정보</h5>
							<ul class="card_list">
								<li>
									<em>주문자</em>
									<span>${order.member_name}</span>
								</li>
								<li>
									<em>주문자 연락처</em>
									<span>${order.member_tel}</span>
								</li>
								<li>
									<em>주문자 이메일주소</em>
									<span>${order.member_email }</span>
								</li>
								<c:if test="${sessionScope.loginAuthor eq 0 }">
									<div class="bt_group">
										<a href="adminMemberDetailView.ad?member_id=${order.member_id }" class="bt">회원상세 정보 보기</a>
									</div>
								</c:if>
							</ul>
						</div>
					</div>
					<div class="section col-12">
						<div class="card">
							<h5>배송지정보</h5>
							<ul class="card_list">
								<li>
									<em>받는사람</em>
									<span>${order.receiver_name }</span>
								</li>
								<li>
									<em>받는사람 연락처</em>
									<span>${order.receiver_tel }</span>
								</li>
								<li>
									<em>주소</em>
									<span>${order.zipcode} ${order.addr1 } ${order.addr2 }</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- modal -->
<div id="modalForm" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">회원상세정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <ul class="card_list">
        	<li>
        		<em>회원ID</em>
        		<span></span>
        	</li>
        	<li>
        		<em>이름</em>
        		<span></span>
        	</li>
        	<li>
        		<em>연락처</em>
        		<span></span>
        	</li>
        	<li>
        		<em>이메일</em>
        		<span></span>
        	</li>
        	<li>
        		<em>가입일</em>
        		<span></span>
        	</li>
        	<li>
        		<em>추천인아이디</em>
        		<span></span>
        	</li>
        </ul>
      </div>
      <div class="modal-footer">
        <button id="btn_reset" type="button" class="bt">취소</button>
        <button id="btn_identify" type="button" class="bt">확인</button>
      </div>
    </div>
  </div>
</div>