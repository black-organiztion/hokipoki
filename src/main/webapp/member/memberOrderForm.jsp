<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--카카오 주소 -->
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }


</script>

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
 	배송지명:${delivery.delivery_name }
	우편번호:${delivery.zip_code }
	주소:${delivery.addr1 }
	상세주소:${delivery.addr2 } 
	
	원가 ${gongu.gongu_price }
 
 	할인율:<fmt:formatNumber value="${(gongu.gongu_price-gongu.gongu_discount_price)/gongu.gongu_price }" type="percent"/>
	공구가격:${gongu.gongu_discount_price }
	<c:set var="deliveryfee" value="0"/>
	<c:if test="${gongu.gongu_discount_price < 50000}">
	<c:set var="deliveryfee" value="2500"/>
	</c:if>
	결제 금액 ${gongu.gongu_discount_price + deliveryfee}

	
	<input type="submit" value="결제" onclick="javascript: form.action='${pageContext.request.contextPath}/memberPayment.or?gongu_id=${gongu.gongu_id}';">
	 

	</form>
</body>
</html>