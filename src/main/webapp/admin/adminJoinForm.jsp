<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호키포키biz</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&family=Roboto&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<style>
	@font-face {
	    font-family: 'yg-jalnan';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	html,body{width:100%; height:100%;}
	body{position:relative; background-color:#16151A; overflow:hidden; font-family: 'Roboto','Noto Sans KR', sans-serif;}
	#wrap{display:flex; height:100%;}
	.img{flex:1 1 auto; height:100%; background:orange;}
	.join_form {align-self:center; width:60%; padding:0 130px;}
	.join_form form{display:flex; flex-direction:column;}
	.logo{margin-bottom:30px; font-size:0;}
	.logo>img{max-width:100%;}
	.join_form form>fieldset+fieldset{margin-top:35px;}
	.join_form form>fieldset>div:not(.w-100){margin-bottom:15px;}
	.join_form form>fieldset>legend{margin-bottom:15px; color:#d9d9d9; font-size:18px; font-family: 'yg-jalnan';}
	.frm_group{display:flex; flex-direction:column; padding:10px 16px; border:2px solid transparent; border-radius:15px; background-color:rgba(255,255,255,0.12); box-sizing:border-box;}
	.frm_group:focus-within{border:2px solid #3273F1;}
	.input_group{display:flex;}
	.frm_group label{margin-bottom:8px; color:#7B8083; font-size:14px;}
	.frm_group .frm_control{ border:none; background-color:transparent; color:#fff; font-size:18px;}
	input:focus-visible{outline:none;}
	.btn_group{display:flex; justify-content:center; margin-top:50px;}
	.btn_group .btn{min-width:208px; margin:0 5px; padding:20px 30px; border:none; border-radius:15px; background-color:#393941; color:#fff; font-size:18px;}
	.btn_join{background-color:#3273F1!important;}
	.btn_group .btn:hover{opacity:0.8;}
	.join_form>p{margin:55px 0 0 0; text-align:center; color:#fff; font-size:16px;}
	
	.frm_group.id{flex-direction:row; align-items:center;}
	.frm_group.id>.input_group{flex-direction:column; width:100%; }
	.frm_group.id #idChk{flex:0 0 auto; padding:10px 14px;border:none; border-radius:8px; background-color:rgba(255,255,255,0.2); color:#fff; font-size:16px; }
	.frm_group.id #idChk:hover{background-color:rgba(255,255,255,0.3);}
	
	/*form_validation*/
	.frm_group.pass{border:2px solid #5ECA7C;}
	.frm_group.fail{border:2px solid #FF5C5C;}
	.frm_vld_txt{display:none; align-items:center; margin:10px 0 0 0; color:#D9D9D9; font-size:14px;}
	.frm_vld_txt:before{content:''; flex:0 0 auto; width:18px; height:18px; border-radius:50%; margin-right:4px;}
	.frm_group.pass+.frm_vld_txt,.frm_group.fail+.frm_vld_txt{display:flex;}
	.frm_group.pass+.frm_vld_txt:before{border:1px solid #5ECA7C; background:url(./img/admin/login/ic_check.svg) no-repeat center;}
	.frm_group.fail+.frm_vld_txt:before{border:1px solid #FF5C5C; background:url(./img/admin/login/ic_close.svg) no-repeat center;}
	
</style>
</head>
<body>
	<div id="wrap">
		<div class="img">
		</div>
		<div class="join_form container-fluid">
			<h1 class="logo"><img src="${pageContext.request.contextPath}/img/admin/logo_white.svg"/>호키포키biz</h1>
			<form id="form" action="adminJoinAction.ad" method="post">
				<fieldset class="row">
					<legend>호키포키biz에서 사용하실 계정정보를 입력해주세요</legend>
					<div class="col-12 col-lg-6">
						<div class="frm_group">
							<label for="seller_id">ID</label>
							<input type="text" name="seller_id" id="seller_id" class="frm_control" required/>
						</div>
						<p class="frm_vld_txt"></p>
					</div>
					<div class="w-100"></div>
					<div class="col-12 col-lg-6">
						<div class="frm_group">
							<label for="seller_pw" class="label">PASSWORD</label>
							<input type="password" name="seller_pw" id="seller_pw" class="frm_control" required/>
						</div>
						<p class="frm_vld_txt"></p>
					</div>
					<div class="col-12 col-lg-6">
						<div class="frm_group">
							<label for="seller_pw_ck">PASSWORD 확인</label>
							<input type="password" name="seller_pw_ck" id="seller_pw_ck" class="frm_control" required/>
						</div>
						<p class="frm_vld_txt"></p>
					</div>
				</fieldset>
				<fieldset class="row">
					<legend>회사정보를 입력해주세요</legend>
					<div class="col-12 col-lg-6">
						<div class="frm_group">
							<label for="seller_name">회사명</label>
							<input type="text" name="seller_name" id="seller_name" class="frm_control" required/>
						</div>
						<p class="frm_vld_txt"></p>
					</div>
					<div class="col-12 col-lg-6">
						<div class="frm_group">
							<label for="seller_number">사업자등록번호</label>
							<input type="text" name="seller_number" id="seller_number" class="frm_control" required/>
						</div>
						<p class="frm_vld_txt"></p>
					</div>
				</fieldset>
				<div class="btn_group">
					<button type="button" class="btn" onclick="javascript:history.back()">취소</button>
					<button id="btn_submit" type="button" class="btn btn_join">가입신청</button>
				</div>
			</form>		
			<p>가입신청 후 승인까지 1~2일 정도 소요됩니다.</p>
		</div>
	</div>
	
	<script>
	
	//회원가입 정규식
	const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/); // [허용문자], {최소문자길이, 최대 문자길이}
	const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);// 숫자가 먼저오고 뒤에 특수문자가 옴 or 특수문자가 먼저오고 숫자가 옴 2가지 방법으로 제약 사항 설정
	
	//회원가입 validation check
	let id = false, pw = false, pw_ck = false, name = false, number = false; 
	
	$(function(){
		/*아이디 중복 체크*/
		$("#seller_id").keyup(function(){//키를 입력하고 땔 때 마다 이벤트 발생
			var frmGroup = $(this).parents(".frm_group");
			//console.log(frmGroup);
			
			if($(event.target).val() === ''){//1. 아이디 빈값 체크
				//console.log('비어있음');
				frmGroup.removeClass("pass").addClass("fail");
				frmGroup.next(".frm_vld_txt").text("아이디를 입력해주세요.");
				
				id = false;
				
			}else if(!getIdCheck.test($(event.target).val())){//2. 유효성 검증
				frmGroup.removeClass("pass").addClass("fail");
				frmGroup.next(".frm_vld_txt").text("아이디는 4-14자의 영문/숫자 조합만 가능합니다.");
				
				id = false;
				
			}else{//아이디 중복체크
				//1,2에서 통과된 아이디 저장
				const checkId = $(event.target).val();
			
				//ajax호출
				$.ajax({
					type:'POST', //서버 전송 방식
					url: 'adminSellerIdCheck.ad', //서버 요청 url
					// 요청을 받을 controller가 있어야함
					/* headers:{
						// 객체 전달 (JSON형태로 보냄)
						'Content-Type' : 'application/json' //json형태로 보내고 싶으면 이렇게 지정해줘야함
					}, */
					dataType:'text', //서버로 부터 응답받을 데이터 형식
					data:{//서버에 전송할 데이터(사용자가 입력한 id)
						"seller_id":checkId
					},
					success: function(result){ //성공시 실행할 내용, result(매개변수)에 성공 데이터 저장
						//controller가 리턴한 값을 result에 저장
						console.log('ajax통신성공');
						console.log(result);
						
						if(result === 'Avaliable'){//동일한 아이디 없음
							frmGroup.removeClass('fail').addClass("pass");
							frmGroup.next(".frm_vld_txt").text("사용가능한 아이디입니다.");
							
							id = true;
							
						}else{//동일한 아이디 있음
							frmGroup.removeClass("pass").addClass("fail");
							frmGroup.next(".frm_vld_txt").text("사용할 수 없는 아이디입니다.");
							
							id = false;
						}
						
					},
					error: function(status,error){//실패시 실행할 내용
						console.log("ajax통신실패");
						console.log(status,error);
						
					}
				});
			
			} 
			
		});
		
		/*비밀번호 유효성*/
		$("#seller_pw").keyup(function(){
			var frmGroup = $(this).parents(".frm_group");
			
			if($(event.target).val() === ''){//빈값 체크
				frmGroup.removeClass("pass").addClass("fail");
				frmGroup.next(".frm_vld_txt").text("비밀번호를 입력해주세요.");
				
				pw = false;
				
			}else if(!getPwCheck.test($(event.target).val() || $(event.target).val().length<6)){
				frmGroup.removeClass("pass").addClass("fail");
				frmGroup.next(".frm_vld_txt").text("비밀번호는 6자리 이상 영문/숫자/특수문자가 포함되어야합니다.");
				
				pw = false;
				
			}else{
				frmGroup.removeClass("fail pass");
				frmGroup.next(".frm_vld_txt").text("");
				pw = true;
			}
			
		});
		
		/*비밀번호 확인 체크*/
		$("#seller_pw_ck").keyup(function(){
			var frmGroup = $(this).parents(".frm_group");
			if($(event.target).val() === ''){//빈값 체크
				frmGroup.removeClass("pass").addClass("fail");
				frmGroup.next(".frm_vld_txt").text("비밀번호 확인을 입력해주세요.");
				
				pw_ck = false;
				
			}else if($(event.target).val() !== $("#seller_pw").val()){//비밀번호 일치 체크
				frmGroup.removeClass("pass").addClass("fail");
				frmGroup.next(".frm_vld_txt").text("비밀번호가 일치하지 않습니다.");
				
				console.log($(event.target).val());
				
				pw_ck = false;
				
			}else{
				frmGroup.removeClass("fail").addClass("pass");
				frmGroup.next(".frm_vld_txt").text("비밀번호가 일치합니다.");
				pw_ck = true;
			}
			
		});
		
		/*회사명*/
		$("#seller_name").keyup(function(){
			var frmGroup = $(this).parents(".frm_group");
			
			if($(event.target).val() === ''){//빈값 체크
				frmGroup.removeClass("pass").addClass("fail");
				frmGroup.next(".frm_vld_txt").text("회사명을 입력해주세요.");
				
				name = false;
				
			}else{
				frmGroup.removeClass("fail pass");
				frmGroup.next(".frm_vld_txt").text("");
				name = true;
			}
		});
		
		/*사업자번호*/
		$("#seller_number").keyup(function(){
			var frmGroup = $(this).parents(".frm_group");
			
			if($(event.target).val() === ''){//빈값 체크
				frmGroup.removeClass("pass").addClass("fail");
				frmGroup.next(".frm_vld_txt").text("사업자번호를 입력해주세요.");
				
				number = false;
				
			}else{
				frmGroup.removeClass("fail pass");
				frmGroup.next(".frm_vld_txt").text("");
				number = true;
			}
		});
		
		
		$("#btn_submit").click(function(){
			const msgTxt = " 입력해주세요";
			
			if(id && pw && pw_ck && name && number){
				$("#form").submit();
				
			}else{
				//input 입력자체를 안하면 keyup이벤트 발생하지 않으므로 입력요청 메시지 처리
				if(!id && $("#seller_id").val() === ''){
					var frm_group = $("#seller_id").parents(".frm_group");
					var frm_name = frm_group.find("label").text();
					frm_group.removeClass("pass").addClass("fail");
					frm_group.next(".frm_vld_txt").text(frm_name+"를"+msgTxt);
				}
				if(!pw && $("#seller_pw").val() === ''){
					var frm_group = $("#seller_pw").parents(".frm_group");
					var frm_name = frm_group.find("label").text();
					frm_group.removeClass("pass").addClass("fail");
					frm_group.next(".frm_vld_txt").text(frm_name+"를"+msgTxt);
				}
				if(!pw_ck && $("#seller_pw_ck").val() === ''){
					var frm_group = $("#seller_pw_ck").parents(".frm_group");
					var frm_name = frm_group.find("label").text();
					frm_group.removeClass("pass").addClass("fail");
					frm_group.next(".frm_vld_txt").text(frm_name+"를"+msgTxt);
				}
				if(!name && $("#seller_name").val() === ''){
					var frm_group = $("#seller_name").parents(".frm_group");
					var frm_name = frm_group.find("label").text();
					frm_group.removeClass("pass").addClass("fail");
					frm_group.next(".frm_vld_txt").text(frm_name+"를"+msgTxt);
				}
				if(!number && $("#seller_number").val() === ''){
					var frm_group = $("#seller_number").parents(".frm_group");
					var frm_name = frm_group.find("label").text();
					frm_group.removeClass("pass").addClass("fail");
					frm_group.next(".frm_vld_txt").text(frm_name+"를"+msgTxt);
				}
				
				
				alert("입력정보를 확인해주세요");
			}
		});
		
		
	});
	
	
	</script>
</body>
</html>

