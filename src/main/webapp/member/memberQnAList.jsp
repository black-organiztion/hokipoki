<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<style>
	.instruction{
		margin-top: 30px;
	}
	.writebtn{
		width:80px;
		height:40px;
		background-color: black;
		color:white;
		text-align: center;
		
	}

	.qnabtn{
		width:80px;
		height:40px;
		background-color: black;
		color:white;
		
	}
	th{
		height:50px;
	}
	tr{
		height:40px;
		border-bottom: 1px solid black !important;
	}
	tr:last-child{
		border-bottom: 3px solid black !important;	
	}
	.btnwrap{
		display:flex;
		justify-content: flex-end;
	}
	.etc{
		color:gray;
		font-size: 14px;
	}
	.qnalist{
		margin-bottom: 20px;
	}
	.qna_wrap{margin-top:14px; border:3px solid black; border-width:3px 0px; font-size:16px;}
	.qna_header{display:flex; border-bottom:1px solid #212529;}
	.qna_header>div{display:inline-flex; align-items:center; height:50px; padding:5px; color:#212529; font-weight:700;}
	
	.qna_header>div:nth-child(1),.qna_info>div:nth-child(1){flex:0 0 auto; width:15%;}
	.qna_header>div:nth-child(2),.qna_info>div:nth-child(2){flex:1 1 auto;}
	.qna_header>div:nth-child(3),.qna_info>div:nth-child(3){flex:0 0 auto; width:15%;}
	
	/* 질문 */
	.qna_item{position:relative; border-bottom:1px solid #000; height:45px; overflow:hidden; transition:0.4s;}
	.qna_item .caret{position:absolute; top:0; right:0; display:block; width:45px; height:45px; background-image:url(./img/admin/content/chevron_right_b50.svg); background-repeat:no-repeat; background-position:center; transform:rotate(90deg);}
	.qna_item.on .caret{transform:rotate(-90deg);}
	.qna_item.answered {cursor:pointer;}
	.qna_info{display:flex; min-height:45px; border-bottom:1px solid #eee;}
	.qna_info>div{display:inline-flex; align-items:center; padding:5px;}
	/* 질문본문 */
	.qna_content>div{padding:5px;}
	.qna_content>div:nth-child(1){display:flex; align-items:center;}
	.qna_content>div:nth-child(1)>span{flex:0 0 auto; display:inline-flex; align-items:center; color:#999;}
	.qna_content>div:nth-child(1)>span:after{content:''; margin:4px 20px 0 20px; width:2px; height:15px; background:#999;}
	.qna_content>div:nth-child(2){min-height:100px;}
	.qna_content .img_wrap{position:relative; width:150px; height:150px; padding:0; margin:20px 0 10px 5px; background:#d9d9d9;}
	.qna_content .img_wrap>img{max-width:100%;}
	.qna_content .img_wrap>.btn_scale{position:absolute; bottom:0; right:0; padding:6px 10px; background-color:#212529; color:#fff!important; font-size:14px;}
	
	/* 답변 */
	.answer{background-color:#f5f5f5; border-top:1px solid #000;}
	.answer>div{padding:5px;}
	.answer>div:nth-child(1){display:flex; align-items:center;}
	.answer>div:nth-child(1)>span{flex:0 0 auto; display:inline-flex; align-items:center; color:#999;}
	.answer>div:nth-child(1)>span:after{content:''; margin:4px 20px 0 20px; width:2px; height:15px; background:#999;}
	.answer>div:nth-child(2){min-height:100px;}
	
	/* 페이징 */
	.page-item{margin:0 3px!important;}
	.page-link{border:none!important; transition:0.1s!important;}
	.page-link:hover{background-color:#ddd!important;}
	.page-link.disabled{background-color:transparent !important; color:#999 !important; border:none!important;}
	.page-link.active{background-color:#212529!important; color:#fff!important;}
	
</style>
</head>
<body>

	<div class="instruction">
		<label style="font-size:24px; font-weight: 500; margin-bottom: 30px;">1:1문의내역</label><br>
		<div class="etc">
		상담시간<br>
		평일(월~금) 10:00 ~ 17:00<br>
		한번 등록한 상담내용은 수정이 불가능합니다.<br>
		우리 기관은 관련법령에 따라 상담원 보호조치를 시행 중입니다.<br>
		</div>
	</div>
	<div class="qnalist">
		<div class="btnwrap">
		<button type="button" class="qnabtn"onclick="location.href='${pageContext.request.contextPath}/memberQnAForm.qu'">작성하기</button>
		</div>
		
		<div class="qna_wrap">
			<div class="qna_header">
				<div>상담구분</div>
				<div>제목</div>
				<div>답변여부</div>
			</div>
			<div class="qna_body">
				<c:forEach var="qna" items="${qnaList }">
					<c:if test="${qna.qna_category eq '0' }"><c:set var="cate" value="공구문의"/></c:if>
					<c:if test="${qna.qna_category eq '1' }"><c:set var="cate" value="주문문의"/></c:if>
					<c:if test="${qna.qna_category eq '2' }"><c:set var="cate" value="배송문의"/></c:if>
					<c:if test="${qna.qna_category eq '3' }"><c:set var="cate" value="교환/환불"/></c:if>
					<c:if test="${qna.qna_category eq '11' }"><c:set var="cate" value="결제문의"/></c:if>
					<c:if test="${qna.qna_category eq '21' }"><c:set var="cate" value="기타문의"/></c:if>
					<div class="qna_item ${qna.qna_isanswer eq '1'? 'answered':'' }">
						<c:if test="${qna.qna_isanswer eq '1' }">
							<span class="caret"></span>
						</c:if>
						<div class="question">
							<div class="qna_info">
								<div>${cate }</div>
								<div>${qna.qna_subject}</div>
								<div>
									<c:choose>
										<c:when test="${qna.qna_isanswer eq '0'}">
										미답변
										</c:when>
										<c:otherwise>
										답변완료
										</c:otherwise>
									</c:choose> 
								</div>
							</div>
							<div class="qna_content">
								<div><span>등록일</span>${qna.qna_qdate }</div>
								<div>
									${qna.qna_content }
									<c:if test="${qna.qna_file ne null }">
										<div class="img_wrap">
											<img src="${pageContext.request.contextPath}/member/qnaFiles/${qna.qna_file}">
											<a href="${pageContext.request.contextPath}/member/qnaFiles/${qna.qna_file}" class="btn_scale" target="_blank" rel="noopener" title="원본보기(새창열기)">원본보기</a>
										</div>
									</c:if>
								</div>
								
								
							</div>
						</div>
						<c:if test="${qna.qna_isanswer eq '1' }">
							<div class="answer">
								<div><span>답변일</span>${qna.qna_adate }</div>
								<div>${qna.qna_a_content }</div>
							</div>
						</c:if>
					</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
	<ul class="pagination justify-content-center">
			<li class="page-item">
				<c:choose>
					<c:when test="${pageInfo.page<=1 }">
						<a href="#" class="page-link disabled">이전</a>
					</c:when>
					<c:otherwise>
						<a href="memberQnAList.qu?page=${pageInfo.page-1}" class="page-link">이전</a>
					</c:otherwise>
				</c:choose>
			</li>
			<c:forEach var="paging" begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1">
				
				<li class="page-item">
					<c:choose>
						<c:when test="${paging eq pageInfo.page }">
							<a href="#" class="page-link active">${paging }</a>
						</c:when>
						<c:otherwise>
							<a href="memberQnAList.qu?page=${paging }" class="page-link">${paging }</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
			
			<li class="page-item">
				<c:choose>
					<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						<a href="#" class="page-link disabled">다음</a>
					</c:when>
					<c:otherwise>
						<a href="memberQnAList.qu?page=${pageInfo.page+1}" class="page-link">다음</a>
					</c:otherwise>
				</c:choose>
			</li>
		</ul>
	

	<script>
	$(function(){		
		$(".qna_info").each(function(){
			$(this).on('click', function(){
				var qna = $(this).parents(".qna_item");
				var qnaH1 = qna.find(".question").outerHeight();
				var qnaH2 = qna.find(".answer").length > 0? qna.find(".answer").outerHeight():0;
				
				var totalH = qnaH1 + qnaH2;
				
				console.log(totalH);
				if(qna.hasClass('on')){
					qna.animate({
						height:45
					},200);
					qna.removeClass('on');
				}else{
					qna.animate({
						height:totalH
					},200);
					qna.addClass('on');
				}
				
			});
		});
	});
	</script>