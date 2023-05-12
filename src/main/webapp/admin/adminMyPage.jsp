<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	
</script>

<div id="content" class="bg">
	<div class="container">
		<div class="row">
			<div class="section col-12">
				<div class="card">
					<h5>회원정보</h5>
					<form id="formArea" action="adminSellerUpdate.ad" method="post" class="modeView myinfo_form input_form">
						<div class="frm_group">
							<label>아이디</label>
							<input type="text" name="seller_id" value="${seller.seller_id }" class="frm_control noEdit" readonly/>
						</div>
						<div class="frm_group">
							<label>비밀번호</label>
							<input type="password" name="seller_pw" value="${seller.seller_pw }" class="frm_control" disabled/>
						</div>
						<div class="frm_group hidden">
							<label>비밀번호 확인</label>
							<input type="password" name="seller_pw_ck" class="frm_control" disabled/>
						</div>
						<div class="frm_group">
							<label>회사명</label>
							<input type="text" name="seller_name" value="${seller.seller_name }" class="frm_control noEdit" readonly/>
						</div>
						<div class="frm_group">
							<label>사업자번호</label>
							<input type="text" name="seller_number" value="${seller.seller_number }" class="frm_control noEdit" readonly/>
						</div>
						
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
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
        	<p>수정하시려면 비밀번호를 입력하세요</p>
        	<input id="passChk" type="password" name="pass_chk" class="frm_control" />
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="bt" data-bs-dismiss="modal">취소</button>
        <button id="btn_identify" type="button" class="bt">확인</button>
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
						$("#modalForm").hide();
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
		
	});

	
</script>