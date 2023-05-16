<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Gongu" %>        
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--카카오 주소 -->
<script>
 
function selectAddr(f){
	
	opener.document.getElementById("delivery_name").value=f.deliveryname.value;
	opener.document.getElementById("zip_code").value=f.sample4_postcode.value;
	opener.document.getElementById("addr1").value=f.addr1.value;
	opener.document.getElementById("addr2").value=f.addr2.value;
 	 opener.document.getElementById("receiver_tel").value=f.tel11.value+f.tel12.value+f.tel13.value ;
	opener.document.getElementById("receiver_tel2").value=f.tel21.value+f.tel22.value+f.tel23.value ; 
	opener.document.getElementById("receiver_name").value=f.receivername.value;
	opener.document.getElementById("isdefault").value=0;//배송지 추가하면 isdefault는 0으로 설정
	opener.document.getElementById("zip").innerHTML  = "["+f.sample4_postcode.value+"]";
	opener.document.getElementById("juso1").innerHTML  = f.addr1.value;
	opener.document.getElementById("juso2").innerHTML  = f.addr2.value;
	opener.document.getElementById("r_tel").innerHTML  = f.tel11.value+f.tel12.value+f.tel13.value;
	opener.document.getElementById("r_tel2").innerHTML  = f.tel21.value+f.tel22.value+f.tel23.value; 
	opener.document.getElementById("dname").innerHTML  = f.deliveryname.value;
	opener.document.getElementById("def").innerHTML  = "신규";
	window.close(); 
}

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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form>

<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>

<input type="text" name="deliveryname" id="deliveryname"placeholder="배송지명">
<input type="text" name="receivername" id="receivername"placeholder="수령자명">
<input type="text" name="zipcode" id="sample4_postcode" placeholder="우편번호">
 전화번호1<input type="text" name = "tel11" id="tel11" maxlength="3">
<input type="text" name = "tel12" id="tel12" maxlength="4">
<input type="text" name = "tel13" id="tel13" maxlength="4"><br>
전화번호2<input type="text" name = "tel21" id="tel21" maxlength="3">
<input type="text" name = "tel22" id="tel22" maxlength="4">
<input type="text" name = "tel23" id="tel23" maxlength="4">

		<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr1">	
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="addr2">
	<input type="button" value="저장" onclick="selectAddr(this.form)">
	
	
	
	</form>
</body>
</html>