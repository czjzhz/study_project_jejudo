<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1 align="center" width=800>
<c:forEach var="r" items="${rcvlist}">
		<tr>
			<td>
			<a href="messagercvview.do?mno=${r.mno}&page=${page}">
				${r.msubject}
			</a>
			</td>
			<td>${r.sendid}</td>
			<td>
				<fmt:formatDate value="${r.mdate}"
					  pattern="yyyy-MM-dd HH:mm:ss"/>	
			</td>
		</tr>
		</c:forEach>
</table>

<!-- 페이지 처리 -->
	<center>
	<c:if test="${listcount > 0}">
	
		<!-- 1page로 이동 -->
		<a href="rcvlist.do?page=1" style="text-decoration:none"> < </a>
		
		<!-- 이전 블럭으로 이동 -->
		<c:if test="${startPage > 10}">
			<a href="rcvlist.do?page=${startPage-10}">[이전]</a>
		</c:if>
		
		<!-- 각 블럭에 10개의 페이지 출력 -->
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${i == page }">		<!-- 현재 페이지 -->
				[${i}]
			</c:if>
			<c:if test="${i != page }">		<!-- 현재 페이지가 아닌 경우 -->
				<a href="rcvlist.do?page=${i}">[${i}]</a>
			</c:if>
		</c:forEach>
		
		<!-- 다음 블럭으로 이동 -->
		<c:if test="${endPage < pageCount }">
			<a href="rcvlist.do?page=${startPage+10}">[다음]</a>
		</c:if>
		
		<!-- 마지막 페이지로 이동 -->
		<a href="rcvlist.do?page=${pageCount}" style="text-decoration:none"> > </a>
		
	</c:if>
	</center>
</body>
</html>