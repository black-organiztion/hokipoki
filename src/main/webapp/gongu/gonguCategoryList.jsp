<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

</head>
<body>
<c:if test="${categoryList!=null }">
<div class="gongucontainer">
<p class="label">${categoryList.get(0).getCategory()}</p>
<div class="allgongu">
<c:forEach var = "gongu" items="${categoryList }" varStatus="status">
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
</body>
</html>