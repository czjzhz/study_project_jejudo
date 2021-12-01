<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 공지리스트</title>
</head>
<body>

	<script>
		function showcont(no) {
			var x = document.getElementsByTagName("div");
			for(var i=0;i<x.length;i++){
				if(x[i].id!=('showcont_'+(parseInt(no))) && x[i].id!=('save')){
					x[i].style.display="none";
			       	x[i].style.visibility='hidden';					
				}else{
					x[i].style.display="block";
					x[i].style.visibility='visible';
				}	
			}
		}
	</script>
	
	<!-- ckEditor --> 
	<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
	<!-- 왼쪽 네비게이 -->
	<%-- <%@ include file="adminnavi.jsp"%> --%>

<input type="button" onclick="location.href='./admin_notice.do'" value="공지관리">
<input type="button" onclick="location.href='./admin_ad.do'" value="광고관리">
&ensp;|&ensp;&nbsp;<input type="button" onclick="location.href='./admin_member.do'" value="회원관리">
&ensp;|&ensp;&nbsp;<input type="button" onclick="location.href='./admin_with.do'" value="동행관리">
<input type="button" onclick="location.href='./admin_review.do'" value="리뷰관리">
<input type="button" onclick="location.href='./admin_qna.do'" value="Q&A관리">
&ensp;|&ensp;&nbsp;<input type="button" onclick="location.href='./admin_logout.do'" value="로그아웃">
<hr/>
	<input type="button" value='공지쓰기' onclick="location.href='admin_notice_add.do'">
<br>
	<table border=1 align=center>
		<thead>
			<tr>
				<td>no</td>
				<td>공지제목</td>
				<td>등록일</td>
				<td>상태</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty noticelist }">
				<tr>
					<td colspan="4" align=center>공지가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty noticelist }">
				<c:forEach var="q" items="${noticelist}">
					<tr>
						<td>${q.nno}</td>
						<td onClick='showcont(${q.nno})'><a href="#">${q.nsubject}</a></td>
						<td><fmt:formatDate value="${q.ndate}" pattern="yyyy-MM-dd " /></td>
						<td>
							<c:if test="${q.nhide == 0}">게시중</c:if>
							<c:if test="${q.nhide == 1}">블라인드</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
<br>
	<c:forEach var="q" items="${noticelist}">
	<div id="showcont_${q.nno}" style="display:none; visibility: hidden;" align="center">
		<table border=1 >
			<tr><td>${q.nno} - ${q.nsubject} [${q.ndate}]</td></tr>
			<tr><td>${q.ncontent}</td></tr>
			<tr><td align = "center">
				<form action="admin_notice_blind.do">
				<input type="button" value='수정하기' onclick="location.href='admin_notice_update.do?nno=${q.nno}&pageNum=${currentPage}'">
				<input type="button" value='삭제하기' 
				onclick="if(confirm('삭제하시겠습니까?')) {location.href='admin_notice_delete.do?nno=${q.nno}&pageNum=${currentPage}'}">
					<input type="hidden" name="pageNum" value='${pp.currentPage}'>  
					<input type="hidden" name="nno" value='${q.nno}'>  
					<input type="hidden" name="nhide" value='${q.nhide}'>  
					<c:if test="${q.nhide == 0}"> <input type=submit value=블라인드 > </c:if>
					<c:if test="${q.nhide == 1}"> <input type=submit value=게시하기 > </c:if>
				</form>
			</td></tr>
		</table>
<br>
	</div>
	</c:forEach>
		<!-- 페이징 처리 -->
	<div id="save" style="display:block; visibility: visible;" align="center">
		<c:if test="${pp.startPage > pp.pagePerBlk }">
			<a href="admin_notice.do?pageNum=${pp.startPage - 1}">이전</a>
		</c:if>

		<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
			<c:if test="${pp.currentPage==i}"></c:if>
			<a href="admin_notice.do?pageNum=${i}">${i}</a>
		</c:forEach>

		<c:if test="${pp.endPage < pp.totalPage}">
			<a href="$admin_notice.do?pageNum=${pp.endPage + 1}">다음</a>
		</c:if>
	</div>
</body>
</html>