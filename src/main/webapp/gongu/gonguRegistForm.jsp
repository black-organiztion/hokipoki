<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!--datepicker -->
<script>
        
	$(function() {
		//header 메뉴 active
		$("#header .header_item").removeClass("active");
		$("#header .gongu").addClass("active");
		
		$("input[type=file]").on('change', function(){
			var fileName = $(this).val();
			$(this).prev("input[type=text]").val(fileName);
		});
		
		fn_default_datepicker();
	});
	        
	function fn_default_datepicker()
	{
	    var start = $( "#datepicker_start" ).datepicker({
	        dateFormat: 'yy-mm-dd' //Input Display Format 변경
	        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	        ,changeYear: true //콤보박스에서 년 선택 가능
	        ,changeMonth: true //콤보박스에서 월 선택 가능                
	        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
	        //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	        //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	        ,minDate: "+0M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	        ,maxDate: "+14D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
	    });
	        
	    var end = $( "#datepicker_end" ).datepicker({
	        dateFormat: 'yy-mm-dd' //Input Display Format 변경
	        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	        ,changeYear: true //콤보박스에서 년 선택 가능
	        ,changeMonth: true //콤보박스에서 월 선택 가능                
	        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	        //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	        //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
	        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
	        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
	        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
	        ,minDate: "1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	        ,maxDate: "14D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
	           ,defaultDate: "+1w"
	      });
	    
	    //초기값을 오늘 날짜로 설정
	    $('#datepicker_start').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	    $('#datepicker_end').datepicker('setDate', 'start+3D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	} 
	 
	function getDate( element ) {
	    var date;
	    var dateFormat = "yy-mm-dd";
	    try {
	      date = $.datepicker.parseDate( dateFormat, element.value );
	    } catch( error ) {
	      date = null; 
	    }
	    return date;
	 }
 
</script>
    
<div id="content" class="bg">
	<div class="container">
		<div class="row">
			<!-- conts1:공구등록폼 -->
				<div class="section col-12">
					<div class="card">
						<h5>공구 등록</h5>
						<section id = "registForm">
							<form action="${pageContext.request.contextPath}/gonguRegist.go" method="post" name="writeForm" enctype="multipart/form-data" class="input_form row">		
								<div class="frm_group col-xl-4 col-12">
									<label for="category">카테고리</label>	
									<div class="input_group">
										<select name="category" id="category" class="frm_control">						
											<option value="life">생필품</option>
											<option value="food">간편식</option>
											<option value="kitchen">주방</option>
											<option value="pet">반려견</option>
											<option value="beauty">뷰티</option>
											<option value="book">도서</option>
											<option value="gugang">구강/면도</option>
											<option value="elec">전자기기</option>
											<option value="interior">홈인테리어</option>
											<option value="design">디자인문구</option>
											<option value="organize">수납/정리</option>
											<option value="bath">욕실</option>
											<option value="etc">잡화</option>
											<option value="cloth">의류</option>
											<option value="car">자동차용품</option>
											<option value="hobby">취미</option>
										</select>
									</div>
								</div>
								<div class="frm_group col-xl-8 col-12">
									<label for="gonguname">상품명</label>		
									<div class="input_group">
										<input type="text" name="gonguname" id="gonguname" class="frm_control">
									</div>
								</div>
								<div class="frm_group col-xl-6 col-12">
									<label for="originprice">원가</label>
									<div class="input_group">
										<input type="text" name="originprice" id="originprice" class="frm_control"> 
									</div>
								</div>
								<div class="frm_group col-xl-6 col-12">
									<label for="shareprice">공구가</label>
									<div class="input_group">
										<input type="text" name="gonguprice" id="gonguprice" class="frm_control">
									</div>
								</div>
								<div class="frm_group col-xl-6 col-12">
						            <label>판매시작희망일</label>
						            <div class="input_group">
						            	<input type="text" id="datepicker_start" name="gongustart" class="frm_control frm_date">   
						            </div> 
								</div>
								<div class="frm_group col-xl-6 col-12">
									<label>판매종료희망일</label>
									<div class="input_group">
						            	<input type="text" id="datepicker_end"  name="gongufinish" class="frm_control frm_date">
						            </div>
								</div>
								<div class="frm_group col-xl-6 col-12">
									<label for="datepicker_start">결제마감일</label>
									<div class="input_group">
										<input type="text" id="datepicker_start" name="caldate" class="frm_control">
									</div>
								</div>
								<div class="frm_group col-xl-6 col-12">
									<label for="gongustock">재고수</label>
									<div class="input_group">
										<input type="text" name="gongustock" id="gongustock" class="frm_control">
									</div>
								</div>
								<div class="frm_group col-xl-6 col-12">
									<label for="mingongu">최소목표수량</label>
									<div class="input_group">
										<input type="text" name="minGongu" id="mingongu" class="frm_control">
									</div>
								</div>
								<div class="w-100"></div>
								<div class="frm_group col-xl-6 col-12">
									<label>대표이미지</label>	
									<div class="input_group frm_file">
										<input type="text" class="frm_control" value=""/>
										<input type="file" name="nailimage" id="nailimage" class="">
										<label for="nailimage" class="bt">파일선택</label>
									</div>
								</div>
								<div class="w-100"></div>
								<div class="frm_group col-xl-6 col-12">
									<label>상세이미지</label>	
									<div class="input_group frm_file">
										<input type="text" class="frm_control" value=""/>
										<input type="file" name="image" id="image" class="">
										<label for="image" class="bt">파일선택</label>
									</div>		
									
								</div>
								<div class="bt_group">
									<input type="submit" value="상품신청" class="bt bt_primary">
									<input type="reset" value="다시작성" class="bt">
								</div>
							</form>
						</section>
					</div>
				</div>
			<!-- //conts1:공구등록폼 -->
		</div>
	</div>
	
</div>