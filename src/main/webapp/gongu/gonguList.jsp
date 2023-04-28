<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${gonguList!=null }">
<c:forEach var = "gongu" items="${gonguList }" varStatus="status">

<a href="${pageContext.request.contextPath}/gonguView.go?id=${gongu.gongu_id}">
<img src="${pageContext.request.contextPath}/gongu/images/${gongu.thumbnail_img }" id="gonguImage">
</a>
카테고리${gongu.category}
공구명${gongu.gongu_name}
공구가격${gongu.gongu_discount_price}
원가${gongu.gongu_price}
공구마감일${gongu.gongu_findate}
참여중인 인원${gongu.gongu_reserve}
<c:if test="${((status.index+1)mod 4) ==0 }">
<br>
</c:if>
</c:forEach>



</c:if>

</body>
</html>