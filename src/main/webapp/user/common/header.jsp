<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>        
<header id="header">
	<div class="inr d-flex">
		<a href="logo">호키포키</a>
		<nav class="d-flex ms-auto">
			<a href="#">메뉴1</a>
			<a href="#">메뉴2</a>
			<a href="#">메뉴3</a>			
			<a href="${pageContext.request.contextPath}/memberLogin.me">로그인</a>			
			<a href="${pageContext.request.contextPath}/memberJoin.me">회원가입</a>
		</nav>
	</div>
</header>