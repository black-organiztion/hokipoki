<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
	<div class="inr d-flex">
		<a href="logo">호키포키 관리자페이지</a>
		<nav class="d-flex ms-auto">
			<a href="#">메뉴1</a>
			<a href="#">메뉴2</a>
			<a href="#">메뉴3</a>
			<c:if test="${loginId ne null }">
				${sessionScope.loginId }님 환영합니다. 
				<a href="adminLogout.ad">로그아웃</a>
			</c:if>			
			
		</nav>
	</div>
</header>