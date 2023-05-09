<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}

	.loginform{
	
		width:322px;
		margin:0 auto;
		}
	
	.form_group {
	  width:100%;
	  height:62px; 
	  border-bottom:2px solid #c9c9c9;
	  
	  }
	 .form_group:not(:last-child){ margin-bottom:32px; }
	.form_group > label{
	  font-size: 18px;
	  color:gray;  
	 
	}
	.input_group{
	  width:322px; 
	  display:flex; 
	
	  }
	.input_group> *{
	  flex:0 0 auto;
	  padding-bottom:0px;
	  margin-top:3px;
	  }
	.input_group> input[type=button]{ 
	  width:70px; 
	  height:30px; 
	  background-color:orange; 
	  color:white; 
	  border:none;
	  border-radius:4px;
	  font-size:14px;
	  }
	.input_group> .form_control{
	  min-width:0;
	  flex:1 1 auto;
	  width:auto;
	  outline:none;
	  border:none;
	  font-size:18px;
	  }
	  .submitbtn{
	  	width:322px;
	  	height:50px; 
	  	background-color:orange; 
	  	color:white; 
	  	border:none;
	  	border-radius:4px;
	  	font-size:18px;
	  	font-weight: 500;
	
	  	margin-top:24px;
	  	margin-bottom: 18px;
	  }
	.container{
		width:640px;
		margin: 0 auto;
		background-color: #fffff;
		border:1px solid #c9c9c9;	
		border-radius: 24px;	
		
	}
	.logo {	
		width:320px;
		text-align: center;
	}
	.logo > .img{
		margin-top: 30px;		
		margin-bottom: 52px;
	}
	.inner{		
		margin:0 auto;
		width:322px;
		background-color: white;
		border:3px solid red;
	}

</style>
</head>
<body>
	<form action="${pageContext.request.contextPath}/memberLoginAction.me" method="post" class="loginform">

		
		<div class="container">
			<div class="inner">
				<div class="logo"> 
					<img src="${pageContext.request.contextPath}/img/logo_small.png" class="img" >
			</div>
		<div class="form_group">
			<label>아이디</label>
				<div class="input_group">
					<input type="text"  class ="form_control" id="id" name="id" maxlength="30">			
				 </div>
		</div>
	
	<div class="form_group">
		<label>비밀번호</label>
			<div class="input_group">
				<input type="password" class ="form_control" id="pw" name="pw">
			</div>
		</div>
	<input type="submit" value="로그인" class="submitbtn" >			
	</div>
</div>

		

		
	
	</form>
</body>
</html>