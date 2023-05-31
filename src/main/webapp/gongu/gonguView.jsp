<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="today" class="java.util.Date" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">  
<style>
   *{
      font-family: 'Noto Sans KR', sans-serif;   
      color: #515151;
   }
   .out_container{
      
      width:1200px;
      margin: 0 auto;
   
   }
   .title_container{
      margin-top:30px;
      margin-bottom:50px;
      hewight:43px;
      padding-top: 42px;
      padding-bottom :42px;
      text-align: center;   
   }
   .sanseimg{   
      display:flex;
      
      margin-top:180px;       
      width:1200px;       
      justify-content: center;
      
       
   }
   
   .cate{
      font-size: 18px;
      color:#949494;   
   }
   .title{
      font-size: 32px;
      color: #515151;
      font-weight: 500;
   }
   .content_container{   
      display:flex;
   }
   .gongu_main_info{      
      margin-bottom: 48px;
   }

   
   .gongu_container{      
      width:500px;
      margin-left: 206px;
   }
   .sanse:first-child{
      margin-top: 0px;   
   }
   
   .sanse{      
      width:121.5px;
      height: 86px;
      margin-top: 37px;   
      color:#c9c9c9;      
   }

   
   .one{
      color:#686868;
      font-size: 16px;   
      margin-bottom: 7.1px; 
      
   }
   .containernum{
      display: flex;      
      align-items: baseline;
   }
   .num{
      font-weight: 400 ;
      font-size: 36px;
      color: #494949;
      margin-right: 6px;
   }
   .boxcontainer{
      display:flex;
      width:120px;   
      justify-content: space-between;
      
      
   }
   .box{
      width:50px;
      height:50px;
      border:1px solid #c9c9c9;
      border-radius: 6px;
   }
   .sub_button{
      background-color: orange;
      width:280px;
      height:50px;
      border-radius: 12px;
      text-align: center;
      padding-top: 11px;
      color:white;
      font-weight:500; 
      font-size:18px;
   }
   .submit_container{
      margin-top:30px;
      
      display:flex;
      justify-content: space-between;
   }
   .sub2{
      
      display:flex;
      margin-bottom: 8px;
   }
   #mya {
     text-decoration: none !important;
     color:white;
   }
   .icon{
   
   	width:48px;
   	height:30px;
   	display:flex;
   	align-items: center;
   	justify-content: center;
   }
   .tit{
   	font-size: 12px;
   	text-align: center;
   }
   
   .th_img.transparent {
      opacity: 0.5;
   }
   .blocking{
         		width:550px;
         		height:550px;
         		background-color: rgba(0,0,0,0.5);
         		text-align: center;
    }
    
    .th_img.close{position:relative;}
    .th_img.close:before{
	    content:"구매할 수 없는 상품입니다.";
	    padding-top:265px; 
		text-align:center;		
	    color:white;
	    font-size:24px;
	    position:absolute; 
	    top:0; 
	    left:0; 
	    width:100%; 
	    height:100%; 
	    background:rgba(0,0,0,0.4);
	    
    }
    .sub_button.close{background-color:#ddd; pointer-events:none;}
    
    .disabled_txt{position:relative; display:flex; align-items:center; justify-content:center; min-height:200px; margin-top:180px; padding:20px; border:3px solid #ddd;}
    .disabled_txt>span{margin:0 10px; padding:0 5px; box-shadow:inset 0 -12px 0 #D9E3F9; font-weight:600;}
    .disabled_txt:before{content:'알려드립니다'; position:absolute; top:20px; left:20px;}

</style>

</head>
<body>
   <div class="out_container">
      <div class="title_container">
         <div class="cate">
            ${gongu.category }
         </div>
         <div class="title">   
            ${gongu.gongu_name }      
         </div>   
      </div>
      <div class="content_container" >
         <div class="th_img ${gongu.gongu_status eq '5'? 'close':'' }" >
            <img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }" style="width:550px; height:550px;">
         </div>
         <div class="gongu_container" >
            <div class="gongu_main_info"  >
               <div class="sanse">
                     <div class="one">
                        모인인원
                     </div>                     
                     <div class="containernum">
                        <div class="num">
                            ${gongu.gongu_reserve }                         
                        </div>
                        <div style="margin-right: 7px;">
                           명
                        </div>
                        <div style="margin-right: 14px;">
                        <fmt:formatNumber value="${ gongu.gongu_reserve/gongu.gongu_min }" type="percent"/>
                        </div>
                     </div>   
                  </div>   
                  <div class="sanse">
                     <div class="one">
                        남은시간
                     </div>
                     <c:set var ="finD">
                     	${gongu.gongu_findate}
                     </c:set>
                     <div class="containernum">
                        <div class="num">
                        	${subday }
                        </div>
                        <div style="margin-right: 7px;">
                           일
                        </div>
                     </div>   
                  </div>   
                  <div class="sanse">
                     <div class="one">
                        공구가
                     </div>
                     
                     <div class="containernum">
                        <div class="num">
                            <fmt:formatNumber value="${gongu.gongu_discount_price}" type="number"/>                                                    
                        </div>
                        <div style="margin-right: 7px;">
                           원
                        </div>                        
                     </div>   
                  </div>   
               </div>

            <div class="gongu_sub_info" >
               <div class="subwrap">
                  <div class="sub2">         
                     <div class="sub_info_title">
                        목표수량 &nbsp;&nbsp;&nbsp;&nbsp;
                     </div>
                     <div class="sub_info_content">
                        ${gongu.gongu_min }
                     </div>
                  </div>
                  <div class="sub2">   
                     <div class="sub_info_title">
                        공구기간 &nbsp;&nbsp;&nbsp;&nbsp;
                     </div>
                     <div class="sub_info_content">
                        ${gongu.gongu_startdate } ~  ${gongu.gongu_findate }
                     </div>
                  </div>
                  <div class="sub2">      
                     <div class="sub_info_title">
                        예상결제일 &nbsp;
                     </div>
                     
                     <div class="sub_info_content">
                         ${gongu.gongu_caldate }
                     </div>
                  </div>
               </div>      
                  <div class="submit_container">
                     <div class="boxcontainer">
                     <script>
                     console.log('${heartChk}');
                     </script>
                        <div class="box heart" onclick="if(!${heartChk}){hearting();}" >
                           <div class="icon">
                           		<c:choose>
                           			<c:when test = "${heartChk eq true }">
                           				<img src="${pageContext.request.contextPath}/img/icon/hearting.svg" width="24">
                           			</c:when>
                           			<c:otherwise>
                           				<img src="${pageContext.request.contextPath}/img/icon/heart.svg" width="24">
                           			</c:otherwise>
                           		</c:choose>
                           </div>
                           <div class="tit"> 찜하기</div>
                        </div>   
                        <div class="box">
                           <div class="icon">
                           	<a href="#" onclick="clip(); return false;">
                           	<img src="${pageContext.request.contextPath}/img/icon/share.svg" height="24">
                           	</a>
                           </div>
                           <div class="tit">
                            공유
                           </div>
                        </div>      
                     </div>
                  <div class="get_gongu">
                     <div class="sub_button ${gongu.gongu_status eq '5'? 'close':'' }">
                        <a href="${pageContext.request.contextPath}/gonguPurchase.me?gongu_id=${gongu.gongu_id }&isdefault=1" id="mya">공구하기</a>
                     </div>
                  </div>      
               </div>
            </div>         
            </div>
            
         </div>   
         <c:if test="${gongu.gongu_status eq '5' }">
         	<div class="disabled_txt">
         		해당 공구는 <span>${gongu.gongu_disabled_text }</span> 사유로 인해 <span>${gongu.gongu_disabled_date }</span>에 숨김처리 될 예정입니다.
         		주문하신 회원님들께 양해와 이해를 부탁드립니다.
         	</div>
         </c:if>
         <div class="sanseimg">
               <img src="${pageContext.request.contextPath}/gongu/images/${gongu.detail_img }">
            </div>   

   </div>

	<script>

	
	$(function(){
		var fin_date = '${subday }';
		console.log(fin_date);
		console.log(typeof(fin_date));
		if(fin_date<0){
			$(".th_img").addClass('close');
			$(".sub_button").addClass('close');
		}

		
	});		
	

	function clip(){

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
		
	}

	function hearting(){
		var formheart = document.createElement("form");
		formheart.method="POST";
		formheart.action = '${pageContext.request.contextPath}/memberheart.me?id=${param.id}';
		
		var inputs = document.createElement("input");
		inputs.type="hidden";
		inputs.name="gid";

		
	     document.body.appendChild(formheart);
	     formheart.submit();
			
	}
	
	</script>

</body>
</html>