<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(){
		//header 메뉴 active
		$(".header_item").removeClass("active");
		$(".header_item.main").addClass("active");
		
	});
</script>

<div id="content" class="bg main">
	<div class="container">
		<div class="row">
			<div class="col-xl-6 col-12">
				<div class="row">
					<c:choose>
						<c:when test="${loginAuthor eq 0 }">
							<!-- (관리자)conts1:공구승인대기건수 -->
							<div class="section col-xl-6 col-4">
								<div class="card">
									<h5>공구승인대기</h5>
									${standByCnt }
								</div>
							</div>
							<!-- //(관리자)conts1:공구승인대기건수 -->
							
							<!-- (관리자)conts2:회원가입승인대기건수 -->
							<div class="section col-xl-6 col-4">
								<div class="card">
									<h5>회원가입대기</h5>
									${sellerStandByCnt }
								</div>
							</div>
							<!-- //(관리자)conts2:회원가입승인대기건수 -->
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					
					<!-- (공통)conts3:미응답문의건수 -->
					<div class="section col-xl-6 col-4">
						<div class="card">
							<h5>문의현황</h5>
							미응답 문의 건수
						</div>
					</div>
					<!-- //(공통)conts3:미응답문의건수 -->
				</div>
			</div>
			<div class="col-xl-6 col-12">
				<div class="row">
					<c:choose>
						<c:when test="${loginAuthor eq 0 }">
							<!-- (관리자)conts4:마감임박문의목록 -->
							<div class="section col-12">
								<div class="card">
									<h5>마감임박 공구 <small>판매종료일이 3일 이하인 공구 목록이 표시됩니다.</small></h5>
									<ul class="card_list">
										<c:choose>
											<c:when test="${closingList.size() > 0 }">
												<c:forEach var="gongu" items="${closingList }">
													<li>
														<span class="badge bg-primary">D - </span>
														<span>${gongu.gongu_name }</span>
														<span>${gongu.gongu_findate }</span>
													</li>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<p>마감임박한 공구가 없습니다.</p>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</div>
							<!-- //(관리자)conts4:마감임박문의목록 -->
						</c:when>
						<c:otherwise>
							<!-- (판매자)conts5:진행중공구목록 -->
							<div class="section col-12">
								<div class="card">
									<h5>공구현황 <small>나의 진행중인 공구 목록이 표시됩니다.</small></h5>
									진행중인 공구 목록
								</div>
							</div>
							<!-- //(판매자)conts5:진행중공구목록 -->
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>