<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>회원관리</h1>
<hr>
<div class="list">
	<c:choose>
		<c:when test="${memberList.size() > 0 }">
			<c:forEach var="member" items="${memberList }">
				<div class="card">
					아이디 : ${member.member_id }<br>
					비밀번호 : ${member.member_pw }<br>
					이름 : ${member.member_name }<br>
					연락처 : ${member.member_tel }<br>
					이메일 : ${member.member_email }<br>
					추천인ID : ${member.recommend_id }<br>
					가입일 : ${member.member_date }
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			등록된 회원이 없습니다.
		</c:otherwise>
	</c:choose>
	
</div>