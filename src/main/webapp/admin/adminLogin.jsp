<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


%>
<div class="">
	<form action="adminLoginAction.do" method="post">
		<div class="input-group">
			<label for="admin_id">아이디</label>
			<input type="text" name="admin_id" id="admin_id" class="form-group"/>
		</div>
		<div class="input-group">
			<label for="">비밀번호</label>
			<input type="password" name="admin_pw" id="admin_pw" class="form-group"/>
		</div>
		<input type="submit" value="로그인" class="btn">
	</form>
	<a href="adminJoin.do">회원가입</a>
</div>