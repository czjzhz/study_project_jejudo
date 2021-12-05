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

<%@ include file="../navi.jsp"%>

	<c:if test="${sessionScope.mb == null }">
		<script>
			alert("세션이 만료되었습니다. 다시 로그인 하세요.");
			location.href = "MemberLogin.do";
		</script>
	</c:if>

	<c:if test="${sessionScope.mb != null }">
		<div class="container bootstrap snippets bootdey">
			<div class="row">
				<div class="col-md-3 md-margin-bottom-40">
					<c:if test="${empty edit.profile}"></c:if>
					<c:if test="${!empty edit.profile}">
						<img src="https://blog.kakaocdn.net/dn/o1KIw/btqu9mflPY6/rGk1mM3iugV1c6jj9Z3E80/img.jpg" />
<!-- 						<img src="<%=request.getContextPath() %>/upload/${edit.profile}" /> -->
					</c:if>

					<ul class="list-group sidebar-nav-v1 margin-bottom-40"
						id="sidebar-nav-1">
						<li class="list-group-item"><a href="MemberUpdatenick.do">닉네임
								변경</a></li>
						<li class="list-group-item"><a href="MemberUpdatepass.do">비밀번호
								변경</a></li>
						<li class="list-group-item"><a href="MemberUpdate.do">내
								정보 변경</a></li>
						<li class="list-group-item"><a href="rcvlist.do">받은 쪽지함</a></li>
						<li class="list-group-item"><a href="sendlist.do">보낸 쪽지함</a></li>
						<li class="list-group-item active"><input type="submit"
							value="로그아웃" class="input_button1" /></li>
					</ul>
					<hr>
				</div>
				<div class="col-md-9 text-content">
				<center>받은 쪽지: ${listcount}개</center>
<table class="table" align="center" width=800>
<c:forEach var="r" items="${rcvlist}">
		<tr>
			<td width="70%">
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
	</div>
	</div>
	</div>
	</c:if>
</body>
</html>