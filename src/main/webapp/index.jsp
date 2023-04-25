<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String pageTitle = (String)request.getParameter("PAGETITLE");
String contentPage = request.getParameter("CONTENTPAGE");
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
	<jsp:include page="/user/common/header.jsp"></jsp:include>
	<jsp:include page="${pagefile eq null ? 'main.jsp':pagefile }"></jsp:include>
	<jsp:include page="/user/common/footer.jsp"></jsp:include>
</div>
</body>
</html>