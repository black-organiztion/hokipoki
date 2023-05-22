<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<style>
	
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}


	.memberform{	
		width:322px;	
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
	  width:200px;
	  outline:none;
	  border:none;
	  font-size:18px;
	  font-weight: 500;
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
	  	margin-top:32px;
	  	margin-bottom: 18px;
	  	font-weight: bold;
	  }
	.container{
		width:322px;	
		
		background-color: #fffff;
			
	}
	.tit{
		width:322px;
		height:50px;
		font-size:24px;
		font-weight: bold;
		
		text-align:center;
		margin:0 auto;
		margin-bottom: 20px;
	}
	.all{
		width:500px;
	
		margin:0 auto;
		padding:50px;
		border-radius: 12px;
	
	}

	



</style>

</head>
<body>



<div class="all">
<div class="tit">
회원정보 수정
</div>

<div class="container">

<form action="${pageContext.request.contextPath}/MemberUpdate.me" method="post" id="memberform" name="memberform">
	<div class="form_group">
		<label>이름</label>
		<div class="input_group">
		<input type="text"  class ="form_control" name="member_name" value="${member.member_name }" readonly>
		</div>
	</div>
	<div class="form_group">
		<label>아이디</label>
		<div class="input_group">
		<input type="text"  class ="form_control" name="member_id" value="${member.member_id }" readonly>
		</div>
	</div>
	<div class="form_group">
		<label>비밀번호</label>
		<div class="input_group">
		<input type="text"  class ="form_control" name="member_pw" value="${member.member_pw }">
		</div>
	</div>
	<div class="form_group">
		<label>전화번호</label>
		<div class="input_group">
		<input type="text"  class ="form_control" name="member_tel" value="${member.member_tel }" readonly>
		</div>
	</div>
	<div class="form_group">
		<label>이메일</label>
		<div class="input_group">
		<input type="text"  class ="form_control" name="member_email" value="${member.member_email }">
		</div>
	</div>
		
		
		<input type="hidden" name="delivery_id" value="${delivery.delivery_id }">
		
	
	<div class="form_group">
	<label>배송지명</label>
	<div class="input_group">
		<input type="text" name="deliveryname" class ="form_control"  id="delivery_name" value="${delivery.delivery_name }">
		</div>
	</div>
	<div class="form_group">
	<label>수령자명</label>
	<div class="input_group">
		<input type="text" name="receivername"  class ="form_control" id="receiver_name" value="${delivery.receiver_name }">
		</div>
	</div>
	<div class="form_group">
	<label>수령자 전화번호1</label>
	<div class="input_group">
		<input type="text" name="receiver_tel" class ="form_control"  id="receiver_tel" value="${delivery.receiver_tel}">
		</div>
	</div>
	<div class="form_group">
	<label>수령자 전화번호2</label>
	<div class="input_group">
		<input type="text" name="receiver_tel2"  class ="form_control" id="receiver_tel2"  value="${delivery.receiver_tel2 }">
		</div>
	</div>
	<div class="form_group">
	<label>우편번호</label>
		<div class="input_group">
		<input type="text" name="zip_code"  readonly class ="form_control" id="zip_code" value="${delivery.zip_code}">
		<input type="button" value="수정" onclick="window.open('member/updateDeliveryForm.jsp?openInit=true','','width=380,height=400')">
		</div>
	</div>
	<div class="form_group">
	<label>도로명주소</label>
	<div class="input_group">
		<input type="text" name="addr1" class ="form_control"  readonly id="addr1" value="${delivery.addr1 }">
		</div>
	</div>
	<div class="form_group">
	<label>상세주소</label>
	<div class="input_group">
		<input type="text" name="addr2"  class ="form_control" id="addr2" value="${delivery.addr2 }">
		</div>
	</div>
	
		<input type="submit" value="저장" class="submitbtn">


	</form>
	</div>
	</div>
</body>
</html>