<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
String alert = request.getParameter("alert");
String startMsg = request.getParameter("startMsg");
String closeMsg = request.getParameter("closeMsg");

if(alert != null){
	if(alert.equals("start")){
%>
<script>
	alert('공구가 시작되었습니다.\n'+`${startMsg}`);
</script>

<%}else if(alert.equals("close")){%>
	<script>
		alert('공구가 종료되었습니다.\n'+`${closeMsg}`);
	</script>
<% }
} %>

<div id="content" class="gongu">
	<div class="container divide">
		<div class="row">
			<div class="col-xl-2 col-12 side">
				<!-- conts1 : 공구 처리 버튼 -->
				<c:if test="${sessionScope.loginAuthor eq 0 }">
				<div class="section sec1">
					<h5>공구일괄처리</h5>
					<div class="gongu_btns">
						<div class="btn_start">
							<a href="adminGonguStartAction.ad">
								<span>승인된 공구들을 <br>한번에 공개하려면?</span>
								<em>공구 일괄 게시</em>
							</a>
						</div>
						<div class="btn_close">
							<a href="adminGonguCloseAction.ad">
								<span>오늘 마감된 공구들을 <br>한번에 종료하세요</span>
								<em>공구 일괄 종료</em>
							</a>
						</div>
					</div>
				</div>
				</c:if>
				<!-- //conts1 : 공구 처리 버튼 -->
				
				<!-- conts2 : 상태별 공구 건수 -->
				<div class="section sec2">
					<h5>숫자로 보는 공구</h5>
					<div>
						<div class="gongu_cnts cnts">
							<span>승인대기</span>
							<em>${standByCnt }</em>
						</div>
						<div class="gongu_cnts cnts">
							<span>진행중</span>
							<em>${ongoingCnt }</em>
						</div>
						<div class="gongu_cnts cnts">
							<span>정산중</span>
							<em>${calcCnt }</em>
						</div>
					</div>
				</div>
				<!-- //conts2 : 상태별 공구 건수 -->
				
				<!-- conts4 : 공구등록버튼 -->
				<c:if test="${sessionScope.loginAuthor eq 1 }">
				<div class="section w_bt sec3">
					<a href="gonguRegistForm.go" class="bt bt_primary bt_lg"><span class="bt_ic plus"></span>공구등록</a>
				</div>
				</c:if>
				<!-- //conts4 : 공구등록버튼 -->
			</div>
			<div class="col-xl-10 col-12 main">
				<!-- conts3 : 공구필터 + 리스트 -->
				<div class="section">
				<form id=""></form>
				<h5>공구검색</h5>
				<div class="utils">
					<form id="filterForm" method="post" action="adminGonguListAction.ad">
						<input type="hidden" name="page" value="${pageInfo.page }">
						<button type="button" id="btn_filter" class="btn_filter frm_control" onclick="lyOn(this)">필터</button>
						<div id="ly_filter" class="ly_filter ly">
							<div class="utils_filter">
								<fieldset>
									<legend>공구상태표시</legend>
									<div class="frm_group">
										<input type="checkbox" id="gongu_all" name="gongu_status" value="all" class="frm_chk" ${fn:contains(filterList,'all')? "checked":""}>
										
										<label for="gongu_all">전체</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="gongu_3" name="gongu_status" value="3" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'3')? "checked":""}>
										<label for="gongu_3">반려</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="gongu_0" name="gongu_status" value="0" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'0')? "checked":""}>
										<label for="gongu_0">승인대기</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="gongu_4" name="gongu_status" value="4" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'4')? "checked":""}>
										<label for="gongu_4">진행중</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="gongu_1" name="gongu_status" value="1" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'1')? "checked":""}>
										<label for="gongu_1">심사중</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="gongu_5" name="gongu_status" value="5" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'5')? "checked":""}>
										<label for="gongu_5">비활성화</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="gongu_2" name="gongu_status" value="2" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'2')? "checked":""}>
										<label for="gongu_2">승인</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="gongu_7" name="gongu_status" value="7" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'7')? "checked":""}>
										<label for="gongu_7">종료</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="gongu_8" name="gongu_status" value="8" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'8')? "checked":""}>
										<label for="gongu_8">정산중</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="gongu_9" name="gongu_status" value="9" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'9')? "checked":""}>
										<label for="gongu_9">정산완료</label>
									</div>
									<div class="bt_group">
										<button id="" type="button" class="bt" onclick="lyOff(this)">취소</button>
										<button id="btn_apply" type="button" class="bt bt_primary">적용</button>
									</div>
								</fieldset>
							</div>	
						</div>
						<div class="right">
							<div class="input_group">
								<select name="search_option" class="frm_control">
									<option value="gongu_name" ${sOption eq 'gongu_name'? 'selected':''}>공구명</option>
									<option value="seller_name" ${sOption eq 'seller_name'? 'selected':''}>판매자</option>
								</select>
								<div class="utils_search frm_control">
									<input type="text" name="search_keyword" value="${sKeyword }">
									<button id="btn_search" type="button" class="btn_search">검색</button>
								</div>
							</div>
							<c:if test="${sessionScope.loginAuthor eq 1 }">
							<a href="gonguRegistForm.go" class="bt bt_primary m_bt"><span class="bt_ic plus"></span>공구등록</a>
							</c:if>
						</div>
					</form>
				</div>
				<div class="list gongu_list">
					<div class="list_header">
						<span>상태<button id="btn_help_status" class="help_icon" onclick="lyOn(this)">도움말</button>
							<div id="ly_help_status" class="ly ly_help_status">
								공구상태 설명
								<ul style="font-size:12px;">
									<li>승인대기 : 판매자가 작성한 공구글이 관리자의 승인을 받기 전 상태</li>
									<li>심사중 : 관리자가 글을 확인한 상태</li>
									<li>승인 : 판매자가 작성한 공구글이 관리자의 승인을 받은 상태</li>
									<li>반려 : 판매자가 작성한 공구글이 관리자의 승인 거절을 받은 상태</li>
									<li>진행중 : 공구글이 게시되어 구매자를 모집하는 상태</li>
									<li>비활성화 대기: 관리자가 공구글을 비활성화 시키고 공구글이 비활성화 되기 전 상태, 찜하기와 참여하기가 불가능함, 공구글이 숨겨지기 전에 구매자들이 공구페이지에서 공구 중지에 대한 내용을 확인 할 수 있도록 하기 위함</li>
									<li>비활성화 : 공구글이 비활성화 되어 판매자&관리자만 확인할 수 있는 상태</li>
									<li>종료 : 공구마감일이 되었거나 공구 목표 달성으로 인해 공구가 종료된 상태</li>
									<li>정산중 : 목표달성한 공구가 정산중인 상태</li>
									<li>정산완료 : 공구의 정산이 완료된 상태(최종 종료)</li>
								</ul>
							</div>
						</span>
						<span>공구명</span>
						<span>공구기간</span>
						<span>판매자</span>
						<span>등록일</span>
					</div>
					<div class="list_body">
						<c:choose>
							<c:when test="${gonguList.size() > 0 }">
								<c:forEach var="gongu" items="${gonguList}" varStatus="">
										<div class="list_item ${gongu.gongu_status eq '3'? 'reject':'' } ${gongu.gongu_status eq '4'? 'on':'' }">	
											<a href="adminGonguDetailViewAction.ad?gongu_id=${gongu.gongu_id}&seller_id=${gongu.seller_id}">
											<span>
												<span class="status">
													<c:choose>
														<c:when test="${gongu.gongu_status == '0' }">승인대기</c:when>
														<c:when test="${gongu.gongu_status == '1' }">심사중</c:when>
														<c:when test="${gongu.gongu_status == '2' }">승인</c:when>
														<c:when test="${gongu.gongu_status == '3' }">반려</c:when>
														<c:when test="${gongu.gongu_status == '4' }">진행중</c:when>
														<c:when test="${gongu.gongu_status == '5' }">비활성화</c:when>
														<c:when test="${gongu.gongu_status == '6' }">비활성화</c:when>
														<c:when test="${gongu.gongu_status == '7' }">종료</c:when>
														<c:when test="${gongu.gongu_status == '8' }">정산중</c:when>
														<c:when test="${gongu.gongu_status == '9' }">정산완료</c:when>
													</c:choose>
												</span>
											</span>
											<span>${gongu.gongu_name }</span>
											<span>${gongu.gongu_startdate }~${gongu.gongu_findate }</span>
											<span>${gongu.seller_id }</span>
											<span>${gongu.gongu_date }</span>
											
											</a>
										</div>
									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p class="noItem">등록된 공구가 없습니다.</p>
							</c:otherwise>	
						</c:choose>
					</div>
					<c:if test="${pageInfo.page > 0 }">
						<div class="list_footer">
							<ul class="pagination">
								<li class="page-item">
									<c:choose>
										<c:when test="${pageInfo.page <= 1 }">
											<a class="page-link first disabled"><span>처음으로</span></a>
										</c:when>
										<c:otherwise>
											<a class="page-link first" onclick="pageAction('${pageInfo.startPage}')"><span>처음으로</span></a>
										</c:otherwise>
									</c:choose>
								</li>
								<li class="page-item">
									<c:choose>
										<c:when test="${pageInfo.page <= 1 }">
											<a class="page-link prev disabled"><span>이전</span></a>
										</c:when>
										<c:otherwise>
											<a class="page-link prev" onclick="pageAction('prev')"><span>이전</span></a>
										</c:otherwise>
									</c:choose>
								</li>
								<c:forEach var="paging" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
									<li class="page-item">
										<c:choose>
											<c:when test="${paging == pageInfo.page }">
												<a class="page-link active" onClick="pageAction(${paging})">${paging }</a>
											</c:when>
											<c:otherwise>
												<a class="page-link" onClick="pageAction(${paging})">${paging }</a>
											</c:otherwise>
										</c:choose>
									</li>
								</c:forEach>
								<li class="page-item">
									<c:choose>
										<c:when test="${pageInfo.page >= pageInfo.maxPage }">
											<a class="page-link disabled next"><span>다음</span></a>
										</c:when>
										<c:otherwise>
											<a class="page-link next" onclick="pageAction('next')"><span>다음</span></a>
										</c:otherwise>
									</c:choose>
								</li>
								<li class="page-item">
									<c:choose>
										<c:when test="${pageInfo.page >= pageInfo.maxPage }">
											<a class="page-link disabled last"><span>마지막으로</span></a>
										</c:when>
										<c:otherwise>
											<a class="page-link last" onclick="pageAction(${pageInfo.maxPage})"><span>마지막으로</span></a>
										</c:otherwise>
									</c:choose>
								</li>
							</ul>
						</div>
					</c:if>
				</div>
				</div>
				<!-- //conts3 : 공구필터 + 리스트 -->
			</div>
		</div>
	</div>
	
