<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
<form method="post">
	<div class="gonguinfo">
		상품 카테고리:${gongu.category }
		<a href="${pageContext.request.contextPath}/gonguView.go?id=${gongu.gongu_id}">
<img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }" id="gonguImage">
</a>상품명:${gongu.gongu_name }
		상품 가격(원가):${gongu.gongu_price }
		남은 공구일:${gongu.gongu_findate - sysdate }
	</div>
	<div class="membergonguinfo">		
		상품명:${gongu.gongu_name}
		공구가격:${gongu.gongu_discount_price}
		예상배송일:${gongu.gongu_caldate }
	</div>		
	<div class="memberinfo">		
		구매자 성함:${member.member_name}
		구매자 이메일:${member.member_email}		
		* 남겨주신 정보로 공구 진행상황을 알려드립니다.
	</div>	
	배송정보
${delivery.delivery_id }
	<input type="hidden" name="delivery_id" value="${delivery.delivery_id }">
	<input type="hidden" name="isdefault" id="isdefault" value="${delivery.isdefault }">
	
 	<input type="text" name="delivery_name" id="delivery_name" value="${delivery.delivery_name }" readonly>
 	<input type="text" name="zip_code" id="zip_code" value="${ delivery.zip_code}" readonly>
 	<input type="text" name="addr1"id="addr1" value="${ delivery.addr1}" readonly>
 	<input type="text" name="addr2" id="addr2" value="${ delivery.addr2 }" readonly>
 	
 	<input type="text" name="receiver_tel" id="receiver_tel" value="${ delivery.receiver_tel }" readonly>
 	<input type="text" name="receiver_tel2" id="receiver_tel2" value="${ delivery.receiver_tel2 }" readonly>
 	<input type="text" name="receiver_name" id="receiver_name" value="${ delivery.receiver_name }" readonly>




	<input type="button" name="addDelivery" value="배송지수정" id="addDelivery"  onclick="window.open('member/addDeliveryForm.jsp?openInit=true','','width=400,height=200')">
	
	
	
	
	
	
	원가 ${gongu.gongu_price }
 
 	할인율:<fmt:formatNumber value="${(gongu.gongu_price-gongu.gongu_discount_price)/gongu.gongu_price }" type="percent"/>
	공구가격:${gongu.gongu_discount_price }
	<c:set var="deliveryfee" value="0"/>

	<c:if test="${gongu.gongu_discount_price < 50000}">
	<c:set var="deliveryfee" value="2500"/>
	50000원 이상 구매시 배송비 무료
	</c:if>
	결제 금액 ${gongu.gongu_discount_price + deliveryfee}

	
	<input type="submit" value="결제" onclick="javascript: form.action='${pageContext.request.contextPath}/memberPayment.or?gongu_id=${gongu.gongu_id}';">
	 

	</form>
</body>
</html>