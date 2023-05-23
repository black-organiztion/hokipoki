 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="vo.Gongu" %>    
<%@ page import ="vo.Gongu_imgfile" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="gonguname">
상품명:${gongu.name }
<img src="images/${gongu.imgfile }">
상품원가:${gongu.price }
공구가격:${gongu.gongu_discount_price }
</div>
</body>
</html>