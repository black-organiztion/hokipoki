<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
	<a href="adminMain.ad" class="logo">
		<img src="${pageContext.request.contextPath}/img/admin/logo_hokipoki_admin.png" alt="호키포키 관리자">
		호키포키biz
	</a>
	
	<nav>
		<div class="header_item main">
			<a href="adminMain.ad">
				<span>메인</span>
				<span class="line"></span>
			</a>
		</div>
		<div class="header_item gongu">
			<a href="adminGonguListAction.ad">
				<span>공구관리</span>
				<span class="line"></span>
			</a>
		</div>
		<div class="header_item order">
			<a href="adminOrderListAction.or">
				<span>주문관리</span>
				<span class="line"></span>
			</a>
		</div>
		<div class="header_item qna">
			<a href="adminQnaListAction.ad">
				<span>문의관리</span>
				<span class="line"></span>
			</a>
		</div>
		<c:if test="${sessionScope.loginId eq 'system' || sessionScope.loginAuthor eq 0 }">
			<div class="header_item seller">
				<a href="adminSellerListAction.ad">
					<span>판매자관리</span>
					<span class="line"></span>
				</a>
			</div>
			<div class="header_item member">
				<a href="adminMemberListAction.ad">
					<span>회원관리</span>
					<span class="line"></span>
				</a>
			</div>
		</c:if>
		
	</nav>
	
	<c:if test="${loginId ne null }">
		<div class="login_nav btn-group">
			<a href="adminMyPage.ad" class="btn"><span class="icon"><i class="fa-solid fa-user"></i></span><span>${sessionScope.loginId }</span></a>
			<a href="adminLogout.ad" class="btn">logout</a>
		</div>
	</c:if>
</header>

<div class="m_menu">
	<nav>
		<div class="header_item main">
			<a href="adminMain.ad">
				<span class="icon"></span>
				<span>메인</span>
				<span class="line"></span>
			</a>
		</div>
		<div class="header_item gongu">
			<a href="adminGonguListAction.ad">
				<span class="icon"></span>
				<span>공구관리</span>
				<span class="line"></span>
			</a>
		</div>
		<div class="header_item order">
			<a href="adminOrderListAction.or">
				<span class="icon"></span>
				<span>주문관리</span>
				<span class="line"></span>
			</a>
		</div>
		<div class="header_item qna">
			<a href="adminQnaListAction.ad">
				<span class="icon"></span>
				<span>문의관리</span>
				<span class="line"></span>
			</a>
		</div>
		<c:if test="${sessionScope.loginId eq 'system' || sessionScope.loginAuthor eq 0 }">
			<div class="header_item seller">
				<a href="adminSellerListAction.ad">
					<span class="icon"></span>
					<span>판매자관리</span>
					<span class="line"></span>
				</a>
			</div>
			<!-- <div class="header_item member">
				<a href="adminMemberListAction.ad">
					<span>회원관리</span>
					<span class="line"></span>
				</a>
			</div> -->
		</c:if>
		
	</nav>
</div>