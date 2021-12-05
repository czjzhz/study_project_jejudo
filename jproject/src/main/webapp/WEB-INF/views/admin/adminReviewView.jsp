<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세페이지</title>
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
	<h2 align=center>리뷰 상세페이지</h2>
	<table border=1 align='center'>
			<thead><tr>
				<th>no</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>아이디,닉네임</th>
				<th>블라인드</th>
			</tr></thead>
		<c:forEach var="q" items="${reviewview}">
			<tbody><tr>
				<td>${q.rno}</td>
				<td>${q.rsub}</td>
				<td><fmt:formatDate value="${q.rreg}" pattern="yy-MM-dd " /></td>
				<td>${q.rreadcount}</td>
				<td>${q.id}, ${q.nickname}</td>
				<td>${q.rdel}</td>
			</tr>
			<tr><td>내용</td>
				<td colspan=5>${q.rcont}</td>
			</tr>
			<tr><td colspan=6 align=center>	
				<c:if test="${ q.rdel == 'y' }">
					<input type='button' value='블라인드 취소' 
						onclick="location.href='admin_review_stop.do?rno=${q.rno}&del=0&pageNum=${pageNum}'" />
				</c:if>		
				<c:if test="${ q.rdel == 'n' }">
					<input type='button' value='블라인드 설정' 
						onclick="location.href='admin_review_stop.do?rno=${q.rno}&del=1&pageNum=${pageNum}'" />
				</c:if>	
					<input type='button' value='삭제' 
						onclick="if(confirm('삭제하시겠습니까?')) {location.href='admin_review_delete.do?rno=${q.rno}&pageNum=${pageNum}'}" /></td>
			</tr></tbody>
		</c:forEach>	
	</table>
	<br>
	<h2 align=center>댓글</h2>
	<c:if test="${empty rpview }">
		<h3 align=center>관련 댓글이 없습니다.</h3>
	</c:if>
	<c:forEach var="q" items="${rpview}">
	<table border=1 align=center>
		<tr>
			<th>no</th>
			<th>아이디</th>
			<th>작성일</th>
			<th>수정일</th>
		</tr>
		<tr>
			<td>${q.rrno}</td>
			<td>${q.rrnickname}</td>
			<td><fmt:formatDate value="${q.rrreg}" pattern="yy-MM-dd " /></td>
			<td><fmt:formatDate value="${q.rrupdate}" pattern="yy-MM-dd " /></td>
		</tr>
		<tr><td>내용</td>
			<td colspan=3>${q.rrcont}</td>
		</tr>
		<tr><td colspan=4 align=center><input type='button' value='삭제' 
						onclick="if(confirm('삭제하시겠습니까?')) {location.href='admin_reviewrp_delete.do?rrno=${q.rrno}&pageNum=${pageNum}'}" /></td>
	</table>
		</c:forEach>
</body>
</html>