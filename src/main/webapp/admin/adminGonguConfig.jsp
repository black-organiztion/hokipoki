<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card bg-secondary">
공구상태 설명
<ul style="font-size:12px;">
	<li>승인대기 : 판매자가 작성한 공구글이 관리자의 승인을 받기 전 상태</li>
	<li>심사중 : 관리자가 글을 확인한 상태</li>
	<li>승인 : 판매자가 작성한 공구글이 관리자의 승인을 받은 상태</li>
	<li>반려 : 판매자가 작성한 공구글이 관리자의 승인 거절을 받은 상태</li>
	<li>진행중 : 공구글이 게시되어 구매자를 모집하는 상태</li>
	<li>비활성화 대기 : 관리자가 공구글을 비활성화 시키고 공구글이 비활성화 되기 전 상태, 찜하기와 참여하기가 불가능함, 공구글이 숨겨지기 전에 구매자들이 공구페이지에서 공구 중지에 대한 내용을 확인 할 수 있도록 하기 위함</li>
	<li>비활성화 : 공구글이 비활성화 되어 판매자&관리자만 확인할 수 있는 상태</li>
	<li>종료 : 공구마감일이 되었거나 공구 목표 달성으로 인해 공구가 종료된 상태</li>
</ul>
</div>
<c:if test="${sessionScope.loginId eq 'system' || sessionScope.loginAuthor eq 0 }">
	<div class="">
	승인된 공구 일괄 게시 <a href="adminGonguStartAction.ad" class="btn btn-primary">게시</a>
	</div>
</c:if>
<c:if test="${sessionScope.loginAuthor eq 1 }">
	<a href="gonguRegistForm.go" class="btn btn-primary">공구등록</a>
</c:if>

<div class="list">
<c:forEach var="gongu" items="${gonguList}" varStatus="">
	<a href="adminGonguDetailViewAction.ad?gongu_id=${gongu.gongu_id}">
		<div class="card list_item d-flex">	
			<div>
				<span class="badge bg-primary">
					<c:choose>
						<c:when test="${gongu.gongu_status == '0' }">승인대기</c:when>
						<c:when test="${gongu.gongu_status == '1' }">심사중</c:when>
						<c:when test="${gongu.gongu_status == '2' }">승인</c:when>
						<c:when test="${gongu.gongu_status == '3' }">반려</c:when>
						<c:when test="${gongu.gongu_status == '4' }">진행중</c:when>
						<c:when test="${gongu.gongu_status == '5' }">비활성화 대기</c:when>
						<c:when test="${gongu.gongu_status == '6' }">비활성화</c:when>
						<c:when test="${gongu.gongu_status == '7' }">종료(공구성공)</c:when>
						<c:when test="${gongu.gongu_status == '8' }">종료(공구실패)</c:when>
					</c:choose>
				</span>
				<br>
				공구번호 : ${gongu.gongu_id}<br>
				공구상태 : 
				공구이름 : ${gongu.gongu_name }<br>
				판매자 : ${gongu.seller_id }<br>
				등록일시 : ${gongu.gongu_date }
			</div>
			<c:if test="${gongu.gongu_status ne '7' || gongu.gongu_status ne '8'}">
				<p style="color:red">*공구상태관리는 상세페이지에서 가능합니다(공구항목 클릭시 이동)</p>
			</c:if>
			</div>
	</a>
</c:forEach>
</div>
