<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="content">
	<div class="">
		<a href="${pageContext.request.contextPath}/questionForm.qu" class="btn btn-primary">문의하기</a>
	</div>
	<h5>문의목록</h5>
	<ul>
		<c:choose>
			<c:when test="${qnaList.size() > 0 }">
				<c:forEach var="qna" items="${qnaList }">
					<li>
						<a href="${pageContext.request.contextPath}/qnaDetailViewAntion.qu?qna_id=${qna.qna_id }" style="display:flex;" class="border">
							<c:choose>
								<c:when test="${qna.qna_category eq 0 }">
									<c:set var="category" value="공구"/>
								</c:when>
								<c:when test="${qna.qna_category eq 1 }">
									<c:set var="category" value="주문"/>
								</c:when>
								<c:when test="${qna.qna_category eq 2 }">
									<c:set var="category" value="배송"/>
								</c:when>
								<c:when test="${qna.qna_category eq 3 }">
									<c:set var="category" value="교환/환불"/>
								</c:when>
								<c:when test="${qna.qna_category eq 21 }">
									<c:set var="category" value="결제"/>
								</c:when>
								<c:when test="${qna.qna_category eq 22 }">
									<c:set var="category" value="기타"/>
								</c:when>
							</c:choose>
							
							구분 : ${category }<br>
							제목 : ${qna.qna_subject }<br>
							<c:choose>
								<c:when test="${qna.qna_isanswer eq '0' }">
									<c:set var="isAnswer" value="미답변"/>
								</c:when>
								<c:otherwise>
									<c:set var="isAnswer" value="답변"/>
								</c:otherwise>
							</c:choose>
							답변여부 : ${isAnswer }<br>
							등록일 : ${qna.qna_qdate } 
						</a>
					</li>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>등록하신 문의글이 없습니다</p>
			</c:otherwise>
		</c:choose>
	</ul>
</div>