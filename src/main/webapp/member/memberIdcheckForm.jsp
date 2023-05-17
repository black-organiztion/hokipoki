<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
request.setCharacterEncoding("utf-8");
String openInit="false";
if(request.getParameter("openInit")!=null){
	openInit="true";
}
%>
<script>

function init(){
	if(<%=openInit%>){
		document.getElementById("id").value=opener.document.getElementById("id").value;
	}
	
}
function ok(v){
	opener.idcheck=v.trim();
	opener.document.getElementById("id").value=v;
	opener.chkId=true;
	window.close();
}
</script>
<style>
	.submitbtn{
		width:50px;
	  	height:24px; 
	  	background-color:orange; 
	  	color:white; 
	  	border:none;
	  	border-radius:4px;
	  	font-size:12px;	  	
	  	margin-top:32px;
	  	margin-bottom: 18px;
	  	font-weight: bold;
	}
</style>
</head>
<body onload="init()">
<form action="${pageContext.request.contextPath}/MemberIdCheckProcess.me" method="post" name=f>
<input type=text name=id id=id>
<input type=submit class="submitbtn" value="확인">
</form>
<c:choose>
<c:when test="${useable eq 'yes' }">
사용가능한 아이디입니다.
<a href="#" onclick="ok('${chkId}')">${chkId }사용하기</a>
</c:when>
<c:otherwise>
사용불가능한 아이디입니다.
</c:otherwise>
</c:choose>




</body>
</html>