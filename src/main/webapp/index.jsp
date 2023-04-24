<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<<<<<<< HEAD
   
=======
<div id="wrap">
	<jsp:include page="/user/common/header.jsp"></jsp:include>
	<jsp:include page="<%=contentPage %>"></jsp:include>
	
	<jsp:include page="/user/common/footer.jsp"></jsp:include>
</div>
>>>>>>> branch 'master' of https://github.com/black-organiztion/hokipoki.git
</body>
</html>