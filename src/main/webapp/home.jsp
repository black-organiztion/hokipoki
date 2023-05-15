
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
  <!-- Link Swiper's CSS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
  

  <title>Home</title>

  <!-- Demo styles -->
  <style>
    html,
    body {
      position: relative;
      height: 100%;
    }

    body {

      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper {
      width: 100%;
      height: 450px;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    
    .incontainer {
    	width:1200px;
    	margin:60px auto 0 auto;
    	
    }
    
    .banner{
    	margin-bottom: 40px;
    }

	.gongu_group{
		width:1200px;
		display: flex;
		flex-wrap: wrap;
	}
    
    .gongu_group > label{
    	font-size: 20px;
    	
    }
    
    .gongu_box{
    	padding:20px;
    }
    
    .info{
    width:252px;
    height:396px;
    border:2px dashed blue;
    }
    
  </style>
    <!-- Swiper JS -->

  <!-- Initialize Swiper -->
</head>

<body>
<jsp:include page="/common/user/header.jsp"></jsp:include>
<!-- main -->
  <!-- Swiper -->
  <div class="swiper mySwiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/banner/imvita.jpg"></div>
      <div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/banner/baby.jpg"></div>
      <div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/banner/laundry.jpg"></div>
      <div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/banner/skin.jpg"></div>
    </div>
    
    <div class="swiper-pagination"></div>
  </div>
 <!--// main --> 
 
 <!-- banner  --> 
  <div class="incontainer">
  	<div class="banner">
  		<img src="${pageContext.request.contextPath}/img/ad1.png">
  	</div>
  </div>


<style>

	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.allgongu{
		margin:0 auto;
		width:1200px;
		display:flex;
		justify-content: space-between;		
	}

	.gongubox{
		width:254px;
		height:396px;
		/* border:1px solid #f5f5f5; */
	}

	.thimg{
		width:252px;
		height:252px;	
	}
	
	.gonguinfo{
		padding:2px;
	}
	
	.cate{
		
		color:#686868;
		font-size:12px;
		margin-bottom:3.9px;
	}
	.tit{
	 	color:#515151;
		font-size:18px;
		font-weight:500;
		height:50px;
		margin-bottom: 11px;
	}
	.sub{
		display:flex;
		justify-content: space-between;
		height:33px;

		margin-top: 14px;	
		align-items: flex-end;
	}
	
	.count{
		font-size:10px;
		color:#c9c9c9;
	}
	.num{
		padding-top: 10px;
		height:30px;
		display:flex;
		align-items: center; 
		
	}
	
	.per{
		
		width:60px;
		height:24px; 
		border-radius:12px;
		background-color:orange;
	
		display:flex;
		color:#ffff;		
		font-size:13px;
		font-weight: bold;
		align-items: center;
		justify-content: center;
		font-weight: 500;
		
	}

	
	.price{		
		padding-bottom:3px;
		margin-left:5px;
		font-size:26px;
		
		 color:#515151;
		 text-align: bottom;
		 font-weight: 500;
		
	}
	#gonguImage{
		max-width: 252px;
		max-height: 252px;
	}
	.origin{
		font-size: 14px;
		height: 7.3px;
		text-align: right;
		color:#c9c9c9;
		text-decoration: line-through; 
		
	}
	.label{
		font-size: 26px;
		margin-bottom:24px;
		
	}
	.gongucontainer{
		width:1200px;
		margin:0 auto;
	
		
		margin-bottom: 100px;
		
	}
	
	
	
</style>

<c:if test="${popularList!=null }">
<div class="gongucontainer">
<p class="label">인기상품</p>
<div class="allgongu">
<c:forEach var = "gongu" items="${popularList }" varStatus="status">
		<div class="gongubox">
			<div class="thimg">			
				<a href="${pageContext.request.contextPath}/gonguView.go?id=${gongu.gongu_id}">
				<img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }" id="gonguImage">
				</a>	
			</div>
			<div class="gonguinfo">
				<div class="cate">
					${gongu.category}
				</div>
				<div class="tit">
					${gongu.gongu_name}
				</div>
				<div class="origin">
					정상가 ${gongu.gongu_price}
				</div>
				<div class="sub">
					<div class="count">
					${gongu.gongu_reserve}/${gongu.gongu_min }
					</div>
					<div class="num">
						<div class="per">
							공구특가						
						</div>
						<div class="price">
							<fmt:formatNumber value="${gongu.gongu_discount_price}" type="number"/>
						</div>
					</div>
				</div>
			</div>	
		</div>
</c:forEach>
	</div>
</div>

</c:if> 


<c:if test="${newList!=null }">
<div class="gongucontainer">
<p class="label">신규상품</p>
<div class="allgongu">
<c:forEach var = "gongu" items="${newList }" varStatus="status">
		<div class="gongubox">
			<div class="thimg">			
				<a href="${pageContext.request.contextPath}/gonguView.go?id=${gongu.gongu_id}">
				<img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }" id="gonguImage">
				</a>	
			</div>
			<div class="gonguinfo">
				<div class="cate">
					${gongu.category}
				</div>
				<div class="tit">
					${gongu.gongu_name}
				</div>
				<div class="origin">
					정상가 ${gongu.gongu_price}
				</div>
				<div class="sub">
					<div class="count">
					${gongu.gongu_reserve}/${gongu.gongu_min }
					</div>
					<div class="num">
						<div class="per">
							공구특가
						</div>
						<div class="price">
							<fmt:formatNumber value="${gongu.gongu_discount_price}" type="number"/>
						</div>
					</div>
				</div>
			</div>	
		</div>
</c:forEach>
	</div>
</div>

</c:if>



<c:if test="${oldList!=null }">
<div class="gongucontainer">
<p class="label">마감임박</p>
<div class="allgongu">
<c:forEach var = "gongu" items="${oldList }" varStatus="status">
		<div class="gongubox">
			<div class="thimg">			
				<a href="${pageContext.request.contextPath}/gonguView.go?id=${gongu.gongu_id}">
				<img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }" id="gonguImage">
				</a>	
			</div>
			<div class="gonguinfo">
				<div class="cate">
					${gongu.category}
				</div>
				<div class="tit">
					${gongu.gongu_name}
				</div>
				<div class="origin">
					정상가 ${gongu.gongu_price}
				</div>
				<div class="sub">
					<div class="count">
					${gongu.gongu_reserve}/${gongu.gongu_min }
					</div>
					<div class="num">
						<div class="per">
							공구특가
						</div>
						<div class="price">
							<fmt:formatNumber value="${gongu.gongu_discount_price}" type="number"/>
						</div>
					</div>
				</div>
			</div>	
		</div>
</c:forEach>
	</div>
</div>

</c:if>


<jsp:include page="/common/user/footer.jsp"></jsp:include>

<script>
    var swiper = new Swiper(".mySwiper", {
      spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false,
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  </script>

</body>

</html>
