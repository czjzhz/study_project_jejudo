<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 메인화면</title>
</head>
<body>

	<c:if test="${sessionScope.mb == null }">
		<script>
			alert("세션이 만료되었습니다. 다시 로그인 하세요.");
			location.href = "MemberLogin.do";
		</script>
	</c:if>

	<c:if test="${sessionScope.mb != null }">
		<div id="main_wrap">
			<h2 class="main_title">My page</h2>
			<form method="post" action="MemberLogout.do">
				<table id="main_t">
					<tr>
						<td><c:if test="${empty sessionScope.mb.profile}"></c:if> 
						<c:if test="${!empty sessionScope.mb.profile}">
						<img src="<%=request.getContextPath() %>/upload/${sessionScope.mb.profile}" height="100" width="100" />
						</c:if>
					<tr>
						<td>${sessionScope.mb.nickname}님,환영합니다! <br> JEJU
							FRIEND에서 즐거운 제주 동행 되세요 :)
						</td>
					</tr>
					<tr>
						<th colspan="2"><input type="button" value="프로필 편집" class="input_button" onclick="location='MemberUpdate.do'" /> 
						<input type="button" value="메세지" class="input_button" /> 
						<input type="button" value="회원탈퇴" class="input_button" onclick="location='MemberDel.do'" /> 
						<input type="submit" value="로그아웃" class="input_button" /></th>
					</tr>

				</table>
			</form>
		</div>
	</c:if>

</body>
</html>