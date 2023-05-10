<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	$(document).ready(function(){
		//header 메뉴 active
		$("#header .header_item").removeClass("active");
		$("#header .member").addClass("active");
	});
</script>

<div id="content" class="container">
	<div class="row">
		<div class="col-12">
			<div class="section">
				<!-- conts1 : 멤버필터 + 리스트 -->
				<div class="sec_header">
					<h5>회원검색</h5>
					<div class="utils">
						<div class="right">
							<div class="input_group">
								<select name="sch_options" class="frm_control">
									<option>아이디</option>
									<option>이름</option>
								</select>
								<div class="utils_search frm_control">
									<input type="text" name="sch_keyword">
									<button type="button" class="btn_search">검색</button>
								</div>
							</div>
							<c:if test="${sessionScope.loginAuthor eq 1 }">
								<a href="gonguRegistForm.go" class="btn btn-primary">공구등록</a>
							</c:if>
						</div>
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
				<!-- //conts1 : 멤버필터 + 리스트 -->
			</div>
		</div>
	</div>
</div>