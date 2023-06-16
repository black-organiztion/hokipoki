<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<div id="content" class="qna_config">
	<div class="container divide">
		<div class="row">
			<div class="col-xl-2 col-12 side">
				<!-- conts2 : 상태별 공구 건수 -->
				<div class="section sec1">
					<div>
						<div class="gongu_cnts cnts">
							<c:if test="${sessionScope.loginAuthor eq 0 }">
								<span class="badge bg-primary">결제 및 기타</span>
							</c:if>
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
									<c:choose>
										<c:when test="${fn:contains(filterList,'all') }"></c:when>
										<c:otherwise>
											<c:set var="filter_list" value=""/>
											<c:forEach var="filters" items="${filterList }" varStatus="loop">
												<c:choose>
													<c:when test="${loop.first }">
														<c:set var="prefixedValue" value=",${filters }"/>
													</c:when>
													<c:otherwise>
														<c:set var="prefixedValue" value="${filters }"/>
													</c:otherwise>
												</c:choose>
												<c:set var="filter_list" value="${filter_list}${prefixedValue},"/>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									<div class="frm_group">
										<input type="checkbox" id="qna_all" name="qna_category" value="all" class="frm_chk" ${fn:contains(filterList,'all')? "checked":""}>
										
										<label for="qna_all">전체</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="qna_0" name="qna_category" value="0" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filter_list,',0,')? "checked":""}>
										<label for="qna_0">공구</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="qna_1" name="qna_category" value="1" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filter_list,',1,')? "checked":""}>
										<label for="qna_1">주문</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="qna_2" name="qna_category" value="2" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filter_list,',2,')? "checked":""}>
										<label for="qna_2">배송</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="qna_3" name="qna_category" value="3" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filter_list,',3,')? "checked":""}>
										<label for="qna_3">교환/환불</label>
									</div>
									<div class="frm_group">
										<input type="checkbox" id="qna_11" name="qna_category" value="11" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filter_list,',11,')? "checked":""}>
										<label for="qna_11">결제</label>
									</div>
									<c:if test="${sessionScope.loginAuthor eq 0 }">
										<div class="frm_group">
											<input type="checkbox" id="qna_21" name="qna_category" value="21" class="frm_chk" ${fn:contains(filterList,'all')||fn:contains(filter_list,',21,')? "checked":""}>
											<label for="qna_21">기타</label>
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
									<option value="member_id" ${sOption eq 'member_id'? 'selected':''}>작성자</option>
									<option value="qna_content" ${sOption eq 'qna_content'? 'selected':''}>내용</option>
								</select>
								<div class="utils_search frm_control">
									<input type="text" name="search_keyword" value="${sKeyword }">
									<button id="btn_search" type="button" class="btn_search">검색</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="list qna_list">
					<div class="list_header">
						<span>상태</span>
						<span>유형</span>
						<span>제목</span>
						<span>작성자</span>
						<span>등록일</span>
						<span>답변일</span>
					</div>
					<div class="list_body">
						<c:choose>
							<c:when test="${qnaList.size() > 0 }">
								<c:forEach var="qna" items="${qnaList}" varStatus="">
									<c:set var="listStyle" value=""/>
									<c:if test="${qna.qna_isanswer eq '1' }">
										<c:set var="listStyle" value="reject"/>
									</c:if>
									<c:set var="listAuthor" value=""/>
									<c:if test="${qna.qna_author ne sessionScope.loginAuthor }">
										<c:set var="listAuthor" value="noAuthor"/>
									</c:if>
									<div class="list_item ${listStyle} ${listAuthor}">	
										<a href="adminQnaDetailViewAction.ad?qna_id=${qna.qna_id}&qna_category=${qna.qna_category}">
										<span>
											<c:choose>
												<c:when test="${qna.qna_isanswer eq '0' }">미답변</c:when>
												<c:otherwise>답변완료</c:otherwise>
											</c:choose>
										</span>
										<c:if test="${qna.qna_category eq 0 }">
											<c:set var="cate" value="공구"/>
										</c:if>
										<c:if test="${qna.qna_category eq 1 }">
											<c:set var="cate" value="주문"/>
										</c:if>
										<c:if test="${qna.qna_category eq 2 }">
											<c:set var="cate" value="배송"/>
										</c:if>
										<c:if test="${qna.qna_category eq 3 }">
											<c:set var="cate" value="교환/환불"/>
										</c:if>
										<c:if test="${qna.qna_category eq 11 }">
											<c:set var="cate" value="결제"/>
										</c:if>
										<c:if test="${qna.qna_category eq 21 }">
											<c:set var="cate" value="기타"/>
										</c:if>
										<span>${cate }</span>
										<span>${qna.qna_subject }</span>
										<span>${qna.member_id}</span>
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
	let loginAu = '${sessionScope.loginAuthor}';
	loginAu = Number(loginAu);
	
	$(document).ready(function(){
		
		//header 메뉴 active
		$(".header_item").removeClass("active");
		$(".header_item.qna").addClass("active");
		
		//필터
		//로그인 권한이 판매자인지 관리자인지에 따라 필터아이템 대상 다르게 적용 
		if(loginAu > 0){
			var filter_item = $("input[name=qna_category][value]");
			filter_item.filter(function(){
				var value = parseInt($(this).val());
				return isNaN(value) || value < 20;
			});
			
		}else{
			var filter_item = $("input[name=qna_category]");
		}
		
		//filter_item test
		//'filter_item'은 jquery 객체이므로 배열처럼 인덱스로 직접 접근 불가 => .val()사용불가
		//대신에 eq()메소드를 사용해 선택한 요소 중 특정 인덱스 요소를 가져와 .val()사용가능
		/*
		for(var i=0; i<filter_item.length; i++){
			console.log(filter_item.eq(i).val());
		}
		*/
		
		//필터 체크박스 전체선택, 해제
		var checkAll = $("#qna_all");
		checkAll.on('click',function(){
			if(checkAll.is(":checked") == true){
				filter_item.prop("checked", true);
			}else{
				filter_item.prop("checked", false);
			}
		});
		
		
		
		filter_item.not(checkAll).on('click', function(){
			var totalL = filter_item.not(checkAll).length;
			var checkedL = filter_item.not(checkAll).filter(":checked").length;
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

