<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<form action = "${pageContext.request.contextPath}/MemberOrderAction" method="post">
	<div class="productinfo">
		상품 카테고리:${categoryname }
		상품명:${productname }
		상품 가격:${productprice }
		남은 공구일:${productfindate-sysdate }
	</div>
	<div class="memberproductinfo">		
		상품명:${productname }
		상품수량:${count }
		공구가격:${productprice }
		예상배송일:${productcaldate+5 }
	</div>		
	<div class="memberinfo">		
		구매자 성함:${membername}
		구매자 이메일:${memberemail}
		
		* 남겨주신 정보로 공구 진행상황을 알려드립니다.
	</div>	
	

	<div id="delivery">
	배송정보 <br>
	배송지<input type="text" id="sample4_postcode" placeholder="우편번호">
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
		<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소">
		<input type="text" id="sample4_extraAddress" placeholder="참고항목"><br>
	수령인 전화번호1
		<input type="text" maxlength="3" name="tel1.1" id="tel1.1">
		<input type="text" maxlength="4" name="tel1.2" id="tel1.2">
		<input type="text" maxlength="4" name="tel1.3" id="tel1.3"><br>
	수령인 전화번호2
		<input type="text" maxlength="3" name="tel2.1" id="tel2.1">
		<input type="text" maxlength="4" name="tel2.2" id="tel2.2">
		<input type="text" maxlength="4" name="tel2.3" id="tel2.3">
<!-- 	쿠폰/포인트
	사용가능한 쿠폰
	포인트 
	결제방법-->
	주문상품 정보/총 ${count}개
	
	
	
	
	</div>
	<div>
	원가 ${originprice}
	공구 할인율 ${discount }
	포인트 ${point }
	포인트 잔액 ${userpoint}	
	결제 금액 ${price}
	
	<input type="submit" value="결제">
	</div>
	</form>
</body>
</html>