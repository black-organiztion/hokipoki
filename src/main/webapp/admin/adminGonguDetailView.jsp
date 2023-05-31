<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div id="content" class="bg gongu_detail">
	<div class="container">
		<div class="row">
			<!-- conts1:판매자정보 -->
			<div class="col-12">
				<div class="cont_header">
					<a id="btn_list" href="adminGonguListAction.ad">목록</a>
					<h2>공구상세조회</h2>
					<div class="right">
						<c:if test="${sessionScope.loginId eq 'system' || sessionScope.loginAuthor eq 0 }">
							<div class="bts_gongu_status">
								<!-- 공구컨트롤버튼 : 종료아닐때만 표시 -->
								<c:if test="${gongu.gongu_status ne '7' || gongu.gongu_status ne '8'}">
									<c:if test="${gongu.gongu_status eq '0' }"><!-- 심사 : 승인대기일때만 표시 -->
										<a href="adminGonguSetStatus.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}&setStatus=1&seller_id=${seller.seller_id}" class="bt bt_primary">심사시작</a>
									</c:if>
									<c:if test="${gongu.gongu_status eq '1' }"><!-- 승인/승인거절 : 심사일때만 표시 -->
										<a href="adminGonguSetStatus.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}&setStatus=2&seller_id=${seller.seller_id}" class="bt bt_primary">승인</a>
										<a href="adminGonguSetStatus.ad?gongu_id=${gongu.gongu_id}&gongu_status=${gongu.gongu_status}&setStatus=3&seller_id=${seller.seller_id}" class="bt bt_primary">반려</a>
									</c:if>
									<!-- 진행중(4)은 공구글이 게시된 시점부터. -->
									<c:if test="${gongu.gongu_status eq '4' }"><!-- 비활성화 : 진행중일때만 표시 =>지만 사실 비활성화 대기로 바꾸는거고 일정 기간 이후에 자동 비활성화 -->
										<button id="btn_disable" class="bt bt_primary">비활성화</button>
									</c:if>
									
								</c:if>
							</div>
						</c:if>
						<c:if test="${(gongu.gongu_status eq '0' && sessionScope.loginAuthor eq 1) || (gongu.gongu_status eq '6' && sessionScope.loginAuthor eq 0 ) }">
							<button id="btn_delete" class="bt bt_primary">삭제</button>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-lg-8 col-12 section gongu_info">
				<div class="card">
				<h5>공구정보</h5>
				<ul class="card_list">
					<li>
						<em>공구상태</em>
						<span>
							<c:choose>
								<c:when test="${gongu.gongu_status eq '0'}">
									<c:set var="status" value="승인대기"/>
								</c:when>
								<c:when test="${gongu.gongu_status eq '1'}">
									<c:set var="status" value="심사중"/>
								</c:when>
								<c:when test="${gongu.gongu_status eq '2'}">
									<c:set var="status" value="승인"/>
								</c:when>
								<c:when test="${gongu.gongu_status eq '3'}">
									<c:set var="status" value="반려"/>
								</c:when>
								<c:when test="${gongu.gongu_status eq '4'}">
									<c:set var="status" value="진행중"/>
								</c:when>
								<c:when test="${gongu.gongu_status eq '5'}">
									<c:set var="status" value="비활성화대기"/>
								</c:when>
								<c:when test="${gongu.gongu_status eq '6'}">
									<c:set var="status" value="비활성화"/>
								</c:when>
								<c:when test="${gongu.gongu_status eq '7'}">
									<c:set var="status" value="종료"/>
								</c:when>
								<c:when test="${gongu.gongu_status eq '8'}">
									<c:set var="status" value="정산"/>
								</c:when>
								<c:when test="${gongu.gongu_status eq '9'}">
									<c:set var="status" value="정산완료"/>
								</c:when>
							</c:choose>
						<!-- 실제화면에 표시되는 input -->
							${status}
						</span>
					</li>
					<li>
						<em>카테고리</em>
						<c:choose>
							<c:when test="${gongu.category eq 'life'}">
								<c:set var="category" value="생필품"/>
							</c:when>
							<c:when test="${gongu.category eq 'food'}">
								<c:set var="category" value="간편식"/>
							</c:when>
							<c:when test="${gongu.category eq 'kitchen'}">
								<c:set var="category" value="주방"/>
							</c:when>
							<c:when test="${gongu.category eq 'pet'}">
								<c:set var="category" value="반려견"/>
							</c:when>
							<c:when test="${gongu.category eq 'beauty'}">
								<c:set var="category" value="뷰티"/>
							</c:when>
							<c:when test="${gongu.category eq 'book'}">
								<c:set var="category" value="도서"/>
							</c:when>
							<c:when test="${gongu.category eq 'gugang'}">
								<c:set var="category" value="구강/면도"/>
							</c:when>
							<c:when test="${gongu.category eq 'elec'}">
								<c:set var="category" value="전자기기"/>
							</c:when>
							<c:when test="${gongu.category eq 'interior'}">
								<c:set var="category" value="홈인테리어"/>
							</c:when>
							<c:when test="${gongu.category eq 'design'}">
								<c:set var="category" value="디자인문구"/>
							</c:when>
							<c:when test="${gongu.category eq 'organize'}">
								<c:set var="category" value="수납/정리"/>
							</c:when>
							<c:when test="${gongu.category eq 'bath'}">
								<c:set var="category" value="욕실"/>
							</c:when>
							<c:when test="${gongu.category eq 'etc'}">
								<c:set var="category" value="잡화"/>
							</c:when>
							<c:when test="${gongu.category eq 'cloth'}">
								<c:set var="category" value="의류"/>
							</c:when>
							<c:when test="${gongu.category eq 'car'}">
								<c:set var="category" value="자동차용품"/>
							</c:when>
							<c:when test="${gongu.category eq 'hobby'}">
								<c:set var="category" value="취미"/>
							</c:when>
						</c:choose>
						<span>${category}</span>
					</li>
					<li>
						<em>공구명</em>
						<span>${gongu.gongu_name }</span>
					</li>
					<li>
						<em>정가</em>
						<span>${gongu.gongu_price }</span>
					</li>
					<li>
						<em>공구가</em>
						<span>${gongu.gongu_discount_price }</span>
					</li>
					<li>
						<em>등록일시</em>
						<span>${gongu.gongu_date }</span>
					</li>
					<li>
						<em>공구기간</em>
						<span>${gongu.gongu_startdate } ~ ${gongu.gongu_findate }</span>
					</li>
					<li>
						<em>결제마감일</em>
						<span>${gongu.gongu_caldate }</span>
					</li>
					<li>
						<em>최대 판매가능 수량</em>
						<span>${gongu.gongu_stock }</span>
					</li>
					<li>
						<em>최소목표수량</em>
						<span>${gongu.gongu_min }</span>
					</li>
					<li>
						<em>대표이미지</em>
						<div>
							<p>${gongu.thumbnail_img }</p>
							<div class="img">
								<img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }">
							</div>
						</div>
						
					</li>
					<li>
						<em>상세이미지</em>
						<div>
							<p>${gongu.detail_img }</p>
							<div class="img">
								<img src="${pageContext.request.contextPath}/gongu/images/${gongu.detail_img }"><br>
							</div>
						</div>
					</li>
				</ul>
				<c:if test="${gongu.gongu_status eq '0' && loginAuthor eq 1}">
					<div class="bt_group">
						<button id="btn_edit" class="bt" data-bs-toggle="modal" data-bs-target="#modalForm">수정</button>
					</div>
				</c:if>
				</div>
			</div>
			<div class="col-lg-4 col-12">
				<div class="row">
					<c:if test="${sessionScope.loginId eq 'system' || sessionScope.loginAuthor eq 0 }">
						<!-- conts1:판매자정보 -->
						<div class="section col-12 seller_info">
							<div class="card">
								<h5>판매자정보</h5>
								<ul class="card_list">
									<li>
										<em>회사명</em><span>${seller.seller_name }</span>
									</li>
									<li>
										<em>사업자등록번호</em><span>${seller.seller_number }</span>
									</li>
								</ul>
							</div>
						</div>
						<!-- //conts1:판매자정보 -->
					</c:if>
					<c:if test="${gongu.gongu_status ne '0' && gongu.gongu_status ne '1' && gongu.gongu_status ne '2' && gongu.gongu_status ne '3'}">
					<!-- conts3:공구현황 -->
					<div class="col-12 section gongu_current">
						<div class="card">
							<h5>공구현황</h5>
							<ul class="card_list">
								<li>
									<em>조회수</em><span>${gongu.gongu_view_count }</span>
								</li>
								<li>
									<em>공구 달성률</em><span>${(gongu.gongu_reserve/gongu.gongu_min)*100}</span>
								</li>
								<li>
									<em>구매자 수</em><span>${gongu.gongu_reserve }</span>
								</li>
							</ul>
						</div>
					</div>
					<!-- //conts3:공구현황 -->
					</c:if>
				</div>
			</div>
			
		</div>
	</div>
