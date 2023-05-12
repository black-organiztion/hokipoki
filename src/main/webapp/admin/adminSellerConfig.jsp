<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(){
		//header 메뉴 active
		$("#header .header_item").removeClass("active");
		$("#header .seller").addClass("active");
	
	});
</script>

<div id="content" class="container">
	<div class="row">
		<div class="col-xl-2 col-12">
			<!-- conts1 : 회원가입 대기 건수 -->
			<div class="section">
				<div>
					<div class="cnts">
						<span>회원가입 승인대기</span>
						<em>${standByCnt }</em>
					</div>
				</div>
			</div>
			<!-- //conts1 : 회원가입 대기 건수 -->
		</div>
		<div class="col-xl-10 col-12">
			<div class="section">
				<!-- conts2 : 판매자필터 + 리스트 -->
				<div class="sec_header">
					<h5>판매자검색</h5>
					<div class="utils">
						<div class="right">
							<div class="input_group">
								<select name="sch_options" class="frm_control">
									<option>ID</option>
									<option>회사명</option>
								</select>
								<div class="utils_search frm_control">
									<input type="text" name="sch_keyword">
									<button type="button" class="btn_search">검색</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="list seller_list">
					<div class="list_header">
						<span>상태</span>
						<span>아이디</span>
						<span>비밀번호</span>
						<span>회사명</span>
						<span>사업자등록번호</span>
						<span></span>
					</div>
					<c:choose>
						<c:when test="${sellerList.size() > 0 }">
							<c:forEach var="seller" items="${sellerList}" varStatus="">
								<div class="list_item">
									<div class="inr">
										<span>${seller.seller_author == 99? "미승인":"승인" }</span>
										<span>${seller.seller_id }</span>
										<span>${seller.seller_pw }</span>
										<span>${seller.seller_name }</span>
										<span>${seller.seller_number }</span>
										<span>
											<c:if test="${seller.seller_author == 99 }">
												<a href="adminSellerJoinCheck.ad?seller_id=${seller.seller_id}" class="bt">승인</a>
											</c:if>
										</span>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p>등록된 판매자가 없습니다.</p>
						</c:otherwise>
					</c:choose>
				</div>	
				<!-- //conts2 : 판매자필터 + 리스트 -->
			</div>
		</div>
	</div>
</div>

