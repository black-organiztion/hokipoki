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
	<div class="">
		<form action="adminLoginAction.ad" method="post">
			<div class="form_group">
				<label for="admin_id">아이디</label>
				<input type="text" name="admin_id" id="admin_id" class="form-control"/>
			</div>
			<div class="form_group">
				<label for="">비밀번호</label>
				<input type="password" name="admin_pw" id="admin_pw" class="form-control"/>
			</div>
			<input type="submit" value="로그인" class="btn btn-primary">
		</form>
		<a href="adminJoin.ad">회원가입</a>
	</div>
</body>
</html>
