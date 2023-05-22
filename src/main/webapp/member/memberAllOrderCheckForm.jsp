<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">    
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:1200px;
		margin: 0 auto;
		margin-top:30px;		
		display:flex;	
		flex-wrap: wrap;
	}
	.left{
		width:200px;
		padding:10px;		
	}
	.right{
		width:1000px;
	}
	.profile{
		/* border:1px dashed black; */
	}
	.names{
		display:flex;
		align-items:  baseline;
	}
	.name{
		font-size: 32px;
		font-weight: 500;
		margin-right: 12px;		
	}
	.inner{
		width:1200px;
	}
	.rates{
		width:1000px;
		height:80px;
		display:flex; 
		background-color: black; 
		justify-content: space-between;

	}
	.rate{
			color:white; 
			width:400px; 
			height:80px;			
			display:flex; 		  
			flex-direction:column;		
			justify-content: space-between;
			padding:3px;
			
	}
		.grade{
			color:white;
			font-size:26px;	
			font-weight:500;
		}
		.a{
			display:flex;
			justify-content: space-between;
			align-items: baseline;
		
		}
		.ext{
			width:120px;
			height:20px;
			font-size: 12px;
			border-radius: 15px;
			color:white;
			border:1.5px solid white;
			text-align: center;
		}
		.temp{
			padding-left:5px;
			color:white;
		}
		.point{
			width:220px;
		}
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
				margin-top:14px;
				border-top:3px solid black;		
			}
			caption{
				caption-side: top;
				text-align: left;
				font-size: 20px;
				font-weight: bold;
			}
			.table_ti{
				margin-top:32px;
				display:flex;
				justify-content: space-between;
				align-items: center;
			}
			.more_icon{
				width:30px;
				height:30px;
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

	<div class="ordercontent">
		<div class="table_ti">
			<span style="font-size: 24px; font-weight: 500;">주문내역</span>
			
		</div>
		<table>
			<tr style="text-align: center; height:30px; border-bottom: 1px solid black; ">
				<th>주문일</th>
				<th colspan ='2'>주문내역</th>
				<th>주문번호</th>
				<th>결제금액</th>
			</tr>
		<c:forEach var="orderlist" items="${allList }">
			<tr style="border-bottom : 1px solid black; text-align: center; height:55px;">
				<td>${orderlist.order_date }</td>
				<td class="imgtd"><div class="tb_img" style="margin-left: 30px;"><img src="${pageContext.request.contextPath}/gongu/images/${orderlist.gongu_thimg }" style="width:52px; height:52px;"></div></td>
				<td style="text-align:left;">${orderlist.gongu_name }</td>
				<td>ORDERNUM-${orderlist.order_id }</td>
				<td>${orderlist.order_price }</td>
			</tr>
			</c:forEach>
		</table>
		</div>

</body>
</html>