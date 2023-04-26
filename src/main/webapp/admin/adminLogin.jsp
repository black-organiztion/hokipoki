<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/common/common.jsp"></jsp:include>
</head>
<body>
<%-- <%
String joinResult = (String)request.getParameter("joinResult");
System.out.println(joinResult);

if(joinResult.equals("true")){%>
 <script>
 	alert('회원가입이 신청되었습니다. 회원가입 승인까지 1~3일 소요됩니다.');
 </script>
<%	
}
%> --%>
	<div class="card" style="width:500px;">
		<h2>호키포키biz 로그인</h2>
		<form action="adminLoginAction.ad" method="post">
			<div class="form_group">
				<label for="seller_id">아이디</label>
				<input type="text" name="seller_id" id="seller_id" class="form-control" required/>
			</div>
			<div class="form_group">
				<label for="">비밀번호</label>
				<input type="password" name="seller_pw" id="seller_pw" class="form-control" required/>
			</div>
			<input type="submit" value="로그인" class="btn btn-primary">
		</form>
		<a href="adminJoin.ad">회원가입</a>
	</div>

</body>
</html>
