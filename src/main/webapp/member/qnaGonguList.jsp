<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공구검색</title>
<style>
	form{padding:20px;}
	form>p{margin:0 0 10px 0;}
	.input_group {display:flex; height:30px;}
	.input_group input[type='text']{flex:1 1 auto; border:1px solid #d4d4d4;}
	.input_group #btn_search{flex:0 0 auto; width:60px; padding:0 4px; margin-left:4px; border:none; background:#000; color:#fff; font-size:14px;}
	ul{padding:0; margin:10px 20px;}
	li{display:flex; justify-content:space-between; align-items:center; padding:6px; list-style:none; }
	li a{flex:0 0 10%; padding:5px; background:#ddd; font-size:14px; color:#000; text-decoration:none; text-align:center; cursor:pointer;}
	li a:hover{background:#999}
	li span{flex:0 0 82%; overflow:hidden; white-space:nowrap; text-overflow:ellipsis;}
	li:not(:last-child){border-bottom:1px solid #ddd;}
	.list_header span{font-size:14px; color:#999; font-weight:bold;}
	
	.noItem{text-align:center;}
</style>
</head>
<body>
<form id="form" action="${pageContext.request.contextPath}/qnaGonguListAction.go" method="post">
	<p>공구명을 입력해주세요</p>
	<div class="input_group"><input id="sch_input" name="search" type="text"><button id="btn_search" type="button">검색</button></div>
</form>

<c:if test="${searched ne '' && searched ne null }">

	<c:choose>
		<c:when test="${searchList.size() > 0 }">
			<ul>
				<li class="list_header"><span>공구명</span></li>
				<c:forEach var="gongu" items="${searchList }">
					<li>
						<input type="hidden" value="${gongu.gongu_id }"/>
						<span>
							${gongu.gongu_name }
						</span>
						<a onclick="selectGongu()">선택</a>
					</li>
					
				</c:forEach>
			</ul>
		</c:when>
		<c:otherwise>
			<p class="noItem">검색결과가 없습니다.</p>
		</c:otherwise>
	</c:choose>
</c:if>
<script>
	//부모창 입력값 자동 넣기
	/* var sch_keyword = opener.document.getElementById("search_gongu").value;
	document.getElementById("sch_input").value = sch_keyword; */
	
	document.addEventListener("DOMContentLoaded", function() {
		document.getElementById("btn_search").addEventListener('click', function() {
		  var keyword = document.getElementById("sch_input").value;
		  if (keyword.length > 0) {
			  document.getElementById("form").submit();
		  } else {
		    alert("키워드를 입력해주세요");
		  }
		});
	});
	
	//부모창을로 값 전송
	function selectGongu() {
		var gonguName = event.target.previousElementSibling.textContent.trim();
		var gonguId = event.target.previousElementSibling.previousElementSibling.value;
		//console.log(gonguName);
		//console.log(gonguId);
		opener.document.getElementById("search_gongu").value = gonguName;
		opener.document.getElementById("gongu_id").value = gonguId;
		window.self.close();
	}
	

	
</script>
</body>
</html>