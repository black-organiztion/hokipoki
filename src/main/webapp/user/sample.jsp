<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/common/common.jsp"></jsp:include>
</head>
<body>
<div id="wrap">
	<jsp:include page="/user/common/header.jsp"></jsp:include>
	<!-- 메인일때만 주석 해제-->
	<!-- <div id="area_visual"></div> -->
	<!-- 메인일때만 -->
	
	<!-- 본문 -->
	<section id="content" class="container">
		<!-- row: 콘텐츠 영역 단위 -->
		<div class="row">
			<div class="col-xl-6 col-12">
				<div style="background-color:rgb(198,198,198)">배너1</div>
			</div>
			<div class="col-xl-6 col-12">
				<div style="background-color:rgb(148,148,148)">배너2</div>
			</div>
		</div>
		<!-- //콘텐츠 영역 단위 -->
		<!-- 콘텐츠 영역 단위 -->
		<h5 class="title">한글이예요(본문)</h5>
		<div class="row">
			<div class="col-xl-4 col-md-6 col-12">
				<div style="background-color:rgb(198,198,198)">콘텐츠1</div>
			</div>
			<div class="col-xl-4 col-md-6 col-12">
				<div style="background-color:rgb(198,198,198)">콘텐츠2</div>
			</div>
			<div class="col-xl-4 col-md-6 col-12">
				<div style="background-color:rgb(198,198,198)">콘텐츠3</div>
			</div>
		</div>
		<!-- //콘텐츠 영역 단위 -->
		<!-- row: 콘텐츠 영역 단위 -->
		<div class="row">
			<div class="col-12">
				<div style="background-color:rgb(198,198,198)">배너3</div>
			</div>
		</div>
		<!-- //콘텐츠 영역 단위 -->
	</section>
	<!-- //본문 -->
	
	<jsp:include page="/user/common/footer.jsp"></jsp:include>
</div>


</body>
</html>