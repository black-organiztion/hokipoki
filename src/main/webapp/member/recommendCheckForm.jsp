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
	opener.document.getElementById("Rid").value=v;
	opener.chkId=true;
	window.close();
}
</script>
</head>
<body onload="init()">
<form action="${pageContext.request.contextPath}/RecommendCheckProcess.me" method="post" name=f>
<input type=text name=id id=id>
<input type=submit value="중복확인">
</form>
<c:choose>
<c:when test="${useable eq 'yes' && chkId ne null }">
사용가능한 아이디입니다.
<a href="#" onclick="ok('${chkId}')">${chkId }사용하기</a>
</c:when>
<c:otherwise>
사용불가능한 아이디입니다.
</c:otherwise>
</c:choose>




</body>
</html>