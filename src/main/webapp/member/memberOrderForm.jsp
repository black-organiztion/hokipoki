<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500,600&display=swap" rel="stylesheet">  
<title>Insert title here</title>
<style>
	.outer{
		margin:0 auto;
		padding-top:40px;
		width:1200px;		
		border:1px solid red;
	}
	.gongu{
		display:flex;	
	}
	.th{		
		width:180px;
		height: 180px;
		margin-right: 20px;
	}
	#gonguImage{
		width: 180px;
		height: 180px;
	}
	
	.gongu_cate{
		font-size:12px;
		color:#c9c9c9;
	}
	.gongu_name{
		font-size:21px;		
	}
	.extra{
		color:#c9c9c9;
		font-size: 12px;
		margin-top:16px;
		margin-bottom: 46px;
	}
	
	.gongu_findate{
	
	}
	.gongu_num{
		display:flex;
		align-items: baseline;
	}
	.gongu_price{
		font-size:24px;
		font-weight: 500;
		margin-right: 12px;
	}
	
	.bottom{
		margin-top:50px;
		width:1200px;
		display:flex;
		border:1px solid black;
		justify-content: space-between;
	}
	.left_side{
		width:600px;
		border: 2px solid blue;
	}
	.right_side{
		width:460px;
		border: 2px dashed blue;
	}
	.etc{
		font-size:12px;
		color:#494949;
		margin-bottom: 20px;
	}
	input {
border:0 solid black;	
}

.search_in{display: block;margin: 1px 2px 3px 4px;} 

.search_in input{width:100%}

	
</style>

</head>
<body>
<div class="outer">
		<div class="gongu">
			<div class="th">
				<a href="${pageContext.request.contextPath}/gonguView.go?id=${gongu.gongu_id}">
				<img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }" id="gonguImage">
				</a>
			</div>
			<div class="gongu_info">
				<div class="gongu_cate">				
					${gongu.category }
				</div>
				<div class="gongu_name">				
					${gongu.gongu_name }
				</div>
				<div class="extra">				
					공구 성공시, 결제는 ${gongu.gongu_caldate }에 진행됩니다.<br> 공구가 무산되거나 중단된 경우에는 예약된 결제는 자동으로 취소됩니다.
					이용에 참고 부탁드립니다.					
				</div>
				<div class="gongu_num">				
					<div class="gongu_price">				
						${gongu.gongu_discount_price }
					</div>
					<div class="gongu_findate">				
						${gongu.gongu_findate}
					</div>
				</div>	
			</div>
	</div>
	<div class="bottom">
		<div class="left_side">
			<div class="gongusanse_outer">
				<div class="gongusanse">
					<div class="sanse_title">
						공구명
					</div>
					<div class="sanse_content">
						${gongu.gongu_name}
					</div>
				</div>
				<div class="gongusanse">
					<div class="sanse_title">
						공구 가격
					</div>
					<div class="sanse_content">
						${gongu.gongu_discount_price}
					</div>
				</div>
				<div class="gongusanse">
					<div class="sanse_title">
						예상 결제일
					</div>
					<div class="sanse_content">
						${gongu.gongu_caldate}
					</div>
				</div>
			</div>
			<div class="delivery_info">
				<form method="post">
					<input type="hidden" name="delivery_id" value="${delivery.delivery_id }">
					<input type="hidden" name="isdefault" id="isdefault" value="${delivery.isdefault }">
					
				 	<input type="text" name="delivery_name" id="delivery_name" value="${delivery.delivery_name }" readonly>
				 	<div class="addr">
				 		<span class="search_in"><input type="text" name="zip_code" id="zip_code" value="${ delivery.zip_code}" readonly></span>
					 	<input type="text" name="addr1"id="addr1" value="${ delivery.addr1}" readonly>
					 	<input type="text" name="addr2" id="addr2" value="${ delivery.addr2 }" readonly>
					 	                   
					 	<input type="text" name="receiver_tel" id="receiver_tel" value="${ delivery.receiver_tel }" readonly>
					 	<input type="text" name="receiver_tel2" id="receiver_tel2" value="${ delivery.receiver_tel2 }" readonly>
					 	<input type="text" name="receiver_name" id="receiver_name" value="${ delivery.receiver_name }" readonly>
				 	</div>
					 	
				
				
				
				
					<input type="button" name="addDelivery" value="배송지수정" id="addDelivery"  onclick="window.open('member/addDeliveryForm.jsp?openInit=true','','width=400,height=200')">	
				</form>
			</div>
		</div>
		<div class="right_side">
			<div class="etc">
				공구 성공시, 결제는 ${gongu.gongu_caldate }에 진행됩니다.<br> 공구가 무산되거나 중단된 경우, 예약된 결제는 자동으로 취소되며
				해당 공구에 대한 진행권한은 판매당사자에 있습니다.
			</div>
			<form id="checks">	
				<input type="checkbox">&nbsp; 개인정보 제3자 제공동의 <br>
				<input type="checkbox">&nbsp; 공구 유의사항 확인
			</form>
		</div>
	</div>
	
</div>	
	

	
		구매자 성함:${member.member_name}
		구매자 이메일:${member.member_email}		
		* 남겨주신 정보로 공구 진행상황을 알려드립니다.
	
	배송정보
${delivery.delivery_id }

	
	
	
	
	
	
	
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
</div>
</body>
</html>