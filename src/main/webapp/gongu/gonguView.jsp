<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Gongu" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="listForm">
<h2>${gongu.kind }의 상세정보</h2>
<section id="content_main">
<section id = "content_left">
<img src="images/${gongu.image }">
</section>
<section id = "content_right">
카테고리 ${gongu.category }
공구가격 ${gongu.discount_price }
원가 ${gongu.gongu_price }
공구 시작일 ${gongu.gongu_startdate }
공구 종료일 ${gongu.gongu_findate }
공구 결제일 ${gongu.gongu_caldate }
공구 썸네일 <img src="./gongu/images/${gongu.thumbnail_img }">
공구 상세페이지<img src="./gongu/images/${gongu.detail_img }">
현재 공구탑승한 인원 ${gongu.gongu_reserve }
공구 달성률 ${(gongu.gongu_reserve/gongu.gongu_min)*100}


</section>
<div style="clear:both"></div>
<nav id="commandList">
<a href = "gonguList.go">쇼핑계속하기</a>
<a href="gongupurchase.go?id=${gongu.id }">결제하기</a>
</nav>
</section>
</section>

</body>
</html>