<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="content" class="member">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section">
					<!-- conts1 : 멤버필터 + 리스트 -->
					<div class="sec_header">
						<h5>회원검색</h5>
						<div class="utils">
							<form id="filterForm" action="adminMemberListAction.ad" method="post">
								<input type="hidden" name="page" value="${pageInfo.page }">
								<div class="right">
									<div class="input_group">
										<select name="search_option" class="frm_control">
											<option value="member_id" ${sOption eq 'member_id'? 'selected':''}>아이디</option>
											<option value="member_name" ${sOption eq 'member_name'? 'selected':''}>이름</option>
										</select>
										<div class="utils_search frm_control">
											<input type="text" name="search_keyword" value="${sKeyword }">
											<button id="btn_search" type="button" class="btn_search">검색</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="list member_list">
						<div class="list_header">
							<span>아이디</span>
							<span>이름</span>
							<span>연락처</span>
							<span>이메일</span>
							<span>가입일</span>
						</div>
						<div class="list_body">
							<c:choose>
								<c:when test="${memberList.size() > 0 }">
									<c:forEach var="member" items="${memberList }">
										<div class="list_item">
											<a href="adminMemberDetailView.ad?member_id=${member.member_id }">
												<span>${member.member_id }</span>
												<span>${member.member_name }</span>
												<span>${member.member_tel }</span>
												<span>${member.member_email }</span>
												<span>${member.member_date }</span>
											</a>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p class="noItem">등록된 회원이 없습니다.</p>
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
					<!-- //conts1 : 멤버필터 + 리스트 -->
				</div>
			</div>
		</div>
	</div>
	
</div>

<script>
	$(document).ready(function(){
		//header 메뉴 active
		$(".header_item").removeClass("active");
		$(".header_item.member").addClass("active");
		
		//검색
		$("#btn_search").on('click', function(){
			pageAction(1);
			$("#filterForm").submit();
		});
	});
	
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