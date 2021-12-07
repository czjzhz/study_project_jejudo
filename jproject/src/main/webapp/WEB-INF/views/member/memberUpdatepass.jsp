<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 비밀번호 수정</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./js/memberpassup.js"></script>

</head>
<body>
	<div id="join_wrap">
		<h2 class="join_title">회원 비밀번호 수정</h2>
		<form name="f" method="post" action="MemberUpdatepassok.do" onsubmit="return check()">
			<input type="hidden" name="id" id="id" value="${sessionScope.mb.passwd}<%-- ${mb.id} --%>">

			
			<table id="join_t">
				<%-- <tr>
					<th>아이디</th>
					<td>${edit.id}</td>
				</tr> --%>
			
				<tr>
					<th>새 비밀번호</th>
					<td>
					<input type="password" name="passwd" id="passwd1" size="14" class="input_box" /></td>
				</tr>

				<tr>
					<th>새 비밀번호 확인</th>
					<td>
					<input type="password" name="passwd2" id="passwd2" size="14" class="input_box" /></td>
				</tr>
			</table>
			<br>
			<div id="join_menu">
			<input type="submit" value="비밀번호 변경" class="input_button" /> 
			<input type="reset" value="취소" class="input_button" onclick="location='Mypage.do'" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			</div>
		</form>
	</div>
</body>
