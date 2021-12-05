<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 닉네임 수정</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./js/membernickup.js"></script>

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
					<div id="join_wrap">
						<form name="f" method="post" action="MemberUpdatenickok.do"
							onsubmit="return check()">
							<!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
							<input type="hidden" name="id" id="id"
								value="${sessionScope.mb.id}">

							<table id="join_t">
								<%-- <tr>
					<th>아이디</th>
					<td>${edit.id}</td>
				</tr> --%>

								<!-- <tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd" id="passwd1"
						size="14" class="input_box" /></td>
				</tr>

				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="passwd2" id="passwd2"
						size="14" class="input_box" /></td>
				</tr> -->

								<tr>
									<th>닉네임</th>
									<td><input name="nickname" id="nickname" size="14"
										class="input_box" /> <input type="button" value="닉네임 중복확인"
										class="input_button" onclick="nick_check()" />
										<div id="nickcheck"></div></td>
								</tr>
							</table>
							<br>
							<div id="join_menu">
								<input type="submit" value="적용" class="input_button" /> <input
									type="reset" value="취소" class="input_button"
									onclick="location='Mypage.do'" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</body>
</html>