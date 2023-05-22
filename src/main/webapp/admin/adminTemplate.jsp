<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String pageTitle = (String)request.getParameter("PAGETITLE");
pageTitle = "호키포키 관리자";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=pageTitle %></title>
<jsp:include page="/common/common_admin.jsp"></jsp:include>
</head>
<body>
<%
if(session.getAttribute("loginId") == null){
%>
<script>
	alert("로그인이 필요합니다.");
	location.href="adminLogin.ad";
</script>
<%
}%>
<div id="wrap">
	<jsp:include page="/common/admin/header.jsp"></jsp:include>
	<jsp:include page="${pagefile eq null ? 'main.jsp':pagefile }"></jsp:include>
	<%-- <jsp:include page="/common/admin/footer.jsp"></jsp:include> --%>
</div>
</body>
</html>