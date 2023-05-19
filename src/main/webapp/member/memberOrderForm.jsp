<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500display=swap" rel="stylesheet">  
<title>Insert title here</title>
<style>
	.outer{
		margin:0 auto;
		padding-top:40px;
		width:1200px;		
	}
	.gongu{
		display:flex;	
	}
	.th{		
		width:180px;
		height: 180px;
		margin-right: 20px;
	}
	#gonguImage{
		width: 180px;
		height: 180px;
	}
	
	.gongu_cate{
		font-size:12px;
		color:#c9c9c9;
	}
	.gongu_name{
		font-size:21px;		
	}
	.extra{
		color:#c9c9c9;
		font-size: 12px;
		margin-top:16px;
		margin-bottom: 46px;
	}
	

	.gongu_num{
		display:flex;
		align-items: baseline;
	}
	.gongu_price{
		font-size:24px;
		font-weight: 500;
		margin-right: 12px;
	}
	
	.bottom{
		margin-top:50px;
		width:1200px;
		display:flex;
		
		justify-content: space-between;
	}
	.left_side{
		width:600px;		
		height:600px;
	}
	.right_side{
		width:460px;
		
	}
	#paybtn{
		width:460px;
		background-color: orange;
		border-radius: 8px;
		color:white;
		font-size: 18px;
		height:42px;
		border:0px solid black;
	}
	.etc{
		font-size:12px;
		color:#494949;
		margin-bottom: 20px;
	}


.search_in{display: block;margin: 1px 2px 3px 4px;} 

.search_in input{width:100%}


.delivery_info{
	with:680px;
	height:100px;
	border:1px solid #c9c9c9;
	padding:5px;
	border-radius: 6px;
}
#modbtn{
	width:50px;
	height:30px;
	border:1px solid #c9c9c9;
	border-radius: 15px;
	background-color: white;
	margin-left: 50px;
	
}

.dname{
	font-size: 18px;
	font-weight: 400;
}
.deliveryaddr{
	width:500px;
	display:flex;	
}

.r_tel{
	margin-right: 20px;
}

.d_tel{
	display: flex;
}
.def{
	font-size:14px;
	text-align:center;
	height:24px;
	width:40px;
	background-color: orange;
	color:white;
	border-radius: 14px;
	margin-left: 14px;	
	padding-top:1px;
	justify-content: center;
	align-items: center;
	
}
.top{
	display: flex;
	align-items: center;
	margin-bottom: 12px;

}

.tel > label{
	margin-right: 10px;
}
.pinfo{
	width:460px;
	
	margin-top: 40px;
	
}
.delivery_fee{
	color:#d1d1d1;
	font-size: 12px;
	text-align: right;
	margin-bottom: 4px;
}
.fee{
	display:flex;
	justify-content:space-between;
	font-weight: 500;	
	color: #494949;
	font-size: 21px;
	margin-bottom: 12px;
}
.tel{
	display: flex;
}

.left_side > label{
	font-size: 18px;
	font-weight: 500;
	margin-bottom: 14px;
}

.gongusanse{
	display:flex;
	margin-bottom: 20px;
}
.gongusanse{
	margin-top: 12px;
}

.sanse_title{
	width:100px;
}	

.gongusanse_outer{
	border:1px solid #c9c9c9; 
	padding-left:16px;
	padding-top:10px;
	padding-bottom:20px;
	border-radius: 6px; 
	margin-bottom: 24px;
}
</style>

