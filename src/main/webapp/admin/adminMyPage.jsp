<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	
</script>

<div id="content" class="bg">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="cont_header">
					<a id="btn_list" href="#" onclick="javascript:history.back();">뒤로가기</a>
					<h2>마이페이지</h2>
				</div>
			</div>
			<div class="section col-xl-6 col-12">
				<div class="card">
					<h5>회원정보</h5>
					<form id="formArea" action="adminSellerUpdate.ad" method="post" class="modeView myinfo_form input_form">
						<div class="frm_group">
							<label>아이디</label>
							<input type="text" name="seller_id" value="${seller.seller_id }" id="seller_id" class="frm_control noEdit" readonly/>
						</div>
						<div class="frm_group">
							<label>비밀번호</label>
							<input type="password" name="seller_pw" id="seller_pw" class="frm_control" disabled/>
							<p class="frm_vld_txt"></p>
						</div>
						<div class="frm_group hidden">
							<label>비밀번호 확인</label>
							<input type="password" name="seller_pw_ck" id="seller_pw_ck" class="frm_control" disabled/>
							<p class="frm_vld_txt"></p>
						</div>
						<c:if test="${loginAuthor eq 1 }">
							<div class="frm_group">
								<label>회사명</label>
								<input type="text" name="seller_name" value="${seller.seller_name }" id="seller_name" class="frm_control noEdit" readonly/>
							</div>
							<div class="frm_group">
								<label>사업자번호</label>
								<input type="text" name="seller_number" value="${seller.seller_number }" id="seller_number" class="frm_control noEdit" readonly/>
							</div>
						</c:if>
						<div class="bt_group">
							<button id="btn_edit" class="bt" type="button" data-bs-toggle="modal" data-bs-target="#modalForm">수정</button>
							<input type="submit" value="저장" id="btn_save" class="bt">
							<button id="btn_cancel" class="bt" type="button">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- modal -->
<div id="modalForm" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content section">
      <div class="modal-header">
        <h5 class="modal-title">비밀번호 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
        <form>
        	<p class="mb-4">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 확인합니다.</p>
        	<input id="passChk" type="password" name="pass_chk" class="frm_control" style="min-width:250px"/>
        </form>
      </div>
      <div class="modal-footer justify-content-center">
      	<button id="btn_identify" type="button" class="bt bt_primary">확인</button>
        <button id="btn_reset" type="button" class="bt">취소</button>
      </div>
    </div>
  </div>
</div>

<script>
 	var formId = $("#formArea").attr("id");
 	

	$(document).ready(function(){
		console.log(formId);
		//header 메뉴 active
		$("#header .header_item").removeClass("active");
		
		//버튼클릭이벤트
		$("#btn_edit").on('click', function(){
			//var formId = $(this).closest("form").attr("id")
			//console.log(formId);
			//modeEdit(formId);
			//$("#modalForm").show();
			
		});
		$("#btn_cancel").on('click', function(){
			var formId = $(this).closest("form").attr("id")
			console.log(formId);
			modeView(formId);
		});
		
		$("#btn_identify").on('click', function(){
			var id = $("input[name=seller_id]").val();
			var checkPass = $("#passChk").val();
			
			//ajax호출
			$.ajax({
				type:'POST', //서버 전송 방식
				url: 'adminSellerIdentify.ad', //서버 요청 url
				// 요청을 받을 controller가 있어야함
				/* headers:{
					// 객체 전달 (JSON형태로 보냄)
					'Content-Type' : 'application/json' //json형태로 보내고 싶으면 이렇게 지정해줘야함
				}, */
				dataType:'text', //서버로 부터 응답받을 데이터 형식
				data:{//서버에 전송할 데이터(사용자가 입력한 id)
					"seller_id": id,
					"check_pw":checkPass
				},
				success: function(result){ //성공시 실행할 내용, result(매개변수)에 성공 데이터 저장
					//controller가 리턴한 값을 result에 저장
					console.log('ajax통신성공');
					console.log(result);
					
					if(result === 'Avaliable'){//비밀번호 일치
						$("#modalForm").modal('hide'); 
						$("#modalForm form").each(function() {
							  this.reset();
						});
						modeEdit(formId);
						

					}else{//비밀번호 불일치
						alert("비밀번호가 일치하지 않습니다.");

					}
					
				},
				error: function(status,error){//실패시 실행할 내용
					console.log("ajax통신실패");
					console.log(status,error);
					
				}
			});
		});
		
		$("#btn_reset").on('click', function(){
			formReset('modalForm');
			$('#modalForm').modal('hide');
		});
		
		//비밀번호 유효성 검사 및 비밀번호 확인 일치 체크
		const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);// 숫자가 먼저오고 뒤에 특수문자가 옴 or 특수문자가 먼저오고 숫자가 옴 2가지 방법으로 제약 사항 설정
		//비밀번호 validation check
		let pw = false, pw_ck = false; 
		
		/*비밀번호 유효성*/
		$("#seller_pw").keyup(function(){
			var frmGroup = $(this).parents(".frm_group");
			
			if($(event.target).val() === ''){//빈값 체크
				frmGroup.removeClass("pass").addClass("fail");
				frmGroup.find(".frm_vld_txt").text("비밀번호를 입력해주세요.");
				
				pw = false;
				
			}else if(!getPwCheck.test($(event.target).val() || $(event.target).val().length<6)){
				frmGroup.removeClass("pass").addClass("fail");
				frmGroup.find(".frm_vld_txt").text("비밀번호는 6자리 이상 영문/숫자/특수문자가 포함되어야합니다.");
				
				pw = false;
				
			}else{
				frmGroup.removeClass("fail pass");
				frmGroup.find(".frm_vld_txt").text("");
				pw = true;
			}
			
		});
		
		/*비밀번호 확인 체크*/
		$("#seller_pw_ck").keyup(function(){
			var frmGroup = $(this).parents(".frm_group");
			if($(event.target).val() === ''){//빈값 체크
				frmGroup.removeClass("pass").addClass("fail");
				frmGroup.find(".frm_vld_txt").text("비밀번호 확인을 입력해주세요.");
				
				pw_ck = false;
				
			}else if($(event.target).val() !== $("#seller_pw").val()){//비밀번호 일치 체크
				frmGroup.removeClass("pass").addClass("fail");
				frmGroup.find(".frm_vld_txt").text("비밀번호가 일치하지 않습니다.");
				
				console.log($(event.target).val());
				
				pw_ck = false;
				
			}else{
				frmGroup.removeClass("fail").addClass("pass");
				frmGroup.next(".frm_vld_txt").text("비밀번호가 일치합니다.");
				pw_ck = true;
			}
			
		});
		
		$("#btn_submit").click(function(){
			const msgTxt = " 입력해주세요";
			
			if(id && pw && pw_ck && name && number){
				$("#formArea").submit();
				
			}else{
				//input 입력자체를 안하면 keyup이벤트 발생하지 않으므로 입력요청 메시지 처리
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
				
				alert("입력정보를 확인해주세요");
			}
		});
		
		
	});

	
</script>