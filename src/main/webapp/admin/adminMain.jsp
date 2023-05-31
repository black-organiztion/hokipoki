<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script>
	$(document).ready(function(){
		//header 메뉴 active
		$(".header_item").removeClass("active");
		$(".header_item.main").addClass("active");
		
	});
</script>
<!-- 오늘날짜 -->
<jsp:useBean id="javaDate" class="java.util.Date" />
<fmt:formatDate var="now" value="${javaDate}" pattern="yyyy-MM-dd"/>
<fmt:parseDate var="nowDate" value="${now}" pattern="yyyy-MM-dd"/>
<fmt:parseNumber value="${nowDate.time / (1000*60*60*24)}" var="nowDateNum" integerOnly="true"></fmt:parseNumber>

<div id="content" class="bg main">
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-12">
				<div class="row">
					<c:choose>
						<c:when test="${loginAuthor eq 0 }">
							<!-- (관리자)conts1:공구승인대기건수 -->
							<div class="section col-xl-12 col-4">
								<div class="card">
									<h5>공구승인대기</h5>
									<span id="standByCnt" class="cnts"></span>
								</div>
							</div>
							<!-- //(관리자)conts1:공구승인대기건수 -->
							
							<!-- (관리자)conts2:회원가입승인대기건수 -->
							<div class="section col-xl-12 col-4">
								<div class="card">
									<h5>회원가입대기</h5>
									<span id="sellerStandByCnt" class="cnts"></span>
								</div>
							</div>
							<!-- //(관리자)conts2:회원가입승인대기건수 -->
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					
					<!-- (공통)conts3:미응답문의건수 -->
					<div class="section col-xl-12 col-4">
						<div class="card">
							<h5>미응답문의건수</h5>
							<span id="noAnswerCnt" class="cnts"></span>
						</div>
					</div>
					<!-- //(공통)conts3:미응답문의건수 -->
				</div>
			</div>
			<div class="col-xl-9 col-12">
				<div class="row">
					<c:choose>
						<c:when test="${loginAuthor eq 0 }">
							<!-- (관리자)conts4:마감임박문의목록 -->
							<div class="section col-12 closing_list">
								<div class="card">
									<h5>마감임박 공구 <small>판매종료일이 3일 이하인 공구 목록이 표시됩니다.(최대 10건)</small></h5>
									<ul class="card_list">
										<li class="card_list_header">
											<span></span>
											<span>공구명</span>
											<span>종료일</span>
										</li>
										<ul id="closingList"></ul>
									</ul>
								</div>
							</div>
							<!-- //(관리자)conts4:마감임박문의목록 -->
						</c:when>
						<c:otherwise>
							<!-- (판매자)conts5:진행중공구목록 -->
							<div class="section col-12 ongoing_list">
								<div class="card">
									<h5>공구현황 <small>나의 진행중인 공구 목록이 표시됩니다.(최대 10건)</small></h5>
									<ul class="card_list">
										<li class="card_list_header">
											<span>공구명</span>
											<span>공구기간</span>
											<span>구매수</span>
										</li>
										<ul id="onGoingList"></ul>
									</ul>
								</div>
							</div>
							<!-- //(판매자)conts5:진행중공구목록 -->
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>



