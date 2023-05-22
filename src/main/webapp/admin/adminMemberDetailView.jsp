<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(){
		//header 메뉴 active
		$(".header_item").removeClass("active");
		$(".header_item.member").addClass("active");
	
	});
</script>

<div id="content" class="bg member_detail">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="cont_header">
					<a id="btn_list" href="adminMemberListAction.ad">목록</a>
					<h2>회원상세조회</h2>
				</div>
			</div>
			<div class="col-lg-5 col-12 section">
				<div class="card">
					<h5>회원정보</h5>
					<ul class="card_list">
						<li>
							<em>아이디</em>
							<span>${member.member_id}</span>
						</li>
						<li>
							<em>비밀번호</em>
							<span>${member.member_pw}</span>
						</li>
						<li>
							<em>이름</em>
							<span>${member.member_name }</span>
						</li>
						<li>
							<em>연락처</em>
							<span>${member.member_tel}</span>
						</li>
						<li>
							<em>이메일</em>
							<span>${member.member_email }</span>
						</li>
						<li>
							<em>가입일</em>
							<span>${member.member_date}</span>
						</li>
						<li>
							<em>추천인 아이디</em>
							<span>${member.recommend_id}</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-7 col-12">
				<div class="row">
					<%-- <div class="col-12 section">
						<div class="card">
							<h5>멤버십</h5>
							<ul class="card_list">
								<li>
									<em>멤버십 등급</em>
									<span>${member.membership_id }</span>
								</li>
								<li>
									<em>적립금 내역</em>
									<span>준비중</span>
								</li>
							</ul>
						</div>
					</div> --%>
					<div class="col-12 section">
						<div class="card">
							<h5>구매내역</h5>
							<ul class="card_list">
								<li>
									<em>총 구매금액</em>
									<span>${totalBuyPrice } 원</span>
								</li>
								<li>
									<em>참여공구목록</em>
									<ul>
										<c:choose>
											<c:when test="${buyList.size() > 0 }">
												<c:forEach var="order" items="${buyList }">
													<li class="border">
														${order.order_id }
													</li>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<p>구매내역이 없습니다.</p>
											</c:otherwise>
										</c:choose>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-12 section">
						<div class="card">
							<h5>최근 주소록</h5>
							<ul class="card_list">
								<li>
									<ul>
										<c:choose>
											<c:when test="${deliveryList.size() > 0 }">
												<c:forEach var="delivery" items="${deliveryList }">
													<li class="border">
														${delivery.order_id }
													</li>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<p>최근 사용한 배송지가 없습니다.</p>
											</c:otherwise>
										</c:choose>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
