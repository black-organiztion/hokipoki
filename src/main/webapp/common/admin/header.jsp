<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
	<a href="${pageContext.request.contextPath}/admin/adminTemplate.jsp" class="logo">
		<img src="${pageContext.request.contextPath}/img/admin/logo_hokipoki_admin.png" alt="호키포키 관리자">
		호키포키biz
	</a>
	
	<nav>
		<div class="header_item main">
			<a href="${pageContext.request.contextPath}/adminTemplate.jsp">
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
	</nav>
	
	<c:if test="${loginId ne null }">
		<div class="login_nav btn-group">
			<span class="btn"><span><i class="fa-solid fa-user"></i></span><span>${sessionScope.loginId }</span></span>
			<a href="adminLogout.ad" class="btn">logout</a>
		</div>
	</c:if>
</header>