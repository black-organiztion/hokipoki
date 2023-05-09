<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/MemberUpdate.me" method="post">
이름:<input type="text" name="member_name" value="${member.member_name }" readonly><br>
아이디:<input type="text" name="member_id" value="${member.member_id }" readonly><br>
비밀번호:<input type="text" name="member_pw" value="${member.member_pw }"><br>
전화번호:<input type="text" name="member_tel" value="${member.member_tel }" readonly><br>
이메일:<input type="text" name="member_email" value="${member.member_email }"><br>
<input type="hidden" name="delivery_id" value="${delivery.delivery_id }"><br>

배송지명:<input type="text" name="deliveryname" id="delivery_name" value="${delivery.delivery_name }"><br>
수령자명:<input type="text" name="receivername" id="receiver_name" value="${delivery.receiver_name }"><br>
수령자 전화번호<input type="text" name="receiver_tel" id="receiver_tel" value="${delivery.receiver_tel}"><br>
수령자 전화번호2<input type="text" name="receiver_tel2" id="receiver_tel2"  value="${delivery.receiver_tel2 }"><br>
우편번호:<input type="text" name="zip_code" id="zip_code" value="${delivery.zip_code}"><br>
<input type="button" value="우편번호" onclick="window.open('member/updateDeliveryForm.jsp?openInit=true','','width=400,height=200')">
도로명주소:<input type="text" name="addr1" id="addr1" value="${delivery.addr1 }"><br>
상세주소:<input type="text" name="addr2" id="addr2" value="${delivery.addr2 }"><br>
<input type="submit" value="저장">
</form>



</body>
</html>