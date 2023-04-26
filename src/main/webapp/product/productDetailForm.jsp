 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="vo.Product" %>    
<%@ page import ="vo.Product_imgfile" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="productname">
상품명:${product.name }
<img src="images/${product.imgfile }">
상품원가:${product.price }
공구가격:${product.product_discount_price }

</div>
</body>
</html>