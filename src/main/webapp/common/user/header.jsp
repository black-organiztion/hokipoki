<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>        
<header id="header">
	<div class="inr d-flex">
		<a href="logo">호키포키</a>
		<nav class="d-flex ms-auto">
			<a href="${pageContext.request.contextPath}/gonguList.go">메뉴1</a>
			<a href="#">메뉴2</a>
			<a href="#">메뉴3</a>
			<c:choose>			
				<c:when test="${member_id ne null }">
					<a href="${pageContext.request.contextPath}/myInfo.me">${member_id }</a>님 환영합니다.
					<a href="${pageContext.request.contextPath}/memberLogout.me">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/memberLogin.me">로그인</a>
					<a href="${pageContext.request.contextPath}/memberJoin.me">회원가입</a>
				</c:otherwise>
			</c:choose>			
		</nav>
		<a href="adminLogin.ad" class="btn btn-primary">호키포키 biz</a>
	</div>
</header>