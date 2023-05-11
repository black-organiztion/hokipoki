<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String pageTitle = (String)request.getParameter("PAGETITLE");
String contentPage = request.getParameter("CONTENTPAGE");
pageTitle = "호키포키";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=pageTitle %></title> 
<jsp:include page="/common/common.jsp"></jsp:include>
</head>
<body>
<div id="wrap">
	<jsp:include page="/common/user/header.jsp"></jsp:include>
	<c:choose>
		<c:when test="${pagefile eq null }">
			 <c:redirect url="gonguListHome.go"/> 
			<%-- <jsp:include page="/home.jsp"></jsp:include> --%>
		</c:when>
		<c:otherwise>
			<jsp:include page="${pagefile }"></jsp:include>
		</c:otherwise>
	</c:choose>
	<jsp:include page="/common/user/footer.jsp"></jsp:include>
</div>
</body>
</html>