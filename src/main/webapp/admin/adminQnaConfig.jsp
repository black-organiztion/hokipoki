<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="content" class="qna">
	<div class="container divide">
		<div class="row">
			<div class="col-xl-2 col-12 side">
				<!-- conts2 : 상태별 공구 건수 -->
				<div class="section sec1">
					<div>
						<div class="gongu_cnts cnts">
							<span>미응답문의</span>
							<em>${noAnswerCnt }</em>
						</div>
					</div>
				</div>
				<!-- //conts2 : 상태별 공구 건수 -->
			</div>
			<div class="col-xl-10 col-12 main">
				<!-- conts3 : 공구필터 + 리스트 -->
				<div class="section">
				<form id=""></form>
				<h5>문의검색</h5>
				<div class="utils">
					<form id="filterForm" method="post" action="adminQnaListAction.ad">
						<input type="hidden" name="page" value="${pageInfo.page }">
						<button type="button" id="btn_filter" class="btn_filter frm_control" onclick="lyOn(this)">필터</button>
						<div id="ly_filter" class="ly_filter ly">
							<div class="utils_filter">
								<fieldset>
									<legend>문의구분표시</legend>
									<div class="frm_group">
										<input type="checkbox" id="qna_all" name="gongu_status" value="all" class="frm_chk" ${fn:contains(filterList,'all')? "checked":""}>
										
										<label for="qna_all">전체</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="qna_0" name="gongu_status" value="0" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'0')? "checked":""}>
										<label for="qna_0">상품</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="qna_1" name="gongu_status" value="1" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'1')? "checked":""}>
										<label for="qna_1">주문</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="qna_2" name="gongu_status" value="2" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'2')? "checked":""}>
										<label for="qna_2">배송</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="qna_3" name="gongu_status" value="3" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'3')? "checked":""}>
										<label for="qna_3">교환/환불</label>
									</div>
									<c:if test="${sessionScope.loginAuthor eq 0 }">
										<div class="frm_group">
											<input type="checkbox" id="qna_21" name="gongu_status" value="21" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'21')? "checked":""}>
											<label for="qna_21">결제</label>
										</div>
										<div class="frm_group">
											<input type="checkbox" id="qna_22" name="gongu_status" value="22" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filterList,'22')? "checked":""}>
											<label for="qna_22">기타</label>
										</div>
									</c:if>
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
									<option value="member_name" ${sOption eq 'member_name'? 'selected':''}>작성자</option>
									<option value="qna_subject" ${sOption eq 'qna_subject'? 'selected':''}>제목</option>
								</select>
								<div class="utils_search frm_control">
									<input type="text" name="search_keyword" value="${sKeyword }">
									<button id="btn_search" type="button" class="btn_search">검색</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="list gongu_list">
					<div class="list_header">
						<span>상태</span>
						<span>제목</span>
						<span>작성자</span>
						<span>등록일</span>
						<span>답변일</span>
					</div>
					<div class="list_body">
						<c:choose>
							<c:when test="${qnaList.size() > 0 }">
								<c:forEach var="qna" items="${qnaList}" varStatus="">
										<div class="list_item ${qna.qna_isanswer eq '1'? 'reject':'' }">	
											<a href="adminQnaDetailViewAction.ad?qna_id=${qna.qna_id}">
											<span>
												<c:choose>
													<c:when test="${qna.qna_isanswer eq '0' }">미답변</c:when>
													<c:otherwise>답변완료</c:otherwise>
												</c:choose>
											</span>
											<span>${qna.qna_subject }</span>
											<span>${qna.qna_member_id}</span>
											<span>${qna.qna_qdate}</span>
											<span>${qna.qna_adate eq null? "":qna.qna_adate }</span>
											
											</a>
										</div>
									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p class="noItem">등록된 문의가 없습니다.</p>
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
		$(".header_item.qna").addClass("active");
		
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

