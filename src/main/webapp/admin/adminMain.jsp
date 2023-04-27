<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">
<c:choose>
	<c:when test="${loginAuthor eq 0 }">
		<h1>관리자 페이지 입니다.</h1>	
		<a href="adminSellerListAction.ad" class="btn btn-primary">판매자관리</a>
		<a href="adminMemberListAction.ad" class="btn btn-info">회원관리</a>
		
	</c:when>
	<c:otherwise>
		<h1>판매자 페이지 입니다.</h1>
	</c:otherwise>
</c:choose>
<a href="gonguListAction.go" class="btn btn-warning">공구관리</a>
<a href="orderListAction.or" class="btn btn-success">주문관리</a>
<a href="qnaListAction.ad" class="btn btn-danger">문의관리</a>
</div>