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
	<div class="card" style="width:500px;">
		<h2>호키포키biz 회원가입</h2>
		<form action="adminJoinAction.ad" method="post">
			<div class="form_group">
				<label for="seller_id">아이디</label>
				<div class="input-group">
					<input type="text" name="seller_id" id="seller_id" class="form-control"/>
					<a href="adminIdCheck.ad" class="btn btn-danger">중복검사</a>
				</div>
			</div>
			<div class="form_group">
				<label for="seller_pw">비밀번호</label>
				<input type="password" name="seller_pw" id="seller_pw" class="form-control"/>
			</div>
			<div class="form_group">
				<label for="seller_name">회사명</label>
				<input type="text" name="seller_name" id="seller_name" class="form-control"/>
			</div>
			<div class="form_group">
				<label for="seller_number">사업자번호</label>
				<input type="text" name="seller_number" id="seller_number" class="form-control"/>
			</div>
			<input type="submit" value="가입하기"/>
		</form>
	</div>
</body>
</html>