<script>
	var loginAuthor = Number('${loginAuthor}');
	var loginId = '${loginId}';
	
	console.log(loginId, loginAuthor, typeof(loginAuthor));
	
	window.onload = function(){
		
		if(loginId == null){
			console.log("null임");
		}
		
		if(loginAuthor > 0){
			startSellerupdate();
		}else{
			startAdminUpdate();
		}

	};
	
	function startSellerupdate(){
		updateSeller(loginId,loginAuthor);
		
		setInterval(function(){
			updateSeller(loginId, loginAuthor);
		},10000);
	}
	
	function startAdminUpdate(){
		updateAdmin(loginId,loginAuthor);
		
		setInterval(function(){
			updateAdmin(loginId, loginAuthor);
		},10000);
	}

	function updateSeller(id,author){
		$.ajax({
			type:"post",
			url:"adminMainAction.ad",
			dataType:"json",
			data:{
				loginId:id,
				loginAuthor:author
			},
			success:function(obj){
				console.log('통신성공');
				console.log(obj);
				//json문자열을 javascript객체로 변환
				
				var onGoingList = JSON.parse(obj.onGoingList);
				var noAnswerCnt = obj.noAnswerCnt;
				//console.log(onGoingList);
				//console.log(noAnswerCnt);
				
				//진행중공구아이템을 넣을 요소
				var onGoingListEl = document.getElementById("onGoingList");
				var noAnswerCntEl = document.getElementById("noAnswerCnt");
				
				if(onGoingListEl.hasChildNodes()){
					onGoingListEl.replaceChildren();
				}
					
				//onGoingList에서 각 gongu객체에 접근하여 요소 생성 및 추가
				for(var i=0;i<onGoingList.length;i++){
					var gongu = onGoingList[i];
					var gongu_name = gongu.gongu_name;//공구명
					var gongu_startdate = gongu.gongu_startdate;//시작일
					var gongu_findate = gongu.gongu_findate;//종료일
					var gongu_reserve = gongu.gongu_reserve;//구매수
					
					//console.log(gongu_name);
					
					//HTML 요소 생성 및 값 할당
					var li = document.createElement("li");
					li.classList.add("card_list_item");
					
					var nameSpan = document.createElement("span");
					nameSpan.textContent = gongu_name;
					
					var termSpan = document.createElement("span");
					termSpan.textContent = gongu_startdate + "~" + gongu_findate;
					
					var reserveSpan = document.createElement("span");
					reserveSpan.textContent = gongu_reserve;
					
					li.appendChild(nameSpan);
					li.appendChild(termSpan);
					li.appendChild(reserveSpan);
					
					onGoingListEl.appendChild(li);
					
				}
				
				noAnswerCntEl.innerHTML = noAnswerCnt;
				
				//console.log(responseData);
			},
			error:function(xhr,status,error){
				console.log("통신실패, xhr:"+xhr+", status:"+status+", error:"+error);
			}
		});
	}
	
	function updateAdmin(id,author){
		$.ajax({
			type:"post",
			url:"adminMainAction.ad",
			dataType:"json",
			data:{
				loginId:id,
				loginAuthor:author
			},
			success:function(obj){
				console.log('통신성공');
				console.log(obj);
				//json문자열을 javascript객체로 변환
				
				var closingList = JSON.parse(obj.closingList);
				var standByCnt = obj.standByCnt;
				var sellerStandByCnt = obj.sellerStandByCnt;
				var noAnswerCnt = obj.noAnswerCnt;
				//console.log(onGoingList);
				//console.log(noAnswerCnt);
				
				//진행중공구아이템을 넣을 요소
				var closingListEl = document.getElementById("closingList");
				var standByCntEl = document.getElementById("standByCnt");
				var sellerStandByCntEl = document.getElementById("sellerStandByCnt");
				var noAnswerCntEl = document.getElementById("noAnswerCnt");
				
				//D-day 표시를 위해 오늘 날짜 가져오기
				var today = new Date();
				//yyyy-MM-dd형식의 날짜 문자열 생성
				var curDateStr = (today.getFullYear())+"-"+(("0" + (1 + today.getMonth())).slice(-2))+"-"+(("0"+today.getDate()).slice(-2));
				//생성한 문자열로 시간 가져오기
				const curDate = new Date(curDateStr).getTime();
				
				//이미 만들어진 공구 li들이 있으면 삭제
				if(closingListEl.hasChildNodes()){
					closingListEl.replaceChildren();
				}
					
				//closingList에서 각 gongu객체에 접근하여 요소 생성 및 추가
				for(var i=0;i<closingList.length;i++){
					var gongu = closingList[i];
					var gongu_name = gongu.gongu_name;//공구명
					var gongu_findate = gongu.gongu_findate;//종료일
					
					//console.log(gongu_name);
					
					//HTML 요소 생성 및 값 할당
					var li = document.createElement("li");
					li.classList.add("card_list_item");
					
					var nameSpan = document.createElement("span");
					nameSpan.textContent = gongu_name;
					
					var findateSpan = document.createElement("span");
					findateSpan.textContent = gongu_findate;
					
					var badgeSpan = document.createElement("span");
					var dateSpan = document.createElement("span");
					dateSpan.classList.add("badge");
					dateSpan.classList.add("bg-primary");
					
					//d-day 계산을 위해 종료일문자열을 매개값으로 시간 가져옴
					const finDate = new Date(gongu_findate).getTime();
					
					//현재일시간 - 종료일시간 계산
					let diffDate = Math.abs(curDate-finDate);
					//계산결과를 일단위로 변환
					diffDate = Math.ceil(diffDate/(1000*60*60*24));
					//계산값을 텍스트로 할당
					dateSpan.textContent = "D-"+diffDate;
					badgeSpan.appendChild(dateSpan);
					
					//console.log("findate:"+finDate,typeof(finDate));
					//console.log("diffDate:"+diffDate,typeof(diffDate));
					
					li.appendChild(badgeSpan);
					li.appendChild(nameSpan);
					li.appendChild(findateSpan);
					
					closingListEl.appendChild(li);
					
				}
				
				standByCntEl.innerHTML = standByCnt;
				sellerStandByCntEl.innerHTML = sellerStandByCnt;
				noAnswerCntEl.innerHTML = noAnswerCnt;
				
				//console.log(responseData);
			},
			error:function(xhr,status,error){
				console.log("통신실패, xhr:"+xhr+", status:"+status+", error:"+error);
			}
		});
	}

</script>