</div>


<script>
	$(document).ready(function(){
		//header 메뉴 active
		$(".header_item").removeClass("active");
		$(".header_item.gongu").addClass("active");
		
		//최초로딩시 전체 선택
		//$("input[name=gongu_status]").prop("checked",true);
		
		/*
		var param = '${filterList}';

		if(param != null){
			param = param.slice(1,-1); //맨앞, 맨뒤 대괄호 자르기
			console.log(param);
			
			var filterArr = param.split(", ");
			
			console.log(filterArr);

			for(var i=0; i<filterArr.length; i++){
				$("#gongu_"+filterArr[i]).prop("check",true);
				//console.log();
				
			}
			
		}
			*/
		
		//필터 체크박스 전체선택, 해제
		var checkAll = $("#gongu_all");
		checkAll.on('click',function(){
			if(checkAll.is(":checked") == true){
				$("input[name=gongu_status]").prop("checked", true);
			}else{
				$("input[name=gongu_status]").prop("checked", false);
			}
		});
		
		$("input[name=gongu_status]").not(checkAll).on('click', function(){
			var totalL = $("input[name=gongu_status]").not(checkAll).length;
			var checkedL = $("input[name=gongu_status]:checked").not(checkAll).length;
			console.log(totalL,checkedL);
			if(totalL <= checkedL){
				checkAll.prop("checked", true);
			}else{
				checkAll.prop("checked", false);
			}
		});
		
		//필터적용
		$("#btn_apply").on('click', function(){
			pageAction(1);
			$("#filterForm").submit();
			//비동기할때 주석풀기
			//filterList();
		});
		
		//검색
		$("#btn_search").on('click', function(){
			pageAction(1);
			$("#filterForm").submit();
		});
	});
	
	//console.log("로딩후:"+document.querySelector('input[name="page"]').value);
	
	function pageAction(count){
		var pageInput = document.querySelector('input[name="page"]');
		var nowPage = pageInput.value;
		console.log(nowPage);
		var goPage;
		
		if(count == null){
			count = 0;
		}else if(count == 'prev'){
			goPage = Number(nowPage)-1;
			
		}else if(count == 'next'){
			goPage = Number(nowPage)+1;
			
		}else{
			goPage = Number(count);
		}
		pageInput.value = goPage;
		
		//console.log("변경후:"+document.querySelector('input[name="page"]').value);
		$("#filterForm").submit();
		
	}

</script>

