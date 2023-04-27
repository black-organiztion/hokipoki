<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="gongu" items="${gonguList}" varStatus="">
	<div class="card list_item">
		${gongu.seller_author == 99? "미승인":"승인" }<br>
		${gongu.seller_id }<br>
		${gongu.seller_pw }<br>
		${gongu.seller_name }<br>
		${gongu.seller_number }
		
		<!-- 공구컨트롤버튼 : 종료아닐때만 표시 -->
		<c:if test="${gongu.gongu_status ne '7' || gongu.gongu_status ne '8'}">
			<c:if test="${gongu.gongu_status eq '0' }"><!-- 심사 : 승인대기일때만 표시 -->
				<a href="adminGongu" class="btn btn-secondary">심사</a>
			</c:if>
			<c:if test="${gongu.gongu_status eq '1' }"><!-- 승인/승인거절 : 심사일때만 표시 -->
				<a href="adminGonguCheck.ad?gonngu_id=${gonngu.gonggu_id}" class="btn btn-primary">승인</a>
				<a href="" class="btn btn-secondary">반려</a>
			</c:if>
			<c:if test="${gongu.gongu_status eq '4' }"><!-- 비활성화 : 진행중일때만 표시 -->
				<a href="" class="btn btn-secondary">비활성화</a>
			</c:if>
			<c:if test="${gongu.gongu_status ne '0' }"><!-- 수정:심사중 이후에만 표시 -->
				<a href="" class="btn btn-secondary">수정</a>
			</c:if>
		</c:if>
		
		
	</div>
</c:forEach>