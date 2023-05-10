<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(function(){
		//header 메뉴 active
		$("#header .header_item").removeClass("active");
		$("#header .gongu").addClass("active");
		
		//버튼클릭이벤트
		$("#btn_edit").on('click', function(){
			var formId = $(this).closest("form").attr("id")
			//console.log(formId);
			modeEdit(formId);
		});
		$("#btn_cancel").on('click', function(){
			var formId = $(this).closest("form").attr("id")
			console.log(formId);
			modeView(formId);
		});
	});
</script>

<div id="content" class="bg">
	<div class="container">
		<div class="row">
			<!-- conts1:판매자정보 -->
			<div class="section col-xl-4 col-12">
				<div class="card">
					<h5>판매자정보</h5>
					<form class="row input_form modeView">
						<div class="frm_group col-12">
							<label>회사명</label>
							<div class="input_group">
								<input type="text" value="${seller.seller_name }" class="noEdit frm_control" readonly>
							</div>
							
						</div>
						<div class="frm_group col-12">
							<label>사업자등록번호</label>
							<div class="input_group">
								<input type="text" value="${seller.seller_number }" class="noEdit frm_control" readonly>
							</div>
							
						</div>
					</form>
				</div>
			</div>
			<!-- //conts1:판매자정보 -->
			
			<div class="col-xl-8 col-12 section gongu_info">
				<c:if test="${sessionScope.loginId eq 'system' || sessionScope.loginAuthor eq 0 }">
					<div class="bts_gongu_status">
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
				<div class="tab gongu_tab">
					<ul class="tab_menu">
						<li><a href="#tab1"><h5>공구정보</h5></a></li>
						<c:if test="${gongu.gongu_status ne '0' && gongu.gongu_status ne '1' && gongu.gongu_status ne '2' && gongu.gongu_status ne '3'}">
							<li><a href="#tab2"><h5>공구현황</h5></a></li>
						</c:if>
					</ul>
					<div class="tab_conts">
						<!-- conts2:공구정보 -->
						<div id="tab1">
							<div class="card">
								<form id="formArea" action="gonguModify.go" method="post" class="modeView row gongu_form input_form" enctype="multipart/form-data">
									<input type="hidden" name="gongu_id" value="${gongu.gongu_id }" id="" class="frm-control noEdit" readonly/> 
									<div class="frm_group col-12 col-lg-6">
										<label>공구상태</label>
										<div class="input_group">
											<input type="text" name="gongu_status"  value="${gongu.gongu_status}" id="" class="frm_control noEdit" readonly/>
										</div>
									</div>
									<div class="frm_group col-12 col-lg-6">
										<label>카테고리</label>
										<div class="input_group">
											<select name="category" id="category" class="frm_control" disabled>						
												<option value="life" ${gongu.category eq 'life'? "selected":"" } >생필품</option>
												<option value="food" ${gongu.category eq 'food'? "selected":"" } >간편식</option>
												<option value="kitchen" ${gongu.category eq 'kitchen'? "selected":"" } >주방</option>
												<option value="pet" ${gongu.category eq 'pet'? "selected":"" } >반려견</option>
											</select> 
										</div>
									</div>
									<div class="frm_group col-12">
										<label>공구명</label>
										<div class="input_group">
											<input type="text" name="gonguname"  value="${gongu.gongu_name }" id="" class="frm_control" disabled/>
										</div>
									</div>
									<div class="frm_group col-12 col-xxl-6">
										<label>정가</label>
										<div class="input_group">
											<input type="text" name="originprice"  value="${gongu.gongu_price }" id="" class="frm_control" disabled/>
										</div>
									</div>
									<div class="frm_group col-12 col-xxl-6">
										<label>공구가격</label>
										<div class="input_group">
											<input type="text" name="gonguprice"  value="${gongu.gongu_discount_price }" id="" class="frm_control" disabled/>
										</div>
									</div>
									<div class="frm_group col-12 col-xxl-6">
										<label>등록일시</label>
										<div class="input_group">
											<input type="text" name="gongudate"  value="${gongu.gongu_date }" id="" class="frm_control noEdit" readonly/>
										</div>
									</div>
									<div class="frm_group col-12 col-xxl-6">
										<label>판매시작일</label>
										<div class="input_group">
											<input type="text" name="gongustart"  value="${gongu.gongu_startdate }" id="" class="frm_control" disabled/>
										</div>
										<p class="frm_txt">판매시작일의 경우 심사기간 및 여부에 따라 입력한 날짜와 상이할 수 있습니다.</p>
									</div>
									<div class="frm_group col-12 col-xxl-6">
										<label>판매종료일</label>
										<div class="input_group">
											<input type="text" name="gongufinish"  value="${gongu.gongu_findate }" id="" class="frm_control" disabled/>
										</div>
									</div>
									<div class="frm_group col-12 col-xxl-6">
										<label>결제마감일</label>
										<div class="input_group">
											<input type="text" name="caldate"  value="${gongu.gongu_caldate }" id="" class="frm_control" disabled/>
										</div>
									</div>
									<div class="frm_group col-12 col-xxl-6">
										<label>재고수</label>
										<div class="input_group">
											<input type="text" name="gongustock"  value="${gongu.gongu_stock }" id="" class="frm_control" disabled/>
										</div>
									</div>
									<div class="frm_group col-12 col-xxl-6">
										<label>최소목표수</label>
										<div class="input_group">
											<input type="text" name="minGongu"  value="${gongu.gongu_min }" id="" class="frm_control" disabled/>
										</div>
									</div>
									<div class="frm_group col-12 col-xxl-6">
										<label>공구 대표이미지</label>
										<div class="input_group">
										<input type="file" name="nailimage" id="" class="frm_control" disabled/>
										</div>
										<div class="img">
											<img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }">
										</div>
									</div>
									<div class="frm_group col-12 col-xxl-6">
										<label>공구 상세이미지</label>
										<div class="input_group">
											<input type="file" name="image" id="" class="frm_control" disabled/>
										</div>
										<div class="img">
											<img src="${pageContext.request.contextPath}/gongu/images/${gongu.detail_img }"><br>
										</div>
									</div>
									
									<c:if test="${gongu.gongu_status eq '0'}">
										<div class="bt_group">
											<button id="btn_edit" class="bt" type="button">수정</button>
											<input type="submit" value="저장" id="btn_save" class="bt">
											<button id="btn_cancel" class="bt" type="button">취소</button>
										</div>
									</c:if>
								</form>
							</div>
						</div>
						<!-- //conts2:공구정보 -->
						
						<!-- conts3:공구현황 -->
						<c:if test="${gongu.gongu_status ne '0' && gongu.gongu_status ne '1' && gongu.gongu_status ne '2' && gongu.gongu_status ne '3'}">
							<div id="tab2">
								<div class="card">		
										현재 공구탑승한 인원 ${gongu.gongu_reserve }<br>
										공구 달성률 ${(gongu.gongu_reserve/gongu.gongu_min)*100}<br>
										조회수 : ${gongu.gongu_view_count }<br>
								</div>
							</div>
						</c:if>
						<!-- //conts3:공구현황 -->
					</div>
				</div>

			</div>
		</div>
	</div>
</div>


