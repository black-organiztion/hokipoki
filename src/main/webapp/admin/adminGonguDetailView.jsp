<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h5>공구정보</h5>
공구번호 : ${gongu.gongu_id }<br>
카테고리 : ${gongu.category }<br>
공구상태 : ${gongu.gongu_status}<br>
공구명 : ${gongu.gongu_name }<br>
정가 : ${gongu.gongu_price }<br>
공구가격 : ${gongu.gongu_discount_price }<br>
등록일시 : ${gongu.gongu_date }<br>
조회수 : ${gongu.gongu_view_count }<br>
판매시작일 : ${gongu.gongu_startdate }<br>
판매종료일 : ${gongu.gongu_findate }<br>
상품재고수 : ${gongu.gongu_stock }<br>
최소목표수 : ${gongu.gongu_min }<br>
계산마감일 : ${gongu.gongu_caldate }<br>
상세정보 : <img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }"><br>
썸네일 : <img src="${pageContext.request.contextPath}/gongu/images/${gongu.detail_img }"><br>
<c:if test="${gongu.gongu_status ne '0' && gongu.gongu_status ne '1' && gongu.gongu_status ne '2' && gongu.gongu_status ne '3'}">
	<h5>공구진행현황</h5>
	현재 공구탑승한 인원 ${gongu.gongu_reserve }
	공구 달성률 ${(gongu.gongu_reserve/gongu.gongu_min)*100}
</c:if>
<c:if test="${sessionScope.loginId eq 'system' || sessionScope.loginAuthor eq 0 }">
	<hr>
	<h5>판매자정보</h5>
	판매자ID: <br>
	회사명 : <br>
	사업자번호 : <br>
	<hr>
	<div class="">
		<!-- 공구컨트롤버튼 : 종료아닐때만 표시 -->
		<c:if test="${gongu.gongu_status ne '7' || gongu.gongu_status ne '8'}">
			<c:if test="${gongu.gongu_status eq '0' }"><!-- 심사 : 승인대기일때만 표시 -->
				<a href="adminGonguSetStatus.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}&setStatus=1" class="btn btn-secondary">심사시작</a>
			</c:if>
			<c:if test="${gongu.gongu_status eq '1' }"><!-- 승인/승인거절 : 심사일때만 표시 -->
				<a href="adminGonguSetStatus.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}&setStatus=2" class="btn btn-primary">승인</a>
				<a href="adminGonguSetStatus.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}&setStatus=3" class="btn btn-secondary">반려</a>
			</c:if>
			<!-- 진행중(4)은 공구글이 게시된 시점부터. -->
			<c:if test="${gongu.gongu_status eq '4' }"><!-- 비활성화 : 진행중일때만 표시 =>지만 사실 비활성화 대기로 바꾸는거고 일정 기간 이후에 자동 비활성화 -->
				<a href="adminGonguSetStatus.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}&setStatus=5" class="btn btn-secondary">비활성화</a>
			</c:if>
			
			<%-- <c:if test="${gongu.gongu_status eq '0' }"><!-- 심사 : 승인대기일때만 표시 -->
				<a href="adminGonguCheckAction.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}" class="btn btn-secondary">심사시작</a>
			</c:if>
			<c:if test="${gongu.gongu_status eq '1' }"><!-- 승인/승인거절 : 심사일때만 표시 -->
				<a href="adminGonguOkAction.ad?gonngu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}" class="btn btn-primary">승인</a>
				<a href="adminGonguRejectAction.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}" class="btn btn-secondary">반려</a>
			</c:if>
			<c:if test="${gongu.gongu_status eq '4' }"><!-- 비활성화 : 진행중일때만 표시 -->
				<a href="adminGonguDisableAction.ad?gongu_id=${gongu.gongu_id}" class="btn btn-secondary">비활성화</a>
			</c:if>
			<c:if test="${gongu.gongu_status ne '0' }"><!-- 수정:심사중 이후에만 표시 -->
				<a href="adminGonguModifyAction.ad?gongu_id=${gongu.gongu_id}" class="btn btn-secondary">수정</a>
			</c:if> --%>
			
		</c:if>
	</div>
</c:if>
