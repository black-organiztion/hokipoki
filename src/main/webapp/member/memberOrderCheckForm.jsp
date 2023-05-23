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
		margin-bottom: 10px;
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

			a{
				text-decoration: none !important;
				color:#494949 !important;
			}	
			ul>li:nth-child(1) {
				font-size: 20px; 
				font-weight: 500;
				}
			li{
				margin-bottom: 3px;
			}	
</style>
</head>
<body>
<c:if test="${member.membership_id eq 'e' }"><c:set var="membership">BRONZE</c:set></c:if>
<c:if test="${member.membership_id eq 'd' }"><c:set var="membership">SILVER</c:set></c:if>
<c:if test="${member.membership_id eq 'c' }"><c:set var="membership">GOLD</c:set></c:if>
<c:if test="${member.membership_id eq 'b' }"><c:set var="membership">PLATINUM</c:set></c:if>
<c:if test="${member.membership_id eq 'a' }"><c:set var="membership">VIP</c:set></c:if>
<div class="outer">
	<div class="left">
		<div class="profile">
			<div class="names">
				<div class="name">
				${member.member_name }
				</div>
				님
			</div>
		</div>
		
		<ul>
			<li>나의 쇼핑정보</li>
			<li><a href="${pageContext.request.contextPath}/allorderlist.or">주문배송조회</a></li>
			<li>증빙서류 발급</li>
		</ul>
		<ul>
			<li>나의 계정설정</li>
			<li>회원정보수정</li>
			<li>회원등급</li>
			<li>쿠폰</li>
			<li>포인트</li>
		</ul>
		<ul>
			<li>고객센터</li>
			<li>1:1문의내역</li>
			<li>공지사항</li>
			<li>고객의 소리</li>
		</ul>
	</div>

	<div class="right">
		<div class="rates" >	
			<div class="rate">
				<div class="temp">
					<span>회원등급</span>
						<div class="a" style="margin-top: 10px;">
							<div class="grade" >
							${membership }
							</div>
							<div class="ext">
							등급혜택 살펴보기
							</div>
						</div>	
				</div>
			</div>
			<div class="point">
				<div class="temp">
					<span>사용가능한 쿠폰</span>
						<div class="a" style="margin-top: 13px;">
							<div class="grade" >
							27
							</div>
						</div>	
				</div>
			</div>		
			<div class="point">
				<div class="temp">
					<span >포인트</span>
						<div class="a" style="margin-top: 13px;">
							<div class="grade" >
								530
							</div>
						</div>	
				</div>
			</div>
		</div>
	<div class="ordercontent">	
		<div class="table_ti">
			<span style="font-size: 24px; font-weight: 500;">최근 주문내역</span>
			<div class="more_icon"><a href="${pageContext.request.contextPath}/allorderlist.or"><img src="${pageContext.request.contextPath}/img/icon/more.svg"></a></div>
		</div>
		<table>
			<tr style="text-align: center; height:30px; border-bottom: 1px solid black; ">
				<td>주문일</td>
				<td >주문내역</td>
				<td>주문번호</td>
				<td>결제금액</td>
			</tr>
		<c:forEach var="orderlist" items="${orderList }">
			<tr style="border-bottom : 1px solid black; text-align: center; height:55px;">
				<td>${orderlist.order_date }</td>
				<td class="imgtd"><div class="tb_img"><img src="${pageContext.request.contextPath}/gongu/images/${orderlist.gongu_thimg }" style="width:52px; height:52px;"></div><span style="margin-left: 8px;">${orderlist.gongu_name }</span></td>
				<td>ORDERNUM-00${orderlist.order_id }</td>
				<td>${orderlist.order_price }</td>
			</tr>
			</c:forEach>
		</table>
		</div>
		</div>
</div>
</body>
</html>	
