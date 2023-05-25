<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호키포키biz</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&family=Roboto&display=swap" rel="stylesheet">
<style>
	@font-face {
	    font-family: 'yg-jalnan';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	html,body{width:100%; height:100%;}
	body{position:relative; background-color:#16151A; overflow:hidden; font-family: 'Roboto','Noto Sans KR', sans-serif;}

	
	.login_form{position:fixed; top:50%; left:50%; transform:translate(-50%,-50%); padding:35px 60px 50px 60px; border:1px solid rgba(255,255,255,0.1); border-radius:30px; background-color:rgba(255,255,255,0.3); backdrop-filter:blur(10px);}
	.login_form form{display:flex; flex-direction:column; width:400px; margin-bottom:40px;}
	.logo{margin-bottom:20px; font-size:0; text-align:center;}
	.logo>img{max-width:100%;}
	.frm_group{display:flex; flex-direction:column; margin-bottom:15px; padding:10px 16px; border-radius:15px; background-color:rgba(22,21,26,0.8);}
	.frm_group:focus-within{outline:2px solid #3273F1;}
	.frm_group label{margin-bottom:8px; color:#7B8083; font-size:14px;}
	.frm_group .frm_control{ border:none; background-color:transparent; color:#fff; font-size:18px;}
	input:focus-visible{outline:none;}
	.btn{padding:20px 30px; border:none; border-radius:15px; background-color:#3273F1; color:#fff; font-size:18px;}
	.join{display:flex; justify-content:center; align-items:baseline; color:#fff; font-size:14px;}
	.join>a{margin-left:15px; font-size:20px; font-family: 'yg-jalnan'; color:#fff; text-decoration:none;}
	.join>a:hover{text-decoration:underline;}
</style>
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
<%
String alert = request.getParameter("alert");
if(alert != null && alert.equals("exist")){
%>
<script>
	alert('회원가입이 완료되었습니다.\n회원가입 승인까지 1~3일 소요됩니다.');
</script>
<%
} 
%>

<div class="login_form">
	<h1 class="logo"><img src="${pageContext.request.contextPath}/img/admin/logo_white.svg"/>호키포키biz</h1>
	<form action="adminLoginAction.ad" method="post">
		<div class="frm_group">
			<label for="seller_id">ID</label>
			<input type="text" name="seller_id" id="seller_id" class="frm_control" required/>
		</div>
		<div class="frm_group">
			<label for="seller_pw">PASSWORD</label>
			<input type="password" name="seller_pw" id="seller_pw" class="frm_control" required/>
		</div>
		<input type="submit" value="로그인" class="btn">
	</form>
	<div class="join">
		<span>아직 호키포키biz의 회원이 아니신가요?</span>
		<a href="adminJoin.ad">회원가입</a>
	</div>
	
</div>
	

</body>
</html>