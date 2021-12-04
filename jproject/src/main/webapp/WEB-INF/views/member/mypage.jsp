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
						<td><c:if test="${empty edit.profile}"></c:if> 
							<c:if  test="${!empty edit.profile}">
								  <img src="<%=request.getContextPath() %>/upload/${edit.profile}"  height="100" width="100" />
							</c:if>
					<tr>
						<td><b>${edit.nickname}님</b>, 환영합니다!<br> JEJU
							FRIEND에서 즐거운 제주 동행 되세요 :)
						</td>
					</tr>
					<tr>
						<th colspan="2">
						<input type="button" value="닉네임 변경" class="input_button" onclick="location.href='MemberUpdatenick.do'" /> 
						<input type="button" value="비밀번호 변경" class="input_button" onclick="location.href='MemberUpdatepass.do'" /> <!-- add -->
						<input type="button" value="내 정보 변경" class="input_button" onclick="location.href='MemberUpdate.do'" />  
						<input type="button" value="메세지" class="input_button" />
						<input type="submit" value="로그아웃" class="input_button" />  
						</th>
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
				<br>
				
				
	<%-- 				<caption>내가 참가한 여행</caption>
					<tr>
						<td>동행찾기</td>
						<c:forEach var="mj" items="${myjoin}">
						<c:if test="${mj.qdel =='y'}">
							<td colspan="5"> 삭제된 글입니다.</td>
						</c:if>
						<c:if test="${mj.qdel =='n'}">
							<td align=center>
							<a href="./enterlist.do?ano=${ml.qno}">${ml.qsub}</a>
							</td>
						</c:if>	
						</c:forEach>
					</tr>
				</table> --%>
				
				
				
				<table border="1">
				<br>
					<caption>내가 쓴 글</caption>
					
					<tr>
						<td>My QNA</td>
					</tr>	
						<c:forEach var="ml" items="${myqna}">
							<tr>
								<c:if test="${ml.qdel =='y'}">
									<td colspan="3" lowspan="5"> 삭제된 글입니다.</td>
								</c:if>
								<c:if test="${ml.qdel =='n'}">
									<td>
										<a href="./qboardview.do?qno=${ml.qno}">${ml.qsub}</a>
									</td>
								</c:if>	
							</tr>
						</c:forEach>
				</table>
				
				<table border="1">
				<br>
				<tr>
						<th colspan="2">
						<input type="button" value="회원탈퇴" class="input_button" onclick="location.href='MemberDel.do'" /> 
						<input type="button" value="메인페이지로 돌아가기" class="input_button" onclick="location.href='home.do'" />
						</th>
					</tr>
				</table>
			</form>
		</div>
	</c:if>

</body>
</html>