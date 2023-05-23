<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="content" class="order_config">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section sec1">
					<!-- conts1 : 주문필터 + 리스트 -->
					<h5>주문검색</h5>
					<div class="utils">
						<form id="filterForm" action="adminOrderListAction.or" method="post">
							<input type="hidden" name="page" value="${pageInfo.page }">
							<button type="button" id="btn_filter" class="btn_filter frm_control" onclick="lyOn(this)">필터</button>
							<div id="ly_filter" class="ly_filter ly">
								<div class="utils_filter">
									<fieldset>
										<legend>주문상태표시</legend>
										<div class="frm_group">
											<input type="checkbox" id="order_all" name="order_status" value="all" class="frm_chk" ${fn:contains(filterList,'all')? "checked":""}>
											<label for="order_all">전체</label>
										</div>
										<div class="frm_group">
											<input type="checkbox" id="order_3" name="order_status" value="3" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'3')? "checked":""}>
											<label for="order_3">배송중</label>
										</div>
										<div class="frm_group">
											<input type="checkbox" id="order_0" name="order_status" value="0" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'0')? "checked":""}>
											<label for="order_0">주문취소</label>
										</div>
										<div class="frm_group">
											<input type="checkbox" id="order_4" name="order_status" value="4" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'4')? "checked":""}>
											<label for="order_4">배송완료</label>
										</div>
										<div class="frm_group">
											<input type="checkbox" id="order_1" name="order_status" value="1" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'1')? "checked":""}>
											<label for="order_1">주문완료</label>
										</div>
										<div class="frm_group">
											<input type="checkbox" id="order_5" name="order_status" value="5" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'5')? "checked":""}>
											<label for="order_5">구매확정</label>
										</div>
										<div class="frm_group">
											<input type="checkbox" id="order_2" name="order_status" value="2" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'2')? "checked":""}>
											<label for="order_2">결제완료</label>
										</div>
										<div class="frm_group">
											<input type="checkbox" id="order_9" name="order_status" value="9" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'9')? "checked":""}>
											<label for="order_9">주문실패</label>
										</div>
										<div class="bt_group">
											<button id="" type="button" class="bt" onclick="lyOff(this)">취소</button>
											<button id="btn_apply" type="button" class="bt bt_primary">적용</button>
										</div>
									</fieldset>
								</div>	
							</div>
							<div class="right">
								<div class="input_group">
									<select name="search_option" class="frm_control">
										<option value="gongu_name" ${sOption eq 'gongu_name'? 'selected':''}>공구명</option>
										<option value="member_name" ${sOption eq 'member_name'? 'selected':''}>주문자</option>
									</select>
									<div class="utils_search frm_control">
										<input type="text" name="search_keyword" value="${sKeyword }">
										<button id="btn_search" type="button" class="btn_search">검색</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="list order_list">
						<div class="list_header">
							<span>상태</span>
							<span>주문번호</span>
							<span>공구명</span>
							<span>주문금액</span>
							<span>구매자</span>
							<span>주문일자</span>
						</div>
						<div class="list_body">
							<c:choose>
								<c:when test="${orderList.size() > 0 }">
									<c:forEach var="order" items="${orderList}" varStatus="">
										<div class="list_item">
											<a href="adminOrderDetailViewAction.or?order_id=${order.order_id }" class="inr">
												<span>
													<c:choose>
														<c:when test="${order.order_status eq '0' }">주문취소</c:when>
														<c:when test="${order.order_status eq '1' }">주문완료</c:when>
														<c:when test="${order.order_status eq '2' }">결제완료</c:when>
														<c:when test="${order.order_status eq '3' }">배송중</c:when>
														<c:when test="${order.order_status eq '4' }">배송완료</c:when>
														<c:when test="${order.order_status eq '5' }">구매확정</c:when>
														<c:when test="${order.order_status eq '9' }">주문실패</c:when>
													</c:choose>
												</span>
												<span>${order.order_id}</span>
												<span>${order.gongu_name}</span>
												<span>${order.order_price}</span>
												<span>${order.member_name }</span>
												<span>${order.order_date }</span>
											</a>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p class="noItem">주문내역이 없습니다.</p>
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
					<!-- //conts1 : 주문필터 + 리스트 -->
				</div>
				
			</div>
		</div>
	</div>
	

</div>

<script>
	$(document).ready(function(){
		//header 메뉴 active
		$(".header_item").removeClass("active");
		$(".header_item.order").addClass("active");
		
		//필터 체크박스 전체선택, 해제
		var checkAll = $("#order_all");
		checkAll.on('click',function(){
			if(checkAll.is(":checked") == true){
				$("input[name=order_status]").prop("checked", true);
			}else{
				$("input[name=order_status]").prop("checked", false);
			}
		});
		
		$("input[name=order_status]").not(checkAll).on('click', function(){
			var totalL = $("input[name=order_status]").not(checkAll).length;
			var checkedL = $("input[name=order_status]:checked").not(checkAll).length;
			console.log(totalL,checkedL);
			if(totalL <= checkedL){
				checkAll.prop("checked", true);
			}else{
				checkAll.prop("checked", false);
			}
		});
		
		//필터적용
		$("#btn_apply").on('click', function(){
			pageAction(1);
			$("#filterForm").submit();
			//비동기할때 주석풀기
			//filterList();
		});
		
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
