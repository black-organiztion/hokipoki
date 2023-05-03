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
이름:${member.member_name }<br>
아이디:${member.member_id }<br>
비번:${member.member_pw }<br>
번호:${member.member_tel }<br>
이메일:${member.member_email }<br>

주소지명:${delivery.delivery_name }<br>
수령자명:${delivery.receiver_name }<br>
수령자번호:${delivery.receiver_tel }<br>
수령자번호:${delivery.receiver_tel2 }<br>
우편번호:${delivery.zip_code }<br>
도로명주소:${delivery.addr1 }<br>
상세주소:${delivery.addr2 }<br>



</body>
</html>