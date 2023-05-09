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
	
	#menu{
	width:700px;
	height:50px;
		
		color:black;
		line-height: 50px; 
		text-align: center;
	
	}
	#menu > ul > li {
		float:left;
		width:140px;
		position:relative;
	}
	
	#menu .depth2 {
		display:none;
		position: absolute;
		font-size:14px;
		background: skyblue;
	}
	#menu .depth2>ul{
		display:flex;
		flex-wrap:wrap;
		width:1200px;
		padding:0;
	}
	
	#menu .depth2>ul>li{
		flex:0 0 auto; 
		width:20%;
	}
		
	 #menu .depth1:hover > .depth2 {
		display:block;
	}
	

	  
    </style>
</head>
<body>

  <header class=" headertop border-bottom" >  
    <div class="container d-flex flex-wrap justify-content-center" id="ad">
      <a href="/" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto  text-dark text-decoration-none">
       
        <span class="fs-4" id="logo">호키포키</span>
      </a> 
      <form class="col-12 col-lg-auto mb-3 mb-lg-0" role="search">
        <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
      </form>
    </div>
  </header>
  <nav class="py-2 bg-light border-bottom">
    <div class="container d-flex flex-wrap" id="nav">
      <ul id="menu" class="nav me-auto">
        <li class="nav-item depth1">
        <a href="#" class="nav-link link-dark px-2">카테고리</a>
        	<div class="depth2">
        		<ul>
	        		<li><a href="#">도서</a></li>
	        		<li><a href="#">생필품</a></li>
	        		<li><a href="#">디자인문구</a></li>   	
	        		<li><a href="#">주방용품</a></li>
	        		<li><a href="#">향수</a></li>
	        		<li><a href="#">뷰티</a></li> 
	        		<li><a href="#">홈인테리어</a></li>
	        		<li><a href="#">수납/정리</a></li>
	        		<li><a href="#">잡화</a></li> 
	        		<li><a href="#">자돋차용품</a></li>
	        		<li><a href="#">구강/면도</a></li>
	        		<li><a href="#">전자기기</a></li> 
	        		<li><a href="#">욕실용품</a></li>
	        		<li><a href="#">의류</a></li>
	        		<li><a href="#">취미</a></li>  
	        		<li><a href="#">푸드</a></li>
	        		<li><a href="#">반려동물 용품</a></li>  		
	        	</ul>
        	</div>
       	</li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2 active" aria-current="page">Home</a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2">인기</a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2">신규</a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2">마감임박</a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2">문의게시판</a></li>
      </ul>
      <ul class="nav">
      
      	<c:if test="${member_id ne null}">
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2">찜 목록</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/myInfo.me" class="nav-link link-dark px-2">마이페이지</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/memberLogout.me" class="nav-link link-dark px-2">로그아웃</a></li>
        </c:if>
        <c:if test="${member_id eq null }">
        <li class="nav-item"><a href="${pageContext.request.contextPath}/memberLogin.me" class="nav-link link-dark px-2">로그인</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/memberJoin.me" class="nav-link link-dark px-2">회원가입</a></li>
        </c:if>
      </ul>
    </div>
  </nav>


</body>
</html>