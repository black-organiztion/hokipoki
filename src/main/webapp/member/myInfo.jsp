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


	
	.info_container{
		margin-top:10px;
		width:1000px;
	}
	.info_box{
	}
	tr{
		border-bottom: 1px solid #c9c9c9 !important;
		height: 68px;
	}
	td{
		border: 1px solid black;
		width:700px;
	}
	
	.title{
		border-bottom: 3px solid black; 
		margin-bottom: 12px;
	}
	
	.title > div{
		font-size: 26px;
		font-weight: bold;
		margin-bottom: 12px;
	}
	th{
		width:300px;
		color:#33333;
		font-size:14px;
		text-align: left;
	}
	input{
		border:none;
		background-color: transparent;
	}
	
</style>

</head>
<body>







<form action="${pageContext.request.contextPath}/MemberUpdate.me" method="post" id="memberform" name="memberform">
<div class="info_container">
	<div class="info_box">
		<div class="title">
			<div>회원정보 수정</div>
		</div>
		<div class="info_content">
			<table>
				<tr>
					<th>이름</th>
					<td><input type="text"  class ="form_control" name="member_name" value="${member.member_name }" readonly></td>
				</tr>
				
				<tr>
					<th>아이디</th>
					<td><input type="text"  class ="form_control" name="member_id" value="${member.member_id }" readonly></td>				
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text"  class ="form_control" name="member_email" value="${member.member_email }"></td>				
				</tr>				
				<tr>
					<th>비밀번호</th>
					<td><input type="text"  class ="form_control" name="member_pw" value="${member.member_pw }"></td>				
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text"  class ="form_control" name="member_tel" value="${member.member_tel }" readonly></td>				
				</tr>
				<tr>
					<th>배송지명</th>
					<td><input type="text" name="deliveryname" class ="form_control"  id="delivery_name" value="${delivery.delivery_name }"></td>				
				</tr>
				<tr>
					<th>수령자명</th>
					<td><input type="text" name="receivername"  class ="form_control" id="receiver_name" value="${delivery.receiver_name }"></td>				
				</tr>
				<tr>
					<th>수령자 전화번호</th>
					<td><input type="text" name="receiver_tel" class ="form_control"  id="receiver_tel" value="${delivery.receiver_tel}"></td>				
				</tr>
				<tr>
					<th>수령자 휴대폰번호</th>
					<td><input type="text" name="receiver_tel2"  class ="form_control" id="receiver_tel2"  value="${delivery.receiver_tel2 }"></td>				
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" name="zip_code"  readonly class ="form_control" id="zip_code" value="${delivery.zip_code}">
		<input type="button" value="수정" onclick="window.open('member/updateDeliveryForm.jsp?openInit=true','','width=380,height=400')"></td>				
				</tr>
				<tr>
					<th>도로명주소</th>
					<td><input type="text" name="addr1" class ="form_control"  readonly id="addr1" value="${delivery.addr1 }"></td>				
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" name="addr2"  class ="form_control" id="addr2" value="${delivery.addr2 }"></td>				
				</tr>
			</table>
		<input type="submit" value="저장" class="submitbtn">
		</div>	
	</div>
</div>


	</form>

</body>
</html>