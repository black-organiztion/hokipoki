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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<style>
	
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}


	.delform{	
		width:322px;
		
		
		}
	
	.form_group {
	  width:100%;
	  height:62px; 
	  border-bottom:2px solid #c9c9c9;
	  
	  }
	 .form_group:not(:last-child){ margin-bottom:32px; }
	.form_group > label{
	  font-size: 18px;
	  color:gray;  
	 
	}
	.input_group{
	  width:322px; 
	  display:flex; 
	
	  }
	.input_group> *{
	  flex:0 0 auto;
	  padding-bottom:0px;
	  margin-top:3px;
	  }
	.input_group> input[type=button]{ 
	  width:70px; 
	  height:30px; 
	  background-color:orange; 
	  color:white; 
	  border:none;
	  border-radius:4px;
	  font-size:14px;
	  }
	.input_group> .form_control{
	  min-width:0;
	  flex:1 1 auto;
	  width:auto;
	  outline:none;
	  border:none;
	  font-size:18px;
	  font-weight: 500;
	  }
	  .submitbtn{
	  	width:322px;
	  	height:50px; 
	  	background-color:orange; 
	  	color:white; 
	  	border:none;
	  	border-radius:4px;
	  	font-size:18px;
	  	font-weight: 500;
	  	margin-top:32px;
	  	margin-bottom: 18px;
	  	font-weight: bold;
	  }
	.container{
		width:322px;	
		
		background-color: #fffff;
		
	}
	.tit{
		width:322px;
		height:50px;
		font-size:24px;
		font-weight: bold;
		
		text-align:center;
		margin-bottom: 20px;
	}
	.all{
		width:322px;
		border:1.5px solid #c9c9c9;
		margin:0 auto;
		padding:50px;
		border-radius: 12px;
	
	}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<form id="delform" name="delform">
		<div class="form_group">
		<label>우편번호</label>
			<div class="input_group">
		<input type="text" name="zipcode" id="sample4_postcode"  class="form_control">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호">
		</div>
		</div>

		<div class="form_group">
			<label>배송지명</label>
				<div class="input_group">
			<input type="text" name="deliveryname" id="deliveryname" class="form_control">
		</div>	
		</div>
		<div class="form_group">
		<label>수령자명</label>
			<div class="input_group">
		<input type="text" name="receivername" id="receivername" class="form_control">
		</div>
		</div>
		<div class="form_group">
		<label>전화번호1</label>
			<div class="input_group">
		 <input type="text" name = "tel11" id="tel11" maxlength="3"  class="form_control">
		<input type="text" name = "tel12" id="tel12" maxlength="4"  class="form_control">
		<input type="text" name = "tel13" id="tel13" maxlength="4"  class="form_control">
		</div>
		</div>
		<div class="form_group">
		<label>전화번호2</label>
			<div class="input_group">
		<input type="text" name = "tel21" id="tel21" maxlength="3"  class="form_control">
		<input type="text" name = "tel22" id="tel22" maxlength="4"  class="form_control">
		<input type="text" name = "tel23" id="tel23" maxlength="4" class="form_control">
		</div>
		</div>
		<div class="form_group">
		<label>도로명주소</label>	
			<div class="input_group">	
				<input type="text" id="sample4_roadAddress" readonly name="addr1"  class="form_control">	
				</div>
				</div>
				
				<div class="form_group">
				<label>상세주소</label>
					<div class="input_group">
				<input type="text" id="sample4_detailAddress"  name="addr2" class="form_control">
				</div>
				</div>
			
   <span id="guide" style="color:#ffff;"></span>	
<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
			<input type="button" value="저장" onclick="selectAddr(this.form)" class="submitbtn">	
	</form>
</div>
</body>
</html>