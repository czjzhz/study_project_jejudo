<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 상세페이지</title>
</head>
<body>

	<input type="button" onclick="location.href='./admin_notice.do'" value="공지관리">
	<input type="button" onclick="location.href='./admin_ad.do'" value="광고관리">
	&ensp;|&ensp;&nbsp;<input type="button" onclick="location.href='./admin_member.do'" value="회원관리">
	&ensp;|&ensp;&nbsp;<input type="button" onclick="location.href='./admin_with.do'" value="동행관리">
	<input type="button" onclick="location.href='./admin_review.do'" value="리뷰관리">
	<input type="button" onclick="location.href='./admin_qna.do'" value="Q&A관리">
	&ensp;|&ensp;&nbsp;<input type="button" onclick="location.href='./admin_logout.do'" value="로그아웃">
	<hr/>
	<h2 align=center>동행 상세페이지</h2>
	
	<table border=1 align='center'>
			<thead><tr>
				<th>no</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>아이디</th>
				<th>블라인드</th>
			</tr></thead>
		<c:forEach var="q" items="${withview}">
			<tbody><tr>
				<td>${q.ano}</td>
				<td>${q.asub}</td>
				<td><fmt:formatDate value="${q.areg}" pattern="yy-MM-dd " /></td>
				<td>${q.areadcount}</td>
				<td>${q.id}, ${q.nickname}</td>
				<td>${q.adel}</td>
			</tr>
			<tr><td>내용</td>
				<td colspan=5>${q.acont}</td>
			</tr>
			<tr><td colspan=6 align=center>	
				<c:if test="${ q.adel == 'y' }">
					<input type='button' value='블라인드 취소' 
						onclick="location.href='admin_with_stop.do?ano=${q.ano}&del=0&pageNum=${pageNum}'" />
				</c:if>		
				<c:if test="${ q.adel == 'n' }">
					<input type='button' value='블라인드 설정' 
						onclick="location.href='admin_with_stop.do?ano=${q.ano}&del=1&pageNum=${pageNum}'" />
				</c:if>	
					<input type='button' value='삭제' 
						onclick="if(confirm('삭제하시겠습니까?')) {location.href='admin_with_delete.do?ano=${q.ano}&pageNum=${pageNum}'}" /></td>
			</tr></tbody>
		</c:forEach>	
	</table>
	<br>
	<h2 align=center>댓글</h2>
	<c:if test="${empty withrpview }">
		<h3 align=center>관련 댓글이 없습니다.</h3>
	</c:if>
	<c:forEach var="q" items="${withrpview}">
	<table border=1 align=center>
		<tr>
			<th>no</th>
			<th>아이디</th>
			<th>작성일</th>
			<th>수정일</th>
		</tr>
		<tr>
			<td>${q.arno}</td>
			<td>${q.arnickname}</td>
			<td><fmt:formatDate value="${q.arreg}" pattern="yy-MM-dd " /></td>
			<td><fmt:formatDate value="${q.arupdate}" pattern="yy-MM-dd " /></td>
		</tr>
		<tr><td>내용</td>
			<td colspan=3>${q.arcont}</td>
		</tr>
		<tr><td colspan=4 align=center>
				<input type='button' value='삭제' 
						onclick="if(confirm('삭제하시겠습니까?')) {location.href='admin_withrp_delete.do?arno=${q.arno}&pageNum=${pageNum}'}" /></td>
	</table>
		</c:forEach>
</body>
</html>