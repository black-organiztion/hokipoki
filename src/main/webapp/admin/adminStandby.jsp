<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&family=Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<style>
	@font-face {
	    font-family: 'yg-jalnan';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	html,body{width:100%; height:100%;}
	body{position:relative; background-color:#16151A; font-family: 'Roboto','Noto Sans KR', sans-serif; color:#fff;}
	.txt_box{position:absolute; top:50%; left:50%; transform:translate(-50%,-50%); text-align:center;}
	.txt_box>*:not(:last-child){margin-bottom:20px; }
	
	h1{font-family: 'yg-jalnan';}
	p{line-height:1.5;}
	
	
</style>
</head>
<body>
<div class="txt_box">
	<h1>회원가입 승인대기 중입니다.</h1>
	<p>호키포키 biz에 가입해주셔서 감사합니다. <br>현재 회원가입 승인심사 중입니다.<br>회원가입 승인은 1~2일 소요됩니다.</p>
	<a href="adminLogin.ad" class="btn btn-primary">로그인으로 돌아가기</a>
</div>


</body>
</html>