</div>

<c:if test="${sessionScope.loginAuthor eq 1 && gongu.gongu_status eq '0' }">
<div id="modalForm" class="modal fade" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
    <div class="modal-content section">
      <div class="modal-header">
        <h5 class="modal-title">공구수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="formArea" action="gonguModify.go" method="post" class="gongu_form input_form container" enctype="multipart/form-data">
        	<input type="hidden" name="seller_id" value="${seller.seller_id }" />								
			<input type="hidden" name="gongu_id" value="${gongu.gongu_id }"/> 
			<input type="hidden" name="gongu_status" value="${gongu.gongu_status}"/>
			<fieldset class="row">
				<legend><span>공구기본 정보를 입력해주세요.</span></legend>
				<div class="frm_group col-lg-3 col-12">
					<label>카테고리</label>
					<div class="input_group">
						<select name="category" id="category" class="frm_control">						
								<option value="life" ${gongu.category eq 'life'? "selected":"" }>생필품</option>
								<option value="food" ${gongu.category eq 'food'? "selected":"" }>간편식</option>
								<option value="kitchen" ${gongu.category eq 'kitchen'? "selected":"" }>주방</option>
								<option value="pet" ${gongu.category eq 'pet'? "selected":"" }>반려견</option>
								<option value="beauty" ${gongu.category eq 'beauty'? "selected":"" }>뷰티</option>
								<option value="book" ${gongu.category eq 'book'? "selected":"" }>도서</option>
								<option value="gugang" ${gongu.category eq 'gugang'? "selected":"" }>구강/면도</option>
								<option value="elec" ${gongu.category eq 'elec'? "selected":"" }>전자기기</option>
								<option value="interior" ${gongu.category eq 'interior'? "selected":"" }>홈인테리어</option>
								<option value="design" ${gongu.category eq 'design'? "selected":"" }>디자인문구</option>
								<option value="organize" ${gongu.category eq 'organize'? "selected":"" }>수납/정리</option>
								<option value="bath" ${gongu.category eq 'bath'? "selected":"" }>욕실</option>
								<option value="etc" ${gongu.category eq 'etc'? "selected":"" }>잡화</option>
								<option value="cloth" ${gongu.category eq 'cloth'? "selected":"" }>의류</option>
								<option value="car" ${gongu.category eq 'car'? "selected":"" }>자동차용품</option>
								<option value="hobby" ${gongu.category eq 'hobby'? "selected":"" }>취미</option>
						</select> 
					</div>
				</div>
				<div class="frm_group col-lg-9 col-12">
					<label>공구명</label>
					<div class="input_group">
						<input type="text" name="gonguname" value="${gongu.gongu_name }" id="gonguname" class="frm_control"/>
					</div>
				</div>
			</fieldset>
			<fieldset class="row">
				<legend><span>공구일정을 입력해주세요.</span></legend>
				<div class="frm_group col-lg-4 col-6">
					<label>판매시작일</label>
					<div class="input_group">
						<input type="text" name="gongustart" value="${gongu.gongu_startdate }" id="datepicker_start" class="frm_control frm_date"/>
					</div>
				</div>
				<div class="frm_group col-lg-4 col-6">
					<label>판매종료일</label>
					<div class="input_group">
						<input type="text" name="gongufinish" value="${gongu.gongu_findate }" id="datepicker_end" class="frm_control frm_date"/>
					</div>
				</div>
				<div class="w-100"></div>
				<div class="frm_group col-lg-4 col-6">
					<label>결제마감일</label>
					<div class="input_group">
						<input type="text" name="caldate" value="${gongu.gongu_caldate }" id="datepicker_calc" class="frm_control"/>
					</div>
				</div>
				<div class="frm_group col-lg-4 col-6">
				<label>정산일</label>
				</div>
			</fieldset>
			<fieldset class="row">
				<legend><span>공구가격 정보를 입력해주세요.</span></legend>
				<div class="frm_group col-lg-4 col-6">
					<label>정가</label>
					<div class="input_group">
						<input type="text" name="originprice" value="${gongu.gongu_price }" id="originprice" class="frm_control"/>
					</div>
				</div>
				<div class="frm_group col-lg-4 col-6">
					<label>공구가</label>
					<div class="input_group">
						<input type="text" name="gonguprice" value="${gongu.gongu_discount_price }" id="gonguprice" class="frm_control"/>
					</div>
				</div>
			</fieldset>
			<fieldset class="row">
				<legend><span>공구판매 정보를 입력해주세요.</span></legend>
				<div class="frm_group col-lg-4 col-6">
					<label>최대 판매가능 수량</label>
					<div class="input_group">
						<input type="text" name="gongustock"  value="${gongu.gongu_stock }" id="gongustock" class="frm_control"/>
					</div>
				</div>
				<div class="frm_group col-lg-4 col-6">
					<label>최소 목표 수량</label>
					<div class="input_group">
						<input type="text" name="minGongu"  value="${gongu.gongu_min }" id="minGongu" class="frm_control"/>
					</div>
				</div>
			</fieldset>
			
			<fieldset class="row">
				<legend><span>공구 이미지를 설정해주세요.</span></legend>
				<div class="frm_group col-lg-6 col-12">
					<label>공구 대표이미지</label>
					<div class="input_group frm_file">
						<input type="text" class="frm_control" value="${gongu.thumbnail_img }"/>
						<input type="file" name="nailimage" id="nailimage" class="frm_control"/>
						<label for="nailimage" class="bt">파일선택</label>
					</div>
				</div>
				
				<div class="frm_group col-lg-6 col-12">
					<label>공구 상세이미지</label>
					<div class="input_group frm_file">
						<input type="text" class="frm_control" value="${gongu.detail_img }"/>
						<input type="file" name="image" id="image" class="frm_control" disabled/>
						<label for="image" class="bt">파일선택</label>
					</div>
				</div>
			</fieldset>
			
        </form>
      </div>
      <div class="modal-footer">
        <button id="btn_reset" type="button" class="bt">취소</button>
        <button id="btn_submit" type="button" class="bt bt_primary">저장</button>
      </div>
    </div>
  </div>
