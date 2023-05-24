<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{
		width:1200px;
		height:500px;
		margin: 0 auto;
		margin-top: 60px;
	}
	.pwcontainer{
		width:500px;
		height:200px;
		margin:0 auto;

	}
	.title{
		width:500px;
		font-size:20px;
		weight:500;
		text-align: center;
		margin-bottom: 30px;
	}
	input{
		border: 0px solid black;
		background-color: transparent;	
		height:38px;
		font-size:20px;
		width:280px;
		outline: none;
	}
	.input_box{		
		background-color: #f1f1f1;
		margin-left:55px;
		width:300px !important;
		height:40px;
		display:flex;
		padding-left: 10px;		
		align-items: center;
	}
	.pw_input{
		display:flex;
	
	}
	form{
		display:flex;
	}
	#submit_btn{
		width:70px;
		height:40px;
		font-size:18px;
		text-align: center;
		border:1.5px solid gray;
	}
	

</style>
</head>
<body>
<div class="container">
	<div class="pwcontainer">
		<div class="title">
			비밀번호 확인		
		</div>
		<div class="input_box">
			<div class="pw_input">
				<form method="post" action="${pageContext.request.contextPath}/infoPwChk.me">
					<input type="password" name="pw" style="margin-right: 35px;">	
					<input type="submit" value="확인" id="submit_btn">		
				</form>			
			</div>
		</div>
	</div>


</div>


</body>
</html>