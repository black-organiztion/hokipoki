<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">    
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		ul{
			list-style-type:none;
			padding-left: 0 !important;		
		}
		li{
			list-style-type:none;
			padding-left: 0;
		}
		.temp > span{
			font-size:12px;
		}
		.ext{
			margin-right: 8px;
		}	
		.ti{
				border-top: 3px solid black;
				border-bottom:1px solid black;
				display:flex;
				justify-content: space-between;
			}
			.ti:nth-child(1) {
				flex-grow:4;
			}
			.ti:nth-child(2){
				flex-grow:1
			}
			.ti:nth-child(3){
				flex-grow:1
			}
			.orderbox{
				display:flex;
			}
			table{
				width:1000px;
				margin-top:14px;
				border-top:3px solid black;		
			}
			caption{
				caption-side: top;
				text-align: left;
				font-size: 20px;
				font-weight: bold;
			}


			.tb_img{
			
				width:55px;
				height:55px;
				margin-top: 2px;
			}
			.imgtd{
				display:flex;
				align-items: center;
				justify-content: center;
			}		
</style>
</head>
<body>
	<div class="outers">
		<div class="table_ti">
			<div style="font-size: 24px; font-weight: 500;">주문내역</div>
		</div>
		<table>
			<tr style="text-align: center; height:30px; border-bottom: 1px solid black; ">
				<th>주문일</th>
				<th colspan ='2'>주문내역</th>
				<th>주문번호</th>
				<th>결제금액</th>
			</tr>
				<c:if test="${fn:length(allList) <= 0}">
				<tr>
				<td colspan="5" style="text-align: center; height:50px; border-bottom: 1px solid black;">구매목록이 없습니다.</td>
				</tr>
				</c:if>
		<c:forEach var="orderlist" items="${allList }">
			<tr style="border-bottom : 1px solid black; text-align: center; height:55px;">
				<td>${orderlist.order_date }</td>
				<td class="imgtd"><div class="tb_img" style="margin-left: 30px;"><img src="${pageContext.request.contextPath}/gongu/images/${orderlist.gongu_thimg }" style="width:52px; height:52px;"></div></td>
				<td style="text-align:left;">${orderlist.gongu_name }</td>
				<td>ORDERNUM-00${orderlist.order_id }</td>
				<td>${orderlist.order_price }</td>
			</tr>
			</c:forEach>
		</table>
		
	</div>
</body>
</html>