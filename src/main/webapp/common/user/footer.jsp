<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hokipoki</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"/>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
   
      
      @media (min-width: 1200px)
		.container, .container-lg, .container-md, .container-sm, .container-xl {
		    max-width: 1200px;
		}
	  .headertop{
	  	display:flex;
	  	align-items:center;
		width:100%; 
		height:75px;
		margin-bottom: 0px;			
	  }
	footer .inr{display:flex; max-width:1200px; width:100%; margin:0 auto; padding:20px 0;}	
	 .ft_logo{font-size:0;}	
	 .ft_logo>img{width:180px;}	
	 footer ul{padding:0}
	 footer ul>li{font-size:14px; display:flex;}
	 footer ul>li>em{color:#999; font-style:normal; padding-right:10px;}
	 footer .inr>div:nth-child(1){flex:0 0 auto; padding-right:50px;}
	 footer .inr>div:nth-child(2){flex:1 1 auto; padding-right:50px;}
	 footer .inr>div:nth-child(3){flex:0 0 auto; width:25%;}
	  
    </style>
</head>
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
  	<div class="inr">
  		<div>
  			<a class="ft_logo" href="gonguListHome.go">
  				<img src="./img/ft_logo.svg"/>
  				호키포키
  			</a>
  		</div>
  		<div>
  			<ul>
	  			<li>대구시 달서구</li>
	  			<li>사업자등록번호 : 000-11-22222</li>
	  			<li>전화번호 : 1234-5678 | E-mail:customer@hokipoki.com</li>
	  		</ul>
	  		<ul>
	  			<li>호스팅서비스 : (주)호키포키</li>
	  			<li>사이트 내 판매 상품은 (주)호키포키에 입점한 개별판매자가 판매하는 상품입니다. (주)호키포키는 통신판매중개자로서 판매 당사자가 아니며, 상품정보 및 거래 등에 대한 책임을 지지 않습니다.</li>
	  			<li>COPYRIGHT © HOKIPOKI ALL RIGHTS RESERVED.</li>
	  		</ul>
  		</div>
  		<div>
  			<ul>
  				<li>고객센터</li>
  				<li><em>운영시간</em><span>오전 10시 ~ 오후 5시(주말, 공휴일 휴무)</span></li>
  				<li><em>점심시간</em><span>오후 12시 30분 ~ 오후 1시 30분</span></li>
  			</ul>
  		</div>
  	</div>
    
  </footer>

</body>
</html>