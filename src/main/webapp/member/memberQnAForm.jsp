<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	qnaform{
		width:1000px;
		height:550px;
	}
	table{
		width:1000px;
		height:500px;
		border-collapse: collapse;
		border-bottom: 3px solid black;
	}
	th{
		text-align: left;
		width:150px;
		padding-left: 10px;
	}
	tr{
		border-bottom: 1px solid #d1d1d1 !important;
	}
	input{
		border:0px solid black;
		outline: none;
		background-color: transparent;
		font-size:18px;
	}
	select{
		font-size: 14px;
	}
	.input_box{
		width:600px;
		align-items: center;
		height:45px;
		display:flex;
	}
	textarea{
		width:600px;
		height:250px;
		border:1px solid #d4d4d4;
	}
	
	.sub_btn{
		width:80px;
		height:30px;
		background-color: black;
		color:white;
		cursor: pointer;
	}
	.radios{
		width:600px;
		display:flex;
		justify-content: space-between;
	}

</style>
</head>
<body>
<form method="post" class="qnaform" action="${pageContext.request.contextPath}/memberQuestionAction.qu" enctype="multipart/form-data">
<table>
	<tr style="height:50px; border-top: 3px solid black;">
		<th>회원정보</th>
		 <td>${member.member_name }</td>
	</tr>
	<tr style="height:50px;">
		<th>문의유형</th>
		<td >
			<div class="input_box">
				<div class="radios">
					<input type="radio" name="qna_category" value="0" checked="checked">공구문의
					<input type="radio" name="qna_category" value="1">주문문의
					<input type="radio" name="qna_category" value="2">배송문의
					<input type="radio" name="qna_category" value="3">교환/환불문의
					<input type="radio" name="qna_category" value="4">결제
					<input type="radio" name="qna_category" value="5">기타
				</div>
			</div>	
		</td>
	</tr>
	<tr style="height:50px;">
		<th>제목</th>
		<td>
			<div class="input_box" style= "border:1px solid #d4d4d4; height:30px;">
				<input type="text" name="qna_subject" >
			</div>	
		</td>
	</tr>
	
	<tr style="height:250px;">
		<th>문의내용</th>
			<td>
				<div class="input_box">
					<textarea name="qna_content"></textarea>
				</div>
			</td>
	</tr>
	<tr style="height:50px; border-bottom:3px solid black;">
		<th>파일첨부</th>
		<td>
			<div class="input_box">
				<input type="file" name="qna_file" style="font-size: 12px;">
			</div>
		</td>
	</tr>				

</table>
<div class="btn_containter" style="text-align: center; padding-top: 10px;">
<input class="sub_btn" type="submit" value="등록">
</div>
</form>
</body>
</html>