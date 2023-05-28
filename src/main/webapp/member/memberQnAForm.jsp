<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		width:1000px;
		height:500px;
		border:1px dashed black;
		border-collapse: collapse;
	}
	th{
		text-align: left;
		width:150px;
		padding-left: 10px;
	}
	tr{
		border-bottom: 1px solid black;
	}
	input{
		border:0px solid black;
		outline: none;
		background-color: transparent;
		font-size:18px;
	}
	.input_box{
		width:500px;
		background-color: #d1d1d1;
		align-items: center;
		height:45px;
	}
	textarea{
		height:300px;
	}
</style>
</head>
<body>
<form method="post">
<table>
	<tr style="height:50px;">
		<th>회원정보</th>
		<td>${member.member_name }</td>
	</tr>
	<tr style="height:50px;">
		<th>문의유형</th>
		<td>
			<div class="input_box">
				<select>
					<option value="0">
						배송문의
					</option>
					<option value="">
						주문문의
					</option>
					<option value="">
						반품문의
					</option>
					<option value="">
						기타
					</option>				
				</select>
			</div>	
		</td>
	</tr>
	<tr style="height:50px;">
		<th>제목</th>
		<td>
			<div class="input_box">
				<input type="text" name="subject">
			</div>	
		</td>
	</tr>
	<tr style="height:250px;">
		<th>문의내용</th>
			<td>
				<div class="input_box">
					<textarea name="contents"></textarea>
				</div>
			</td>
	</tr>
	<tr style="height:50px;">
		<th>파일첨부</th>
		<td>
			<div class="input_box">
				<input type="file" name="qnafiles">
			</div>
		</td>
	</tr>				

</table>
<input type="submit" value="등록">
</form>
</body>
</html>