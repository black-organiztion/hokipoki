<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function(){
		//header 메뉴 active
		$("#header .header_item").removeClass("active");
		$("#header .gongu").addClass("active");
		
		$("#btn_edit").on('click', function(){
			modeEdit();
		});
		$("#btn_cancel").on('click', function(){
			modeView();
		});
	});

	function modeEdit(){//수정모드로 만들기
		$("#formArea").find(".form-control").attr("disabled",false); //.form-control(input)에 disabled 속성을 없애 수정 가능하게 함
		/*
		input중 공구상태와 등록일은 사용자가 직접입력하는 것이 아니므로 modeEdit/modeView와 상관없이 처음부터 readonly 속성을 줘서 읽을 수만 있게함
		=>css로 .noEdit클래스를 사용해 사용자에게 readonly상태일 때와 disabled상태일 때가 똑같이 보이도록 함 
		*/
		
		$("#btn_edit").hide();
		$("#btn_save").show();
		$("#btn_cancel").show();
	}
	
	function modeView(){//보기모드로 만들기
		//입력 중간에 취소 버튼을 누를 경우 입력값을 초기화 시킨다.
		$('#formArea').each(function() {
			  this.reset();
			});
		$("#formArea").find(".form-control").attr("disabled",true);//.form-control(input)에 disabled 속성을 줘서 수정할 수 없게 함.
		$("#btn_edit").show(); //수정버튼을 보임
		$("#btn_save").hide(); //저장버튼을 숨김
		$("#btn_cancel").hide(); //취소버튼을 숨김
	}

</script>

<style>
/* common.css로 옮기기  */
	/*form 읽기 모드일때 */
	/* .modeView .form-control:read-only{border:none;} */
	.modeView .form-control.noEdit{border:none; pointer-events:none;}
	.modeView .form-control:disabled{background-color:transparent; border:none;}
	.modeView .form-control:focus {box-shadow:0 0 0 0.25rem rgba(13,110,253,0)!important;}
	.modeView #btn_edit{display:inline;}
	.modeView #btn_save,.modeView #btn_cancel {display:none;}
	
	/*form 쓰기 모드일때*/
	.modeEdit .form-control:disabled{background-color:#eee;}
	.modeEdit #btn_edit{display:none;}
	.modeEdit #btn_save,.modeEdit #btn_cancel {display:inline;}
	
	.img{width:100px;height:100px; }
	.img img{width:100%; heifht:100%;}
	
</style>

<form id="formArea" action="gonguModify.go" method="post" class="modeView" enctype="multipart/form-data">
	<h5>공구정보</h5>
	<input type="hidden" name="gongu_id" value="${gongu.gongu_id }" id="" class="form-control noEdit" readonly/> 
	<div class="form_group">
		<label>카테고리</label>
		<select name="category" id="category" class="form-control" disabled>						
			<option value="life" ${gongu.category eq 'life'? "selected":"" } >생필품</option>
			<option value="food" ${gongu.category eq 'food'? "selected":"" } >간편식</option>
			<option value="kitchen" ${gongu.category eq 'kitchen'? "selected":"" } >주방</option>
			<option value="pet" ${gongu.category eq 'pet'? "selected":"" } >반려견</option>
		</select> 
	</div>
	<div class="form_group">
		<label>공구상태</label>
		<input type="text" name="gongu_status"  value="${gongu.gongu_status}" id="" class="form-control noEdit" readonly/> 
	</div>
	<div class="form_group">
		<label>공구명</label>
		<input type="text" name="gonguname"  value="${gongu.gongu_name }" id="" class="form-control" disabled/> 
	</div>
	<div class="form_group">
		<label>정가</label>
		<input type="text" name="originprice"  value="${gongu.gongu_price }" id="" class="form-control" disabled/> 
	</div>
	<div class="form_group">
		<label>공구가격</label>
		<input type="text" name="gonguprice"  value="${gongu.gongu_discount_price }" id="" class="form-control" disabled/> 
	</div>
	<div class="form_group">
		<label>등록일시</label>
		<input type="text" name="gongudate"  value="${gongu.gongu_date }" id="" class="form-control noEdit" readonly/> 
	</div>
	<div class="form_group">
		<label>판매시작일</label>
		<input type="text" name="gongustart"  value="${gongu.gongu_startdate }" id="" class="form-control" disabled/> 
	</div>
	<div class="form_group">
		<label>판매종료일</label>
		<input type="text" name="gongufinish"  value="${gongu.gongu_findate }" id="" class="form-control" disabled/> 
	</div>
	<div class="form_group">
		<label>재고수</label>
		<input type="text" name="gongustock"  value="${gongu.gongu_stock }" id="" class="form-control" disabled/> 
	</div>
	<div class="form_group">
		<label>최소목표수</label>
		<input type="text" name="minGongu"  value="${gongu.gongu_min }" id="" class="form-control" disabled/> 
	</div>
	<div class="form_group">
		<label>계산마감일</label>
		<input type="text" name="caldate"  value="${gongu.gongu_caldate }" id="" class="form-control" disabled/> 
	</div>
	<div class="form_group">
		<div class="img">
			<img src="${pageContext.request.contextPath}/gongu/images/${gongu.detail_img }"><br>
		</div>
		<label>상세정보</label>
		<input type="file" name="image" id="" class="form-control" disabled/> 
	</div>
	<div class="form_group">
		<div class="img">
			<img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }">
		</div>
		<label>썸네일</label>
		<input type="file" name="nailimage" id="" class="form-control" disabled/> 
	</div>
	<c:if test="${gongu.gongu_status eq '0'}">
		<button id="btn_edit" class="btn btn-success" type="button">수정</button>
		<input type="submit" value="저장" id="btn_save" class="btn btn-primary">
		<button id="btn_cancel" class="btn btn-secondary" type="button">취소</button>
	</c:if>
