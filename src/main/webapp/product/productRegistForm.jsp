<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id = "registForm">
	<header>
		<h2>공구정보 등록</h2>
	</header>
	<form action="${pageContext.request.contextPath}/productRegist.pro" method="post" name="writeForm" enctype="multipart/form-data">		
			
				<label for="category">카테고리		
					<select name="catgory" id="category">
						<option value="life">생필품</option>
						<option value="food">간편식</option>
						<option value="kitchen">주방</option>
						<option value="pet">반려견</option>
					</select>
				</label>	
	
				<label for="productname">상품명			
					<input type="text" name="productname" id="productname">
				</label>
		
				<label for="originprice">원가
					<input type="text" name="originprice" id="originprice">
				</label>	
				<label for="shareprice">공구가
					<input type="text" name="shareprice" id="shareprice">
				</label>
		
				<label for="startdate">판매시작일			
				<input type="text" name="startmonth" id="startmonth" maxlength="2">월
				<input type="text" name="startday" id="startmonth" maxlength="2">일
				</label>
				
				<label for="startdate">판매종료일			
				<input type="text" name="endmonth" id="endmonth" maxlength="2">월
				<input type="text" name="endday" id="endday" maxlength="2">일
				</label>
				
				<label for="productstock">재고
					<input type="text" name="productstock" id="productstock">
				</label>
				
				<label for="minproduct">최소수량
					<input type="text" name="minproduct" id="minproduct">
				</label>
				
				<label for="caldate">결제마감일
					<input type="text" name="caldate" id="caldate">
				</label>				
			
				<label for="nailimage">상품썸네일이미지</label>			
				<input type="file" name="nailimage" id="nailimage">
			
				<label for="image">상품상세페이지이미지</label>			
				<input type="file" name="image" id="image">
			
				<input type="submit" value="상품신청">
				<input type="reset" value="다시작성">
				
		
	</form>
</section>
</body>
</html>