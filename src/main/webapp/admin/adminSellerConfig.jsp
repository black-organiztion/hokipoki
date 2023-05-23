<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="content" class="seller">
	<div class="container divide">
		<div class="row">
			<div class="col-xl-2 col-12">
				<!-- conts1 : 회원가입 대기 건수 -->
				<div class="section sec1">
					<div>
						<div class="seller_cnts cnts">
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
							<form id="filterForm" action="adminSellerListAction.ad" method="post">
								<input type="hidden" name="page" value="${pageInfo.page }">
								<div class="right">
									<div class="input_group">
										<select name="search_option" class="frm_control">
											<option value="seller_id" ${sOption eq 'seller_id'? 'selected':''}>ID</option>
											<option value="seller_name" ${sOption eq 'seller_name'? 'selected':''}>회사명</option>
										</select>
										<div class="utils_search frm_control">
											<input type="text" name="search_keyword" value="${sKeyword }">
											<button id="btn_search" type="button" class="btn_search">검색</button>
										</div>
									</div>
								</div>
							</form>
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
						<div class="list_body">
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
														<a href="adminSellerJoinCheck.ad?seller_id=${seller.seller_id}" class="bt bt_primary">승인</a>
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
						<c:if test="${pageInfo.page > 0 }">
							<div class="list_footer">
								<ul class="pagination">
									<li class="page-item">
										<c:choose>
											<c:when test="${pageInfo.page <= 1 }">
												<a class="page-link first disabled"><span>처음으로</span></a>
											</c:when>
											<c:otherwise>
												<a class="page-link first" onclick="pageAction('${pageInfo.startPage}')"><span>처음으로</span></a>
											</c:otherwise>
										</c:choose>
									</li>
									<li class="page-item">
										<c:choose>
											<c:when test="${pageInfo.page <= 1 }">
												<a class="page-link prev disabled"><span>이전</span></a>
											</c:when>
											<c:otherwise>
												<a class="page-link prev" onclick="pageAction('prev')"><span>이전</span></a>
											</c:otherwise>
										</c:choose>
									</li>
									<c:forEach var="paging" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
										<li class="page-item">
											<c:choose>
												<c:when test="${paging == pageInfo.page }">
													<a class="page-link active" onClick="pageAction(${paging})">${paging }</a>
												</c:when>
												<c:otherwise>
													<a class="page-link" onClick="pageAction(${paging})">${paging }</a>
												</c:otherwise>
											</c:choose>
										</li>
									</c:forEach>
									<li class="page-item">
										<c:choose>
											<c:when test="${pageInfo.page >= pageInfo.maxPage }">
												<a class="page-link disabled next"><span>다음</span></a>
											</c:when>
											<c:otherwise>
												<a class="page-link next" onclick="pageAction('next')"><span>다음</span></a>
											</c:otherwise>
										</c:choose>
									</li>
									<li class="page-item">
										<c:choose>
											<c:when test="${pageInfo.page >= pageInfo.maxPage }">
												<a class="page-link disabled last"><span>마지막으로</span></a>
											</c:when>
											<c:otherwise>
												<a class="page-link last" onclick="pageAction(${pageInfo.maxPage})"><span>마지막으로</span></a>
											</c:otherwise>
										</c:choose>
									</li>
								</ul>
							</div>
						</c:if>
					</div>	
					<!-- //conts2 : 판매자필터 + 리스트 -->
				</div>
			</div>
		</div>
	</div>
	
</div>

<script>
	$(document).ready(function(){
		//header 메뉴 active
		$(".header_item").removeClass("active");
		$(".header_item.seller").addClass("active");
		
		//검색
		$("#btn_search").on('click', function(){
			pageAction(1);
			$("#filterForm").submit();
		});
	});
	
	function pageAction(count){
		var pageInput = document.querySelector('input[name="page"]');
		var nowPage = pageInput.value;
		console.log(nowPage);
		var goPage;
		
		if(count == null){
			count = 0;
		}else if(count == 'prev'){
			goPage = Number(nowPage)-1;
		}else if(count == 'next'){
			goPage = Number(nowPage)+1;
		}else{
			goPage = Number(count);
		}
		pageInput.value = goPage;
		
		//console.log("변경후:"+document.querySelector('input[name="page"]').value);
		$("#filterForm").submit();
		
	}
</script>