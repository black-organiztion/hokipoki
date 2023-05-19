<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hokipoki</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet"> 

    <style>
    
    	*{
    	 font-family: 'Noto Sans KR', sans-serif;  	
    	} 
	
		a{
	 		text-decoration:none !important;	 		
	 	}    	
	 	.depth1 > a{
			color:#494949;
		}
		
		.depth2 >ul > li> a{
			color:#494949;
		}
		
		.depth2 >ul > li> a :hover {
			color:orange;
		}

    
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
		 text-decoration:none;  
		display:none;
		position: absolute;
		font-size:14px;
		background: white;
		border-bottom: 1px solid #c9c9c9;
		z-index: 9999;
		box-shadow: 0px 3px 10px gray;
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
	.header_outer{
		width:1200px;
		height:120px;
		margin: 0px auto;
		
		
	}
	

	.logo{
		width:160px;
		height:54px;
	}
	 
	    	.member_interaction_outer{
        	  		display: flex;
        	}
        
        	.member_interaction{
        		display:flex;
        		/* border:1px dashed black; */
        		height:30px;
        		align-items: center;
        		margin-left: 30px;
        		     
        	}

        	
        	#member_icon{
        		widht:20px;
        		height:20px;
        		margin-right: 10px;
        		margin-bottom: 2px;
        	}
        	#tt{
        		/* border:1px solid red;         */		
        		font-size: 14px;
        		color:#494949;
        	} 
        	
        	.search_area{
			
			height:24px;
			display: flex;
		}
	
		.navi_scope{
			display: flex;
			justify-content: center;
			margin-right: 26px;
		}
		.navi_scope > img{
			margin-right: 10px;
		}
		.navi{
			display:flex;
			}
		#cate{
			font-size: 16px;
		}	
		.header_top{
			margin-top:14px;		
			display:flex; 
			justify-content:space-between;
			align-items: center;
		}

		ul li{
			list-style:none;
		}
		
		.header_bottom{
    		margin-top:16px;
    		display:flex;
    		justify-content: space-between;    	
    	
    		align-items: center;     		
    	}
    	
    	
    	#menu{
    		
    		
    		width:600px;
    		align-items: center ;  
    		display: flex;
    		padding:0;
    		margin: 0;    		
    	}
    	
	  
    </style>
</head>
<body>

  <header class="header_outer" >  
    <div class="header_top" id="ad" >
		        <div class="logo" id="logo">
		        	<a href="${pageContext.request.contextPath}/gonguListHome.go" >
		        		<img src="${pageContext.request.contextPath}/img/logo_small.png">
		        	</a>	
		        </div>
    	<c:choose>
    		<c:when test="${member_id eq null}">
		        <div class="member_interaction_outer" >
		        	<div class="member_interaction">
		        		<a href="${pageContext.request.contextPath}/memberLogin.me">
		        		<img src="${pageContext.request.contextPath}/img/icon/login.svg" id="member_icon">
		        			<span id="tt">로그인 / 회원가입</span>
		        		</a>
		        	</div>
		        </div>    		
    		</c:when>
    		<c:otherwise>
	    		<div class="member_interaction_outer" >
			        	<div class="member_interaction">
			        		<a href="#">
			        		<img src="${pageContext.request.contextPath}/img/icon/heart.svg" id="member_icon">
			        			<span id="tt">찜 목록</span>
			        		</a>
			        	</div>
			        	<div class="member_interaction">
			        		<a href="${pageContext.request.contextPath}/myInfo.me">
			        		<img src="${pageContext.request.contextPath}/img/icon/person.svg" id="member_icon" >
			        			<span id="tt">마이페이지</span>
			        		</a>
			        	</div>
			        	<div class="member_interaction">
			        		<a href="${pageContext.request.contextPath}/memberLogout.me">
			        		<img src="${pageContext.request.contextPath}/img/icon/logout.svg" id="member_icon">
			        			<span id="tt">로그아웃</span>
			        		</a>
			        	</div>
			        </div>  
    		</c:otherwise>
    	</c:choose>      
        
    </div><!--헤더 탑-->

	<div class="header_bottom">
		 <div  id="nav">
      <ul id="menu" >
        <li class="depth1">       
        <a href="#" style="margin-right: 8px;" >
         <img src="${pageContext.request.contextPath}/img/icon/category.svg" style="padding-bottom: 4px;">
        	카테고리</a>
        	<div class="depth2">        		
	        		<ul>
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=book">도서</a></li>
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=life">생필품</a></li>
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=design">디자인문구</a></li>   	
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=kitchen">주방용품</a></li>
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=perfume">향수</a></li>
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=beauty">뷰티</a></li> 
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=interior">홈인테리어</a></li>
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=organize">수납/정리</a></li>
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=etc">잡화</a></li> 
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=car">자동차 용품</a></li>
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=mouth">구강/면도</a></li>
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=elec">전자기기</a></li> 
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=bath">욕실용품</a></li>
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=cloth">의류</a></li>
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=hobby">취미</a></li>  
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=food">푸드</a></li>
		        		<li><a href="${pageContext.request.contextPath}/categoryList.go?category=pet">반려동물 용품</a></li>  		
		        	</ul>
	        
        	</div>
       	</li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/gonguListHome.go" class="nav-link link-dark px-2 active" aria-current="page">홈</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/menuList.go?menu=popular" class="nav-link link-dark px-2">인기</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/menuList.go?menu=new" class="nav-link link-dark px-2">신규</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/menuList.go?menu=end" class="nav-link link-dark px-2">마감임박</a></li>
        <li class="nav-item"><a href="#" class="nav-link link-dark px-2">문의게시판</a></li>
      </ul>

    </div>
    

	
<div class="search_area" style="display: flex;  width: 250px;">
	<form action="${pageContext.request.contextPath}/searchGongu.go" method="post" name="searching" id="searching" style="display: flex;">
		<div style="border: 1px solid #c9c9c9; width: 200px; border-radius: 15px; padding-left: 10px;">
			<input type="text" name="search" placeholder="search" style="border: 0px solid red; width: 180px; height:15px; margin-bottom: 5px;">
		</div>
		<button type="submit" style="border: 0; background: none; cursor: pointer; margin-left: 12px; display: flex;">
			<img src="${pageContext.request.contextPath}/img/icon/search.svg">
		</button>
	</form>
</div><!-- search_area -->
	
	
     
  </header>
  
   
  


</body>
</html>