<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="content">
	<div>
		<h1>문의하기</h1>
	</div>
	<div class="">
		<form id="form" action="${pageContext.request.contextPath}/memberQuestionAction.qu" method="post" enctype="multipart/form-data">
			<div class="frm_group">
				<label for="qna_category">분류</label>
				<div class="input_group">
					<select name="qna_category" id="qna_category" class="frm_control required">
						<option selected disabled>선택해주세요</option>
						<option value="0">공구</option>
						<option value="1">주문</option>
						<option value="2">배송</option>
						<option value="3">교환/환불</option>
						<option value="21">결제</option>
						<option value="22">기타</option>
					</select>
				</div>
			</div>
			<!-- #qna_category 값이 1,2,3일때 show -->
			<div class="frm_group sel_order" style="display:none">
				<label for="order_id">주문선택</label>
				<div class="input_group">
					<select name="order_id" id="order_id" class="frm_control"></select>
				</div>
			</div>
			<!-- #qna_category 값이 0일때 show -->
			<div class="frm_group sel_gongu" style="display:none">
				<label for="gongu_id">공구선택</label>
				<div class="input_group">
					<select name="gongu_id" id="gongu_id" class="frm_control"></select>
				</div>
			</div>
			<div class="frm_group">
				<label for="qna_subject">제목</label>
				<div class="input_group">
					<input type="text" name="qna_subject" id="qna_subject" class="frm_control required">
				</div>
			</div>
			<div class="frm_group">
				<label for="">내용</label>
				<div class="input_group">
					<textarea name="qna_content" id="qna_content" class="frm_control required"></textarea>
				</div>
			</div>
			<div class="frm_group">
				<label for="">첨부파일</label>
				<div class="input_group frm_file">
					<input type="file" name="qna_file" id="qna_file" class="frm_control">
				</div>
			</div>
			<div class="btn_group">
				<button id="btn_submit" type="button">등록</button>
				<button id="btn_cancel" type="button">취소</button>
			</div>
		</form>
	</div>
</div>

<script>
	let category = false, order_id = true, gongu_id = true, subject = false, content = false;

	$(function(){
		$("#qna_category").on('change',function(){
			var cate = $(this).val();
			//console.log(cate);
			if(cate == 0){ //카테고리가 0일때 참여공구 선택
				$(".sel_order").hide();
				$(".sel_order").find("select").removeClass("required");
				$("#order_id").val("");
				
				$(".sel_gongu").show();
				$(".sel_gongu").find("select").addClass("required");
				
				$.ajax({
					type:"post",
					url:"memberGonguListAction.go",
					// 요청을 받을 controller가 있어야함
					/* headers:{
						// 객체 전달 (JSON형태로 보냄)
						'Content-Type' : 'application/json' //json형태로 보내고 싶으면 이렇게 지정해줘야함
					},*/
					cache:false, //캐시저장여부
					data:{
						member_id:'${member_id}' //전송할 데이터
					},
					dataType :'json', //요청한 데이터 형식
					success:function(obj){
						console.log("ajax 통신성공");
						
						console.log(obj);
						
						 //var data = JSON.parse(obj);
						
						$.each(obj, function (k, v) {
		                    $('<option></option>').val(k).text(v).appendTo($('#gongu_id'));
		                });
					},
					error:function(xhr,status,error){
						console.log("통신실패, xhr:"+xhr+", status:"+status+", error:"+error);
					}
				});
				
			}else if(0 < cate && cate < 10){ //카테고리가 1,2,3때 주문선택
				$(".sel_gongu").hide();
				$(".sel_gongu").find("select").removeClass("required");
				$("#gongu_id").val("");
				
				$(".sel_order").show();
				$(".sel_order").find("select").addClass("required");
				
			}else{
				$(".sel_gongu").hide();
				$(".sel_gongu").find("select").removeClass("required");
				$("#gongu_id").val("");
				
				$(".sel_order").hide();
				$(".sel_order").find("select").removeClass("required");
				$("order_id").val("");
			}
		});
		
		$("#btn_submit").on("click", function(){
			if(fieldNullChk()==true){
				$("#form").submit();
			}
		});
	});
	
	function fieldNullChk(){
		var failCnt = 0;
		var field = $(".required");		
		//console.log(failCnt);
		
		for(var i=0; i<field.length; i++){
			if($(field[i]).val() == "" || $(field[i]).val() == null){
				var field_name = $(field[i]).parent().prev("label").text();
				$(field[i]).parent().next(".frm_vld_txt").text(field_name + "을 입력해주세요.");
				
				failCnt++;
				
				//console.log("실행후"+failCnt);
			}
			
		}
		
		if(failCnt === 0){
			return true;
		}else{
			return false;
		}
	}
	
</script>