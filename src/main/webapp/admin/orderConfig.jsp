<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="content" class="container">
	<div class="row">
		<div class="col-12">
			<div class="section">
				<!-- conts1 : 주문필터 + 리스트 -->
				<h5>주문검색</h5>
				<div class="utils">
					<button type="button" id="btn_filter" class="btn_filter frm_control" onclick="lyOn(this)">필터</button>
					<div id="ly_filter" class="ly_filter ly">
						<form id="filterForm" class="utils_filter" action="adminOrderListAction.or" method="post">
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
						</form>	
					</div>
					<div class="right">
						<div class="input_group">
							<select name="sch_options" class="frm_control">
								<option>공구명</option>
								<option>주문자</option>
							</select>
							<div class="utils_search frm_control">
								<input type="text" name="sch_keyword">
								<button type="button" class="btn_search">검색</button>
							</div>
						</div>
					</div>
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
				<!-- //conts1 : 주문필터 + 리스트 -->
			</div>
			
		</div>
	</div>

</div>

<script>
	$(document).ready(function(){
		//header 메뉴 active
		$("#header .header_item").removeClass("active");
		$("#header .order").addClass("active");
		
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
			$("#filterForm").submit();
			//비동기할때 주석풀기
			//filterList();
		});
	});
</script>
