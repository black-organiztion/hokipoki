<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	qnaform{
		width:1000px;
		height:550px;
	}
	table{
		width:1000px;
		height:500px;
		border-collapse: collapse;
		border-bottom: 3px solid black;
	}
	th{
		text-align: left;
		width:150px;
		padding-left: 10px;
	}
	tr{
		border-bottom: 1px solid #d1d1d1 !important;
	}
	input{
		border:0px solid black;
		outline: none;
		background-color: transparent;
		font-size:18px;
	}
	select{
		font-size: 14px;
	}
	.input_box{
		width:600px;
		align-items: center;
		height:45px;
		display:flex;
		padding:10px 0;
	}
	.input_box>input{width:100%;}
	textarea{
		width:600px;
		height:250px;
		border:1px solid #d4d4d4;
	}
	
	.sub_btn{
		width:80px;
		height:30px;
		background-color: black;
		color:white;
		cursor: pointer;
	}
	.radios{
		width:600px;
		display:flex;
		justify-content: space-between;
	}
	.radios>label{display:inline-flex;}
	.radios>label>input{margin-right:8px;}
	
	.input_group{display:flex; align-items:center;}
	.input_group>*{margin-right:4px;}
	.input_group>p{margin:0; font-size:14px; color:#999;}
</style>
</head>
<body>

<form id="form" method="post" class="qnaform" action="${pageContext.request.contextPath}/memberQuestionAction.qu" enctype="multipart/form-data">
<table>
	<tr style="height:50px; border-top: 3px solid black;">
		<th>회원정보</th>
		 <td>${member.member_name }</td>
	</tr>
	<tr style="height:50px;">
		<th>문의유형</th>
		<td >
			<div class="input_box">
				<fieldset class="radios">
					<input type="hidden" name="qna_cate_val" class="required"/>
					<label><input type="radio" name="qna_category" value="0">공구문의</label>
					<label><input type="radio" name="qna_category" value="1">주문문의</label>
					<label><input type="radio" name="qna_category" value="2">배송문의</label>
					<label><input type="radio" name="qna_category" value="3">교환/환불문의</label>
					<label><input type="radio" name="qna_category" value="11">결제</label>
					<label><input type="radio" name="qna_category" value="21">기타</label>
				</fieldset>
			</div>	
		</td>
	</tr>
	
	<tr class="sel_gongu" style="display:none">
		<th>공구선택</th>
		<td>
			<div class="input_group">
				<input type="hidden" name="gongu_id" id="gongu_id">
				<input type="text" name="search_gongu" id="search_gongu" style="border:1px solid #d4d4d4; height:30px;" readonly/>
				<button id="sch_gongu" type="button" class="sub_btn" onclick="popGonguList()">검색</button>
				<p>검색버튼을 눌러 공구 조회 후 선택해주세요</p>
			</div>
		</td>
	</tr>
	<tr class="sel_order" style="display:none">
		<th>주문선택</th>
		<td><select name="order_id" id="order_id" class=""></select></td>
	</tr>
	<tr style="height:50px;">
		<th>제목</th>
		<td>
			<div class="input_box" style="border:1px solid #d4d4d4; height:30px;">
				<input type="text" name="qna_subject" class="required">
			</div>	
		</td>
	</tr>
	
	<tr style="height:250px;">
		<th>문의내용</th>
			<td>
				<div class="input_box">
					<textarea name="qna_content" class="required"></textarea>
				</div>
			</td>
	</tr>
	<tr style="height:50px; border-bottom:3px solid black;">
		<th>파일첨부</th>
		<td>
			<div class="input_box">
				<input type="file" name="qna_file" style="font-size: 12px;">
			</div>
		</td>
	</tr>				

</table>
<div class="btn_containter" style="text-align: center; padding-top: 10px;">
	<button id="btn_submit" type="button" class="sub_btn">등록</button>
</div>
</form>
<script>
	$(function(){
		$("input[name=qna_category]").on('change', function(){
			var cate = $(this).val();
			
			$("input[name=qna_cate_val]").val(cate);
			//console.log(cate);
			if(cate == 0){ //카테고리가 0일때 참여공구 선택
				$(".sel_order").hide();
				$(".sel_order").find("select").removeClass("required");
				$("#order_id").val("");
				
				$(".sel_gongu").show();
				$(".sel_gongu").find("input[type='hidden']").addClass("required");
				
			}else if(0 < cate && cate < 20){ //카테고리가 1,2,3,4일때 주문선택
				$(".sel_gongu").hide();
				$(".sel_gongu").find("input[type='hidden']").removeClass("required");
				$("#gongu_id").val("");
				$("#search_gongu").val("");
				
				$(".sel_order").show();
				$(".sel_order").find("select").addClass("required");
				
				$.ajax({
					type:"post",
					url:"memberQnaOrderListAction.or",
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
		                    $('<option></option>').val(k).text(v).appendTo($('#order_id'));
		                });
					},
					error:function(xhr,status,error){
						console.log("통신실패, xhr:"+xhr+", status:"+status+", error:"+error);
					}
				});
				
			}else{
				$(".sel_gongu").hide();
				$(".sel_gongu").find("input[type='hidden']").removeClass("required");
				$("#gongu_id").val("");
				
				$(".sel_order").hide();
				$(".sel_order").find("select").removeClass("required");
				$("#order_id").val("");
			}
			
		});
		
		$("#btn_submit").on("click", function(){
			if(fieldNullChk()==true){
				$("#form").submit();
			}
		});
		
	});
	
	//fieldNullChk()의 다른버전 :alert으로 필수입력 알려주기
	function fieldNullChk(){
		var failCnt = 0;
		var field = $(".required");		
		console.log(failCnt);
		console.log(field.length);
		
		for(var i=0; i<field.length; i++){
			console.log(field.length);
			if($(field[i]).val() == "" || $(field[i]).val() == null){
				console.log("체크");
				var field_name = $(field[i]).parents("td").prev("th").text();
				alert(field_name+"을 입력해주세요");
				
				return false;
				
			}
		}
		
		//console.log("성공");

		return true;
	}
	
	function popGonguList(){
		var popUp = window.open("${pageContext.request.contextPath}/member/qnaGonguList.jsp","공구목록","height=400,width=400");
		
	}
</script>
</body>
</html>