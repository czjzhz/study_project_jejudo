<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원관리</title>
</head>
<body>
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
	<table border=1 align=center>
		<thead>
			<tr>
				<td>no</td>
				<td>id</td>
				<td>passwd</td>
				<td>name</td>
				<td>nickname</td>
				<td>age</td>
				<td>gender</td>
				<td>zip</td>
				<td>address1</td>
				<td>address2</td>
				<td>email</td>
				<td>phone</td>
				<td>profile</td>
				<td>info</td>
				<td>register</td>
				<td>memberpoint</td>
				<td>state</td>
				<td>delcont</td>
				<td>deldate</td>
				<td>관리</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty memberlist }">
				<tr>
					<td colspan="20" align=center>회원이 없습니다.</td>
				</tr>
			</c:if>

			<c:if test="${not empty memberlist }">
				<c:set var="no1" value="${no }"></c:set>
				<c:forEach var="q" items="${memberlist }">
					<tr>
						<td>${no1 }</td>
						<td>${q.id }</td>
						<td>${q.passwd }</td>
						<td>${q.name}</td>
						<td>${q.nickname }</td>
						<td>${q.age }</td>
						<td>${q.gender }</td>
						<td>${q.zip }</td>
						<td>${q.address1 }</td>
						<td>${q.address2 }</td>
						<td>${q.email }</td>
						<td>${q.phone }</td>
						<td>${q.profile }</td>
						<td>${q.info }</td>
						<td><fmt:formatDate value="${q.register }"
								pattern="yyyy-MM-dd " /></td>
						<td>${q.memberpoint }</td>
						<td>${q.state }</td>
						<td>${q.delcont }</td>
						<td><fmt:formatDate value="${q.deldate }"
								pattern="yyyy-MM-dd " /></td>
						<td>
						<form action="admin_member_stop.do">
								<input type="hidden" name="pageNum" value='${pp.currentPage}'>  
								<input type="hidden" name="id" value='${q.id}'>  
								<input type="hidden" name="state" value='${q.state}'>  
							<c:if test="${q.state == 1}"> <input type=submit value=정지 > </c:if>
							<c:if test="${q.state == 2}"> 탈퇴한 회원 </c:if>
							<c:if test="${q.state == 3}"> <input type=submit value=해제 > </c:if>
						</form>
						</td>

					</tr>
					<c:set var="no1" value="${no1 - 1}" />
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	
	<div align=center>
	<form action="admin_member.do">
		<input type="hidden" name="pageNum" value="1"> 
		<select name="search">
			<option value="id" <c:if test="${search=='id'}">selected="selected" 
				</c:if>>ID</option>
			<option value="name" <c:if test="${search=='name'}">selected="selected" 
				</c:if>>이름</option>
			<option value="nickname" <c:if test="${search=='nickname'}">selected="selected" 
				</c:if>>닉네임</option>
		</select> 
		<input type="text" name="keyword"> <input type="submit" value="확인">
	</form>

		<!-- 검색 했을 경우의 페이징 처리 -->
		<c:if test="${not empty keyword}">
			<c:if test="${pp.startPage > pp.pagePerBlk }">
				<a href="admin_member.do?pageNum=${pp.startPage - 1}&search=${search}&keyword=${keyword}">이전</a>
				
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<c:if test="${pp.currentPage==i}"></c:if>
				<a href="admin_member.do?pageNum=${i}&search=${search}&keyword=${keyword}">${i}</a>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<a href="$admin_member.do?pageNum=${pp.endPage + 1}&search=${search}&keyword=${keyword}">다음</a>
			</c:if>
		</c:if>

		<!-- 전체 목록의 페이징 처리 -->
		<c:if test="${empty keyword}">
			<c:if test="${pp.startPage > pp.pagePerBlk }">
				<a href="admin_member.do?pageNum=${pp.startPage - 1}">이전</a>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage}">
				<c:if test="${pp.currentPage==i}"></c:if>
				<a href="admin_member.do?pageNum=${i}">${i}</a>
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage}">
				<a href="admin_member.do?pageNum=${pp.endPage + 1}">다음</a>
			</c:if>
		</c:if>
		</div>


</body>
</html>