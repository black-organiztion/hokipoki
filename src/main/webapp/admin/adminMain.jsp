<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(){
		//header 메뉴 active
		$("#header .header_item").removeClass("active");
		$("#header .main").addClass("active");
		
	});
</script>

<div id="content" class="container">
	<div class="row">
		<c:choose>
			<c:when test="${loginAuthor eq 0 }">
				<div class="section col-3">
					<h5>공구승인대기</h5>
					<div class="card">
						공구승인 대기건수
					</div>
				</div>
				<div class="section col-3">
					<h5>회원가입대기</h5>
					<div class="card">
						판매자 회원가입 승인 대기 건수
					</div>
				</div>
				<div class="section col-3">
					<h5>마감임박 공구</h5>
					<div class="card">
						마감임박 공구 목록
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="section col-3">
					<h5>공구현황</h5>
					<div class="card">
						진행중인 공구 목록
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="section col-3">
			<h5>문의현황</h5>
			<div class="card">
				미응답 문의 건수
			</div>
		</div>
	</div>
</div>