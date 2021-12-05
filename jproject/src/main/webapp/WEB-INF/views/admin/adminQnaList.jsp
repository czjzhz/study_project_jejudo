<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<title>QnA 리스트</title>
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
	<h2 align=center>QnA 리스트</h2>
	<table border=1 align='center'>
		<thead><tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>아이디</th>
			<th>블라인드</th>
			<th>관리</th>
		</tr></thead>
		
		<c:if test="${empty qnalist }">
			<tbody><tr>
				<td colspan="6" align=center>게시글이 없습니다.</td>
			</tr></tbody>
		</c:if>
		<c:if test="${not empty qnalist }">
		<c:forEach var="q" items="${qnalist}">
			<tbody><tr>
				<td>${q.qno }</td>
				<td><a href="admin_qna_view.do?qno=${q.qno}&pageNum=${pp.currentPage}"> ${q.qsub}</a></td>
				<td><fmt:formatDate value="${q.qreg}" pattern="yy-MM-dd " /></td>
				<td>${q.id}</td>
				<td>${q.qdel}</td>
				<td><input type='button' value='블라인드' onclick="" />
					<input type='button' value='삭제' onclick="" /></td>
			</tr></tbody>
		</c:forEach>
		</c:if>
	</table>

	<!-- 페이징 처리 -->
	<div id="save" style="display:block; visibility: visible;" align="center">
		<c:if test="${pp.startPage > pp.pagePerBlk }">
			<a href="admin_qna.do?pageNum=${pp.startPage - 1}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
		<c:if test="${pp.currentPage==i}"></c:if>
			<a href="admin_qna.do?pageNum=${i}">${i}</a>
		</c:forEach>
		<c:if test="${pp.endPage < pp.totalPage}">
		<a href="$admin_qna.do?pageNum=${pp.endPage + 1}">다음</a>
		</c:if>
	</div>
	
</body>
</html>