</form>

<c:if test="${gongu.gongu_status ne '0' && gongu.gongu_status ne '1' && gongu.gongu_status ne '2' && gongu.gongu_status ne '3'}">
	<h5>공구진행현황</h5>
	현재 공구탑승한 인원 ${gongu.gongu_reserve }<br>
	공구 달성률 ${(gongu.gongu_reserve/gongu.gongu_min)*100}<br>
	조회수 : ${gongu.gongu_view_count }<br>
	
</c:if>
<c:if test="${sessionScope.loginId eq 'system' || sessionScope.loginAuthor eq 0 }">
	<hr>
	<h5>판매자정보</h5>
	판매자ID: <br>
	회사명 : <br>
	사업자번호 : <br>
	<hr>
	<div class="">
		<!-- 공구컨트롤버튼 : 종료아닐때만 표시 -->
		<c:if test="${gongu.gongu_status ne '7' || gongu.gongu_status ne '8'}">
			<c:if test="${gongu.gongu_status eq '0' }"><!-- 심사 : 승인대기일때만 표시 -->
				<a href="adminGonguSetStatus.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}&setStatus=1" class="btn btn-secondary">심사시작</a>
			</c:if>
			<c:if test="${gongu.gongu_status eq '1' }"><!-- 승인/승인거절 : 심사일때만 표시 -->
				<a href="adminGonguSetStatus.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}&setStatus=2" class="btn btn-primary">승인</a>
				<a href="adminGonguSetStatus.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}&setStatus=3" class="btn btn-secondary">반려</a>
			</c:if>
			<!-- 진행중(4)은 공구글이 게시된 시점부터. -->
			<c:if test="${gongu.gongu_status eq '4' }"><!-- 비활성화 : 진행중일때만 표시 =>지만 사실 비활성화 대기로 바꾸는거고 일정 기간 이후에 자동 비활성화 -->
				<a href="adminGonguSetStatus.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}&setStatus=5" class="btn btn-secondary">비활성화</a>
			</c:if>
			
			<%-- <c:if test="${gongu.gongu_status eq '0' }"><!-- 심사 : 승인대기일때만 표시 -->
				<a href="adminGonguCheckAction.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}" class="btn btn-secondary">심사시작</a>
			</c:if>
			<c:if test="${gongu.gongu_status eq '1' }"><!-- 승인/승인거절 : 심사일때만 표시 -->
				<a href="adminGonguOkAction.ad?gonngu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}" class="btn btn-primary">승인</a>
				<a href="adminGonguRejectAction.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}" class="btn btn-secondary">반려</a>
			</c:if>
			<c:if test="${gongu.gongu_status eq '4' }"><!-- 비활성화 : 진행중일때만 표시 -->
				<a href="adminGonguDisableAction.ad?gongu_id=${gongu.gongu_id}" class="btn btn-secondary">비활성화</a>
			</c:if>
			<c:if test="${gongu.gongu_status ne '0' }"><!-- 수정:심사중 이후에만 표시 -->
				<a href="adminGonguModifyAction.ad?gongu_id=${gongu.gongu_id}" class="btn btn-secondary">수정</a>
			</c:if> --%>
			
		</c:if>
	</div>
</c:if>

