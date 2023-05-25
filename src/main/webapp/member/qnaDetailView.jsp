<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="content">
	<div class="">
		<a href="${pageContext.request.contextPath}/qnaListAction.qu" class="btn btn-primary">목록</a>
	</div>
	<h5>문의상세보기</h5>
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
		${qna }
		<table>
			<tr>
				<th>분류</th><td>${category }</td>
			</tr>
			<c:choose>
				<c:when test="${qna.qna_category eq 0 }">
					<tr>
						<th>공구명</th><td>${qna.gongu_id eq 0? "": qna.gongu_id}</td>
					</tr>
				</c:when>
				<c:when test="${qna.qna_category > 0 && qna.qna_category < 10 }">
					<tr>
						<th>주문명</th><td>${qna.order_id eq 0? "": qna.order_id}</td>
					</tr>
				</c:when>
			</c:choose>
			 <tr>
				<th>작성일</th><td>${qna.qna_qdate }</td>
			</tr>
			<tr>
				<th>제목</th><td>${qna.qna_subject }</td>
			</tr>
			<tr>
				<th>내용</th><td>${qna.qna_content }</td>
			</tr>
			<tr>
				<th>첨부파일</th><td><c:if test="${qna.qna_file ne null }">${qna.qna_file eq null? '': qna.qna_file} <img src="${pageContext.request.contextPath}/${qna.qna_file eq null? '': qna.qna_file}"/></c:if></td>
				
			</tr>
		</table>
		
		<c:if test="${qna.qna_isanswer eq '1'}">
		<table>
			<tr>
				<td>답변자</td>
				<td>답변일</td>
				<td>답변내용</td>
			</tr>
			
		</table>
		</c:if>

</div>