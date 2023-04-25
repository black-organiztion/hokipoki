<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="memberJoinAction.me" method="post">
<label for="id">
아이디<input type="text" id="id" name="id">  
</label
>
<label for="pw">
비밀번호<input type="password" id="pw" name="pw">
</label>

<label for="name">
이름<input type="text" id="name" name="name">
</label>

<label for="tel">
전화번호<input type="text" id="tel" name="tel">
</label>

<label for="email">
이메일<input type="text" id="email" name="email">
</label>

<label for="recommend_id">
추천인 아이디<input type="text" id="recommend_id" name="recommend_id">
</label>
<input type="hidden" id="membership_id" name="membership_id" value="e">
<input type="submit" value="회원가입">
</form>
</body>
</html>