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
		width:400px;
		padding:10px;		
	}
	.right{
		width:800px;
		
		display:flex;
		justify-content: space-between;
		flex-wrap: wrap;
	}
	.profile{
		border:1px dashed black;
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
	.rate{
			color:white; 
			width:300px; 
			height:70px;
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
			border-right: 1px solid white;
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
</style>
</head>
<body>
<c:if test="${member.membership_id eq 'e' }"><c:set var="membership">BRONZE</c:set></c:if>
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
			<li>주문배송조회</li>
			<li>취소/교환/반품 내역</li>
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
	<div class="right" style="border:2px dashed red;">
		<div class="rates" style="border:1px dashed blue; display:flex; background-color: black; justify-content: space-between;">	
			<div class="rate">
				<div class="temp">
					<span style="font-size:12px;">회원등급</span>
						<div class="a">
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
					<span style="font-size:12px; color:whtie;">사용가능한 쿠폰</span>
						<div class="a">
							<div class="grade" >
							27
							</div>
						</div>	
				</div>
			</div>		
			<div class="point">
				<div class="temp">
					<span style="font-size:12px; color:whtie;">포인트</span>
						<div class="a">
							<div class="grade" >
								530
							</div>
						</div>	
				</div>
			</div>
		</div>
		<style>
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
		</style>
	<div class="inner" >
		<label>주문배송조회</label>
		<div class="orderinfo">
			<div class="ti" >
				<span>상품정보</span>
				<span>배송비</span>
				<span>진행상태</span>
			</div>
			<div class="orderbox">		
				<div class="orderdate">
					<label>주문일자</label>
					<span>2022.05.05 </span>
				</div>
				<div class="ordernum">
					<label>주문번호</label>
					<span>ORD20220505-2</span>
				</div>
			</div>
		</div>
		<div class="gongu_info">
			<div class="gongu_img">
			</div>
			<div class="gongu_txt">
				<div class="1">
					<div class="gongu_title"></div>
					<div class="gongu_price"></div>
				</div>
				<div class="2">
					<div class="delivery_fee"></div>
				</div>		
				<div class="3">
					<div class="order_status"></div>
				</div>		
				<div class="4">
					<div class="Q_btn">
					</div>
				</div>
			</div>
		</div>	
	</div>			
	</div>
	


</div>



<%-- <div class="outer">
	<c:forEach var="order" items="${orderList }" varStatus="status">
		${order.order_date }
	</c:forEach>


</div>
--%>
</body>
</html>