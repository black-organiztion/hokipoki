

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
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

  <title>Swiper demo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

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
    
    .container {
    	width:1200px;
    	margin:60px auto 0 auto;
    	border: 3px solid red;
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
  <!-- Swiper -->
  <div class="swiper mySwiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/imvita.jpg"></div>
      <div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/baby.jpg"></div>
      <div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/laundry.jpg"></div>
      <div class="swiper-slide"><img src="${pageContext.request.contextPath}/img/skin.jpg"></div>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
  </div>
  
  <div class="container">
  	<div class="banner">
  		<img src="${pageContext.request.contextPath}/img/banner.png">
  	</div>
  	<div class="gongu_group">
  		<!-- <label>인기상품</label> -->
  			<div class="gongu_box">
  				<div class="info" >
  				<div class="gongu_thumb" style="width:252px; height:252px; background-color: red">
  					<!-- <img src=""> -->
  				</div> 
  				
  					<div style="font-size: 6px; margin-top: 12.1px; margin-left: 2px;">반려동물용품</div>
  					<div  style="display:flex; margin-top:3.9px; font-size: 18px; font-weight:bold;">바잇미 크런치팝 요거트코코 강아지 시리얼</div>
  					<div style="font-size: 6px; margin-top:2.2px; margin-right:2px;">1000원</div>
  					<div style="margin-top: 3px; margin-right:2px;">
  						<div>50%</div>
  						<div>5,000원</div>
  					</div>
  				</div> 			
  			</div>
  			
  			
  				<div class="gongu_box">
  				<div class="info" >
  				<div class="gongu_thumb" style="width:252px; height:252px; background-color: red">
  					<!-- <img src=""> -->
  				</div> 
  				
  					<div style="font-size: 6px; margin-top: 12.1px; margin-left: 2px;">반려동물용품</div>
  					<div  style="display:flex; margin-top:3.9px; font-size: 18px; font-weight:bold;">바잇미 크런치팝 요거트코코 강아지 시리얼</div>
  					<div style="font-size: 6px; margin-top:2.2px; margin-right:2px;">1000원</div>
  					<div style="margin-top: 3px; margin-right:2px;">
  						<div>50%</div>
  						<div>5,000원</div>
  					</div>
  				</div> 			
  			</div>
  			
  				<div class="gongu_box">
  				<div class="info" >
  				<div class="gongu_thumb" style="width:252px; height:252px; background-color: red">
  					<!-- <img src=""> -->
  				</div> 
  				
  					<div style="font-size: 6px; margin-top: 12.1px; margin-left: 2px;">반려동물용품</div>
  					<div  style="display:flex; margin-top:3.9px; font-size: 18px; font-weight:bold;">바잇미 크런치팝 요거트코코 강아지 시리얼</div>
  					<div style="font-size: 6px; margin-top:2.2px; margin-right:2px;">1000원</div>
  					<div style="margin-top: 3px; margin-right:2px;">
  						<div>50%</div>
  						<div>5,000원</div>
  					</div>
  				</div> 			
  			</div>
  			
  				<div class="gongu_box">
  				<div class="info" >
  				<div class="gongu_thumb" style="width:252px; height:252px; background-color: red">
  					<!-- <img src=""> -->
  				</div> 
  				
  					<div style="font-size: 6px; margin-top: 12.1px; margin-left: 2px;">반려동물용품</div>
  					<div  style="display:flex; margin-top:3.9px; font-size: 18px; font-weight:bold;">바잇미 크런치팝 요거트코코 강아지 시리얼</div>
  					<div style="font-size: 6px; margin-top:2.2px; margin-right:2px;">1000원</div>
  					<div style="margin-top: 3px; margin-right:2px;">
  						<div>50%</div>
  						<div>5,000원</div>
  					</div>
  				</div> 			
  			</div>
  			
  		</div>
  		<div>
  		
  		
  		</div>
  	</div>  	



</body>

</html>
