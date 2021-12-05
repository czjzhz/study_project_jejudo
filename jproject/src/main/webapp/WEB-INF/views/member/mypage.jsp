<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 메인화면</title>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
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
					<h3 class="text-primary">${edit.nickname}님</b>,환영합니다!<br>
						JEJU FRIEND에서 즐거운 제주 동행 되세요 :)
						</h2>
						<hr />
						<table class="table">
							<br>
							<tr>
								<td>나의 여행기록</td>
							</tr>
							<c:forEach var="mt" items="${myaccom}">
								<tr>
									<c:if test="${mt.adel =='y'}">
										<td colspan="3" lowspan="5">삭제된 글입니다.</td>
									</c:if>
									<c:if test="${mt.adel =='n'}">
										<td><a href="./aboardview.do?ano=${mt.ano}">${mt.asub}</a>
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</table>


						<table class="table">
							<br>
							<tr>
								<td>나의 리뷰</td>
							</tr>
							<c:forEach var="mr" items="${myreview}">
								<tr>
									<c:if test="${mr.rdel == 'y'}">
										<td colspan="3" lowspan="5">삭제된 글입니다.</td>
									</c:if>
									<c:if test="${mr.rdel == 'n'}">
										<td><a href="./rboardview.do?rno=${mr.rno}">${mr.rsub}</a>
										</td>
									</c:if>
							</c:forEach>
						</table>
						<table class="table">
							<br>
							<tr>
								<td>MY Q&A</td>
							<tr>
								<c:forEach var="ml" items="${mytrip}">
									<tr>
										<c:if test="${ml.qdel =='y'}">
											<td colspan="3" lowspan="5">삭제된 글입니다.</td>
										</c:if>
										<c:if test="${ml.qdel =='n'}">
											<td><a href="./qboardview.do?qno=${ml.qno}">${ml.qsub}</a>
											</td>
										</c:if>
								</c:forEach>
							</tr>
						</table>
						
						<table border="0">
				<br>
				<tr>
						<th colspan="2">
						<input type="button" value="회원탈퇴" class="btn btn-md btn-primary" onclick="location.href='MemberDel.do'" /> 
						<input type="button" value="메인페이지로 돌아가기" class="btn btn-md btn-primary" onclick="location.href='home.do'" />
						</th>
					</tr>
				</table>
				</div>
			</div>
		</div>
	</c:if>
</body>
</html>