</div>
</c:if>
<!-- modal -->


<c:if test="${sessionScope.loginAuthor eq 1 }">
<div id="confirmBox" class="modal fade delete cfmBox" tabindex="-1">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content section">
      <div class="modal-header">
        <h5 class="modal-title">공구삭제</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="bt" data-bs-dismiss="modal">취소</button>
        <a href="adminGonguDeleteAction.ad?gongu_id=${gongu.gongu_id }" class="bt bt_primary">확인</a>
      </div>
    </div>
  </div>
</div>
</c:if>

<c:if test="${gongu.gongu_status eq '4' }">
<div id="modal_disabled" class="modal fade" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content section">
			<div class="modal-header">
				<h5 class="modal-title">공구 비활성화</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				
				<form id="gonguDisabledform" class="input_form" action="adminGonguSetStatus.ad" method="post">
					<input type="hidden" name="gongu_id" value="${gongu.gongu_id}"/>
					<input type="hidden" name="gongu_status" value="${gongu.gongu_status}"/>
					<input type="hidden" name="setStatus" value="5"/>
					<input type="hidden" name="seller_id" value="${seller.seller_id}"/>
					<div class="frm_group">
						<label>비활성화 일시</label>
						<div class="input_group">
							<input id="gongu_disabled_date" name="gongu_disabled_date" type="text" class="frm_control frm_date required">
						</div>
						<p class="frm_vld_txt"></p>
					</div>
					<div class="frm_group mt-2">
						<label>비활성화 사유</label>
						<div class="input_group">
							<textarea id="gongu_disabled_text" name="gongu_disabled_text" class="frm_control p-2 required" placeholder="비활성화 사유를 입력해주세요. 입력하신 내용은 쇼핑몰 상세페이지의 비활성화 공지로 사용합니다." style="height: 200px;"></textarea>
						</div>
						<p class="frm_vld_txt"></p>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button id="btn_reset" type="button" class="bt">취소</button>
				<button id="btn_disable_ok" type="button" class="bt bt_primary">확인</button>
			</div>
		</div>
	</div>
