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
         <div class="th_img">
            <img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }">
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
                     
                     <div class="containernum">
                        <div class="num">
                            <script>
                            	var today = new Date();                           	
                            	
                            	var year = today.getFullYear(); 
                            	var month = today.getMonth() + 1;  
                            	var date = today.getDate();
                            	
                            	var curDate = year+month+date;                            
                            	var strDate2 = ${gongu.gongu_findate};
                            	console.log("데이트:"+strDate2);
                            	console.log(${gongu.gongu_findate})
                            	console.log("현재날짜:"+curDate);
                            	 var arr2 = strDate2.split('-'); 
                            	
                            	var dat2 = new Date(arr2[0],arr2[1],arr2[2]);
                            	var diff= curDate-dat2;
                            	var currDay = 24*60*60*1000;
                            	document.write("parseInt(diff/currDay)");
                            	console.log(paseInt(diff/currDay));
                            </script>                         
                        </div>
                        <div style="margin-right: 7px;">
                        	${gongu.gongu_findate }
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
                        <div class="box">
                           <div class="icon">
                           		<img src="${pageContext.request.contextPath}/img/icon/heart.svg" width="24">
                           </div>
                           <div class="tit"> 찜하기</div>
                        </div>   
                        <div class="box">
                           <div class="icon">
                           	<img src="${pageContext.request.contextPath}/img/icon/share.svg" height="24">
                           </div>
                           <div class="tit">
                            공유
                           </div>
                        </div>      
                     </div>
                  <div class="get_gongu">
                     <div class="sub_button">
                        <a href="${pageContext.request.contextPath}/gonguPurchase.me?gongu_id=${gongu.gongu_id }&isdefault=1" id="mya">공구하기</a>
                     </div>
                  </div>      
               </div>
            </div>         
            </div>
            
         </div>   
         <div class="sanseimg">
               <img src="${pageContext.request.contextPath}/gongu/images/${gongu.detail_img }">
            </div>   


   </div>



</body>
</html>