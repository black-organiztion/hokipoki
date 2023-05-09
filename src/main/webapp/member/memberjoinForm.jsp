<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<!--카카오 주소 -->
<script>
$(function(){
	$('.pw').keyup(function(){
		let pass1=$("#pw").val();
		let pass2=$("#chkpw").val();
		
		if(pass1 != "" || pass2 != ""){
			if(pass1 == pass2){
				$("#checkPw").html('일치');
				$("#checkPw").attr('color','green');
			}else{
				$("#checkPw").html('불일치');
				$("#checkPw").attr('color','red');
			}
			
		}
		
	});
});


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

var chkId=false;
var idCheck;
function chkForm(f){
   if(!chkId || idcheck!=f.id.value.trim()){
      alert("아이디 중복을 확인하세요.");
      return false;
   }
   
   if(f.pw.value.trim()==""){
      alert('비밀번호를 입력하세요.');
      f.pw.focus();
      
      return false;
      
   }
   if(f.pw.value.trim()!=f.pw.value.trim()){
      alert('비밀번호가 일치하지 않습니다.');
      f.pw.value="";
      f.passChk.value="";
      f.pw.focus();
      return false;
   }

   f.submit();
} 

    
</script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>

<form action="${pageContext.request.contextPath}/memberJoinAction.me" method="post" name="joinform">
	<label for="id"> 
		아이디<input type="text" id="id" name="id" maxlength="30" >			
	</label>
		<input type="button" name="idCheck" value="아이디 중복확인" id="idCheck" onclick="window.open('${pageContext.request.contextPath}/member/memberIdcheckForm.jsp?openInit=true','','width=400,height=200')">

<label for="pw">
비밀번호<input type="password" class ="pw" id="pw" name="pw">
</label>

<label for="pw">
비밀번호 확인<input type="password" class ="pw" id="chkpw" name="chkpw">
<font id="checkPw" size="2"></font>
</label>

<label for="name">
이름<input type="text" id="name" name="name">
</label>

<label for="tel">
전화번호<input type="text" id="tel" name="tel">
</label>

<label for="email">
이메일<input type="text" id="email" name="email">
</label>

<label for="recommend_id">
추천인 아이디<input type="text" id="Rid" name="recommend_id">
</label>
<input type="button" name="idCheck" value="추천인 아이디확인" id="idCheck" onclick="window.open('${pageContext.request.contextPath}/member/recommendCheckForm.jsp?openInit=true','','width=400,height=200')">
<input type="hidden" id="membership_id" name="membership_id" value="e">


<input type="text" name="deliveryname" placeholder="배송지명">
<input type="text" name="receivername" placeholder="수령자명">
<input type="text" name="zipcode" id="sample4_postcode" placeholder="우편번호">
전화번호1<input type="text" name = "tel1.1">
<input type="text" name = "tel1.2">
<input type="text" name = "tel1.3"><br>
전화번호2<input type="text" name = "tel2.1">
<input type="text" name = "tel2.2">
<input type="text" name = "tel2.3">

		<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr1">	
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="addr2">
		

<input type="submit" value="가입" >
<!-- <input type="button" value="가입" onClick="chkForm(this.form)"> -->
<a href ="javascript:joinform.reset()">다시작성</a>

</form>
</body>
</html>