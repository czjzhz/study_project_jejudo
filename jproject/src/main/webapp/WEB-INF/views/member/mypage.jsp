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
				<table id="main_t" border="1">
					<tr>
						<td><c:if test="${empty sessionScope.mb.profile}"></c:if> <c:if
								test="${!empty sessionScope.mb.profile}">
								<img
									src="<%=request.getContextPath() %>/upload/${sessionScope.mb.profile}"
									height="100" width="100" />
							</c:if>
					<tr>
						<td>${sessionScope.mb.nickname}님,환영합니다!<br> JEJU
							FRIEND에서 즐거운 제주 동행 되세요 :)
						</td>
					</tr>
					<tr>
						<th colspan="2"><input type="button" value="프로필 편집"
							class="input_button" onclick="location='MemberUpdate.do'" /> <input
							type="button" value="메세지" class="input_button" /> <!-- <input type="button" value="회원탈퇴" class="input_button" onclick="location='MemberDel.do'" />  -->
							<input type="submit" value="로그아웃" class="input_button" /> <input
							type="button" value="메인페이지로 돌아가기" class="input_button"
							onclick="location='home.do'" /></th>
					</tr>
				</table>
				
			<%-- 	<table>
					<caption>지난 여행</caption>
					<c:forEach var="mt" items="${mytrip}">
						<tr>
							<td align=center>
							<a href="./BoardAccom.do?ano=${mt.qno}&ano=${mt.qsub}">${mt.qsub}</a>
								  &nbsp;&nbsp; 
								   동행 여행상태: <c:if test="${mt.acond == 1}">모집중</c:if> 
								          <c:if test="${mt.acond == 2}">모집완료</c:if>
							</td>
						</tr>
					</c:forEach>
				</table> --%>
				
				<table border="1">
					<caption>내가 쓴 글</caption>
					<tr>
						<td>test</td>
						<c:forEach var="ml" items="${mytrip}">
							<td align=center>
							<a href="./qboardlist.do?qno=${ml.qno}&qno=${ml.qsub}">${ml.qsub}</a>
							</td>
						</c:forEach>
					</tr>
				</table>
			</form>
		</div>
	</c:if>

</body>
</html>