</head>
<body>
<div class="outer">
		<div class="gongu">
			<div class="th">
				<a href="${pageContext.request.contextPath}/gonguView.go?id=${gongu.gongu_id}">
				<img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }" id="gonguImage">
				</a>
			</div>
			<div class="gongu_info">
				<div class="gongu_cate">				
					${gongu.category }
				</div>
				<div class="gongu_name">				
					${gongu.gongu_name }
				</div>
				<div class="extra">				
					공구 성공시, 결제는 ${gongu.gongu_caldate }에 진행됩니다.<br> 공구가 무산되거나 중단된 경우에는 예약된 결제는 자동으로 취소됩니다.
					이용에 참고 부탁드립니다.					
				</div>
				<div class="gongu_num">				
					<div class="gongu_price">				
						${gongu.gongu_discount_price }
					</div>
					<div class="gongu_findate">				
						${gongu.gongu_findate}
					</div>
				</div>	
			</div>
	</div>
	<div class="bottom">
		<div class="left_side">
			<label>공구 정보</label>
			<div class="gongusanse_outer" >
				<div class="gongusanse" >
					<div class="sanse_title">
						공구명
					</div>
					<div class="sanse_content">
						${gongu.gongu_name}
					</div>
				</div>
				<div class="gongusanse">
					<div class="sanse_title">
						공구 가격
					</div>
					<div class="sanse_content">
						${gongu.gongu_discount_price}
					</div>
				</div>
				<div class="gongusanse">
					<div class="sanse_title">
						예상 결제일
					</div>
					<div class="sanse_content">
						${gongu.gongu_caldate}
					</div>
				</div>
			</div>
				<label>구매자 정보</label>		
					<div class="gongusanse_outer" >
						<div class="gongusanse">
							<div class="sanse_title">
								연락처 1
							</div>	
							<div class="sanse_content" id="r_tel">
								${ delivery.receiver_tel }
							</div>									
						</div>
						<div class="gongusanse">	
							<div class="sanse_title">
								연락처 2
							</div>	
							<div class="sanse_content" id="r_tel2">						
								${ delivery.receiver_tel2 }
							</div>									
						</div>
						<div class="gongusanse">	
							<div class="sanse_title">
								이메일
							</div>	
							<div class="sanse_content">
								${member.member_email}
							</div>									
						</div>									
						
					</div>
						<label>배송지 정보</label>
						<div class="gongusanse_outer" >
							<div class="dinfo_con">
								<div class="top">
									<div class="dname" id="dname">
										${delivery.delivery_name }
									</div>
									<c:if test="${delivery.isdefault eq '1'}">
										<div class="def" id="def">
											기본
										</div>									
									</c:if>
								</div>
								<div class="deliveryaddr">
										<div class="zip" id="zip" >	
										[${delivery.zip_code}] &nbsp;									
										</div>
										<div class="juso1" id="juso1">
											${ delivery.addr1}
										</div>						
										<div class="juso2" id="juso2">
											${ delivery.addr2}
										</div>
									<input type="button" name="addDelivery" value="변경" id="modbtn"  onclick="window.open('member/addDeliveryForm.jsp?openInit=true','','width=400,height=200')">	
								</div>			
							
							</div>
						</div>				
				</div>
				
		<div class="right_side">
			<div class="etc">
				공구 성공시, 결제는 ${gongu.gongu_caldate }에 진행됩니다.<br> 공구가 무산되거나 중단된 경우, 예약된 결제는 자동으로 취소되며
				해당 공구에 대한 진행권한은 판매당사자에 있습니다.
			</div>
			
				<input type="checkbox" id="cb"/>&nbsp;개인정보 제3자 제공동의 <br>
				<input type="checkbox" id="cb"/>&nbsp; 공구 유의사항 확인
	<div class="pinfo">
					<c:set var="deliveryfee" value="0"/>
					<div class="delivery_fee">
						<c:if test="${gongu.gongu_discount_price < 50000}">
							<c:set var="deliveryfee" value="2500"/>
							50000원 이상 구매시 배송비 무료
						</c:if>
					</div>
					<div class="fee">
						<label>결제금액</label>
						<div class="all_fee">
							${gongu.gongu_discount_price + deliveryfee }
						</div>
					</div>				
	<input type="submit" form="hidden_form"value="결제하기" id="paybtn" onclick="javascript:form.action='${pageContext.request.contextPath}/memberPayment.or?gongu_id=${gongu.gongu_id}';">
				</div>
			

	
		</div>
				</div>
							
						
					
				

			</div>


	


	 <form method="post" id="hidden_form">
						<input type="hidden" name="delivery_id"  value="${delivery.delivery_id }">
						<input type="hidden" name="isdefault" id="isdefault" value="${delivery.isdefault }">				
				 		<input type="hidden" name="delivery_name" id="delivery_name" value="${delivery.delivery_name }"readonly>				 	
				 		<input type="hidden" name="zip_code" id="zip_code" value="${ delivery.zip_code}"  readonly>
					 	<input type="hidden" name="addr1"id="addr1" value="${ delivery.addr1}"  readonly>
					 	<input type="hidden" name="addr2" id="addr2" value="${ delivery.addr2 }"  readonly>					 	                   
					 	<input type="hidden" name="receiver_tel" id="receiver_tel" value="${ delivery.receiver_tel }"  readonly>
					 	<input type="hidden" name="receiver_tel2" id="receiver_tel2" value="${ delivery.receiver_tel2 }" readonly>
					 	<input type="hidden" name="receiver_name" id="receiver_name" value="${ delivery.receiver_name }" readonly>
				</form>


</body>

</html>