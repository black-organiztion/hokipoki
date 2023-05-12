<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

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
		font-size:12px;
		margin-bottom:3.9px;
	}
	.tit{
		font-size:18px;
		font-weight: bold;
		height:50px;
		margin-bottom: 11px;
	}
	.sub{
		display:flex;
		justify-content: space-between;
		height:33px;

		margin-top: 14px;	
		align-items: baseline;
	}
	
	.count{
		font-size:10px;
		color:#c9c9c9;
	}
	.num{
		display:flex;
		align-items: baseline;
	}
	.per{
		font-size:22px;
		font-weight: bold;
	}
	.price{
		margin-left:5px;
		font-size:26px;
		font-weight: bold;
		color:orange;
		
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
		margin-bottom: 70px;
		
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
							${(gongu.gongu_discount_price/gongu.gongu_price) * 100 }%
						</div>
						<div class="price">
							${gongu.gongu_discount_price}
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
							${(gongu.gongu_discount_price/gongu.gongu_price) * 100 }%
						</div>
						<div class="price">
							${gongu.gongu_discount_price}
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
							${(gongu.gongu_discount_price/gongu.gongu_price )* 100}%
						</div>
						<div class="price">
							${gongu.gongu_discount_price}
						</div>
					</div>
				</div>
			</div>	
		</div>
</c:forEach>
	</div>
</div>

</c:if>
