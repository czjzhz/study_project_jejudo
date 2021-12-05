<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<img
							src="https://blog.kakaocdn.net/dn/o1KIw/btqu9mflPY6/rGk1mM3iugV1c6jj9Z3E80/img.jpg" />
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
					<table class="table" align=center width=600>
						<tr>
							<td width=100 align=center>보낸 이</td>
							<td>${message.sendid}</td>
						</tr>
						<tr>
							<td align=center>받는 이</td>
							<td>${message.rcvid}</td>
							</th>
						</tr>
						<tr>
							<td align=center>보낸 날짜</td>
							<td><fmt:formatDate value="${message.mdate}"
					  pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						<tr>
							<td align=center>제목</td>
							<td>${message.msubject}</td>
						</tr>
						<tr>
							<td height=200 align=center>내용</td>
							<td>${message.mcontent}</td>
						</tr>
						<tr>
							<td colspan=2 align=center><input type="button"
								onclick="history.go(-1);" value="뒤로가기"> <input
								type="button" value="삭제하기"
								onclick="location.href='messagedelete.do?mno=${message.mno }&page=${page}'">
							</td>

						</tr>
					</table>
				</div>
			</div>
		</div>
	</c:if>
</body>
</html>