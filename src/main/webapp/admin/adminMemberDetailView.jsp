<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(){
		//header 메뉴 active
		$("#header .header_item").removeClass("active");
		$("#header .member").addClass("active");
	
	});
</script>

<div id="content" class="bg">
	<div class="container">
		<div class="row">
			<div class="section col-12">
				<div class="card">
					<h5>회원정보</h5>
					ID : ${member.member_id}<br>
					PW :${member.member_pw}<br>
					이름 : ${member.member_name }<br>
					연락처 : ${member.member_tel}<br>
					이메일 : ${member.member_email }<br>
					가입일 : ${member.member_date}<br>
					
					추천인아이디 : ${member.recommend_id}

					<h5>멤버십</h5>
					등급 : ${member.membership_id }
					적립금 내역 : 준비중
					<hr>
					<h5>구매내역</h5>
					총 구매금액 : ${totalBuyPrice } 원<br>
					참여공구목록 : <br>
					<div>
						<c:choose>
							<c:when test="${buyList.size() > 0 }">
								<c:forEach var="order" items="${buyList }">
									<div class="border">
										${order.order_id }
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p>구매내역이 없습니다.</p>
							</c:otherwise>
						</c:choose>
					</div>
					
					<hr>
					<h5>최근 주소록</h5>
					주소록 목록 : <br>
					<div>
						<c:choose>
							<c:when test="${deliveryList.size() > 0 }">
								<c:forEach var="delivery" items="${deliveryList }">
									<div class="border">
										${delivery.order_id }
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p>최근 사용한 배송지가 없습니다.</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
