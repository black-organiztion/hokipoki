<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
String alert = request.getParameter("alert");
if(alert != null){%>
	<script>
		alert("판매자에게 답변권한이 넘어갔습니다.\n 문의정보는 확인할 수 있지만 답변은 불가능 합니다.");
	</script>
<%
}
%>	



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

<div id="content" class="bg qna_detail">
	
	<div class="container">
		<div class="row">
			<!-- conts1:판매자정보 -->
			<div class="col-12">
				<div class="cont_header">
					<a id="btn_list" href="adminQnaListAction.ad">목록</a>
					<h2>문의상세조회</h2>
					<div class="right">
						<c:if test="${qna.qna_isanswer eq '0' }">
							<div class="">
								<!-- 문의답변-->
								<button id="btn_answer" class="bt bt_primary ${qna.qna_category < 20 && qna.qna_author eq 1 && sessionScope.loginAuthor eq 0 ? 'disabled':''}" type="button" ${qna.qna_category < 20 && qna.qna_author eq 1 && sessionScope.loginAuthor eq 0 ? "data-bs-toggle='tooltip' data-bs-placement='left'":""} data-bs-title="${qna.qna_category < 20 && qna.qna_author eq 1 && sessionScope.loginAuthor eq 0 ? '판매자 우선 답변 문의입니다.':'' }">답변하기</button>
								<c:if test="${sessionScope.loginAuthor eq 0 && sessionScope.loginAuthor eq qna.qna_author && (10 < qna.qna_category && qna.qna_category < 20) }">
									<button id="btn_send" class="bt bt_primary" type="button">넘기기</button>
								</c:if>								
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-12 section question">
				<div class="card">
					<h5>문의</h5>
					<div class="q_wrap">
						<div class="subject">
							<p class="title">${qna.qna_subject }</p>
						</div>
						<div class="q_info">
							<div class="info1"><em>작성자</em><span>${qna.member_id }</span></div>
							<div class="info1"><em>등록일</em><span>${qna.qna_qdate }</span></div>
							<div class="info3"><em>문의유형</em><span>${cate}</span>
								<span>
									<c:choose>
										<c:when test="${qna.qna_category eq 0 }">
											${qna.gongu_name }
										</c:when>
										<c:when test="${qna.qna_category > 0 && qna.qna_category < 20 }">
											${qna.order_info }
										</c:when>
									</c:choose>
								</span>
							</div>
						</div>
						<div class="q_content">
							${qna.qna_content }
						</div>
						<c:if test="${qna.qna_file ne null }">
							<div class="file">
								<div class="img_wrap">
									<img src="${pageContext.request.contextPath}/member/qnaFiles/${qna.qna_file}">
									<a href="${pageContext.request.contextPath}/member/qnaFiles/${qna.qna_file}" class="btn_scale" target="_blank" rel="noopener" title="원본보기(새창열기)">원본보기</a>
								</div>
							</div>
						</c:if>
					</div>

				</div>
			</div>
			<c:if test="${qna.qna_isanswer eq '1' }">
				<div class="col-12 section question" style="margin-top:20px;">
					<div class="card">
						<h5>답변</h5>
						<div class="a_wrap">
							<div class="a_info">
								<div>
									<em>답변일</em><span>${qna.qna_adate }</span>
								</div>
							</div>
							<div class="a_content">
								${qna.qna_a_content }
							</div>
						</div>
					</div>
				</div>
			</c:if>
			
		</div>
	</div>
</div>


<c:if test="${qna.qna_isanswer eq '0' }">
<div id="modalForm" class="modal fade" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content section">
			<div class="modal-header">
				<h5 class="modal-title">답변등록</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="answerForm" class="input_form" action="adminAnswerAction.qu" method="post">
					<input type="hidden" name="seller_id" value="${qna.seller_id}"/>
					<input type="hidden" name="qna_id" value="${qna.qna_id }"/>
					<input type="hidden" name="qna_category" value="${qna.qna_category }"/>
					<div class="frm_group mt-2">
						<label>답변내용</label>
						<div class="input_group">
							<textarea id="gongu_disabled_text" name="qna_a_content" class="frm_control p-2 required" placeholder="문의에 대한 답변을 입력해주세요." style="height: 400px;"></textarea>
						</div>
						<p class="frm_vld_txt"></p>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button id="btn_cancel" type="button" class="bt">취소</button>
				<button id="btn_submit" type="button" class="bt bt_primary">확인</button>
			</div>
		</div>
	</div>
</div>

<div id="confirmBox" class="modal fade cfmBox" tabindex="-1">
  <div class="modal-dialog modal-sm modal-dialog-centered">
    <div class="modal-content section">
      <div class="modal-header">
        <h5 class="modal-title">문의 넘기기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>
	        <c:choose>
	        	<c:when test="${qna.qna_author eq 0 }">판매자</c:when>
	        	<c:otherwise>관리자</c:otherwise>
	        </c:choose>
	        에게 답변권한을<br> 넘기시겠습니까?
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="bt" data-bs-dismiss="modal">취소</button>
        <a href="adminChangeQnaAuthor.qu?qna_id=${qna.qna_id }&qna_category=${qna.qna_category}" class="bt bt_primary">확인</a>
      </div>
    </div>
  </div>
</div>

</c:if>

<script>
	$(function(){
		//header 메뉴 active
		$(".header_item").removeClass("active");
		$(".header_item.qna").addClass("active");
		
		//버튼클릭이벤트
		$("#btn_answer").not(".disabled").on('click', function(){
			$("#modalForm").modal('show');
		});
		
		$("#btn_cancel").on('click', function(){
			formReset('modalForm');
			$('#modalForm').modal('hide');
		});
		
		$("#btn_submit").on('click', function(){
			if(fieldNullChk()==true){
				$("#answerForm").submit();
			}
		});
		
		$("#btn_send").on('click', function(){
			$("#confirmBox").modal('show');
		});
		
		$(".frm_control").each(function(idx,item){
			$(item).on('propertychange change keyup paste input', function(){
				var frmGroup = $(this).parents(".frm_group");
				if($(item).val === ''){
					
				}else{
					frmGroup.removeClass("fail");
					frmGroup.parent().next(".frm_vld_txt").text("");
				}
			});
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