</div>

<div id="confirmBox" class="modal fade disabled cfmBox" tabindex="-1">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content section">
      <div class="modal-header">
        <h5 class="modal-title">공구 비활성화</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>비활성화 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button id="btn_cancel" type="button" class="bt">취소</button>
        <button id="btn_submit" type="button" class="bt bt_primary">확인</button>
      </div>
    </div>
  </div>
</div>

</c:if>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function(){
		//header 메뉴 active
		$(".header_item").removeClass("active");
		$(".header_item.gongu").addClass("active");
		
		//버튼클릭이벤트
		 
		//파일인풋
		$("input[type=file]").on('change', function(){
			var fileName = $(this).val();
			$(this).prev("input[type=text]").val(fileName);
		});
		
		$("#btn_reset").on('click', function(){
			formReset('modalForm');
			$('#modalForm').modal('hide');
		});
		
		$("#btn_submit").on('click', function(){
			$("#formArea").submit();
		});
		
		$("#btn_delete").on('click', function(){
			$("#confirmBox.delete").modal('show');
		});
		
		//비활성화
		$(".frm_control").each(function(idx,item){
			$(item).on('propertychange change keyup paste input',function(){
				var frmGroup = $(this).parents(".frm_group");
				if($(item).val === ''){
					
				}else{
					frmGroup.removeClass("fail");
				}
			});
		});
		
		$("#btn_disable").on('click', function(){
			$("#gongu_disabled_date").datepicker('setDate','today'+3);
			$("#modal_disabled").modal('show');
		});
		
		$("#btn_reset").on('click', function(){
			formReset('modal_disabled');
			$("#modal_disabled").modal('hide');
		});
		
		$("#btn_disable_ok").on('click', function(){
			if(fieldNullChk()==true){
				$("#confirmBox.disabled").modal('show');
			}
			
		});
		
		$("#btn_submit").on("click", function(){
			$("#gonguDisabledform").submit();
		});
		
		$("#btn_cancel").on('click', function(){
			formReset('modal_disabled');
			$(".modal").modal('hide');
		});
		
		//비활성화 datepicker
		$("#gongu_disabled_date").datepicker({
			dateFormat:'yy-mm-dd',
			minDate:3,
		});
		
		
		
	});
	
	function fieldNullChk(){
		var failCnt = 0;
		var field = $(".required");		
		//console.log(failCnt);
		
		for(var i=0; i<field.length; i++){
			if($(field[i]).val() == "" || $(field[i]).val() == null){
				//var field_id = $(field[i]).attr("id");
				var field_name =  $(field[i]).parent().prev("label").text();
				$(field[i]).parents(".frm_group").addClass("fail");
				$(field[i]).parent().next(".frm_vld_txt").text(field_name + "을 입력해주세요.");
				
				console.log(field_name);
				
				failCnt++;
				
				console.log(failCnt);
			}
		}
		
		if(failCnt === 0){
			return true;
		}else{
			return false;
		}
	}
</script>
