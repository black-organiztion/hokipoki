 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <!--datepicker -->
  <script>
        
 $(function() {
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
<title>Insert title here</title>
</head>
<body>
<section id = "registForm">
	<header>
		<h2>공구정보 등록</h2>
	</header>
	<form action="${pageContext.request.contextPath}/gonguRegist.go" method="post" name="writeForm" enctype="multipart/form-data">		
			
				<label for="category">카테고리		
					<select name="category" id="category">						
						<option value="life">생필품</option>
						<option value="food">간편식</option>
						<option value="kitchen">주방</option>
						<option value="pet">반려견</option>
					</select>
				</label>
				
				 <div class="ui-grid-b">
        <div class="ui-block-a">
            <label>판매시작희망일</label>
        </div>
        <div class="ui-block-b">
            <label>판매종료희망일</label>
        </div>
        <div class="ui-block-c">
        </div>
    </div>
    <div class="ui-grid-b">
        <div class="ui-block-a">
            <input type="text" id="datepicker_start" readonly="readonly" name="gongustart">
        </div>
        <div class="ui-block-b">
            <input type="text" id="datepicker_end" readonly="readonly" name="gongufinish">
        </div>        
    	</div>	
				<label for="gonguname">상품명			
					<input type="text" name="gonguname" id="gonguname">
				</label>
		
				<label for="originprice">원가
					<input type="text" name="originprice" id="originprice"> 
				</label>	
				<label for="shareprice">공구가
					<input type="text" name="gonguprice" id="gonguprice">
				</label>
		
				
				
				<label for="gongustock">재고
					<input type="text" name="gongustock" id="gongustock">
				</label>
				
				<label for="mingongu">최소수량
					<input type="text" name="minGongu" id="mingongu">
				</label>
				
				
				<label for="datepicker_start">
					<p>계산마감일<input type="text" id="datepicker_start" name="caldate"></p>
				</label>				
			
				<label for="image">상품상세페이지이미지</label>			
				<input type="file" name="image" id="image">
				
				<label for="nailimage">상품썸네일이미지		
				<input type="file" name="nailimage" id="nailimage">
				</label>	
				
			
				<input type="submit" value="상품신청">
				<input type="reset" value="다시작성">
				
		
	</form>
</section>
</body>
</html>