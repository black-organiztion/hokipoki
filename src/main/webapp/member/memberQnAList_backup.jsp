<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		margin-bottom: 60px;
	}
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
		<table>
		<tr>
			<th style="width:200px;">상담구분</th>
			<th style="width:500px;">제목</th>
			<th>답변여부</th>
		</tr>
		<c:forEach items="${QnAList}" var="QnA">
		<tr>
		<c:if test="${QnA.qnA_category eq '0' }"><c:set var="cate" value="공구문의"/></c:if>
		<c:if test="${QnA.qnA_category eq '1' }"><c:set var="cate" value="주문문의"/></c:if>
		<c:if test="${QnA.qnA_category eq '2' }"><c:set var="cate" value="배송문의"/></c:if>
		<c:if test="${QnA.qnA_category eq '3' }"><c:set var="cate" value="교환/환불"/></c:if>
		<c:if test="${QnA.qnA_category eq '4' }"><c:set var="cate" value="결제"/></c:if>
		<c:if test="${QnA.qnA_category eq '5' }"><c:set var="cate" value="기타"/></c:if>
			<td>${cate}</td>
			<td id="sub"  onclick="showContent(this)"><a href="#">${QnA.qnA_subject}</a></td>
			<td>
 			<c:choose>
				<c:when test="${QnA.qnA_reply ne null}">
				YES
				</c:when>
				<c:otherwise>
				NO
				</c:otherwise>
			</c:choose> 
			</td>
		</tr>	

		<tr class="content-row" id="cons" style="display:none;" >
			<td colspan="3" class="tdc">
				<div class="content">${QnA.qnA_contents}</div>
			</td>
		</tr>
		</c:forEach>
		</table>
	
	</div>

	<script>
 	var flag = true;
	function showContent(e) {
		var con = document.getElementById("cons");
		if(con.style.display=="none"){
			con.style.display="block";
		}else{
			con.style.display="none";
		}
		
	} 
	</script>

</body>
</html>