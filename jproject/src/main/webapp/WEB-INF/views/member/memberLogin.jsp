<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인 폼</title>
</head>

<script> 
	function check() {                      
		if ($.trim($("#id").val()) == "") { // ID 유효성 검사
			alert("로그인 ID를 입력하세요.");
			$("#id").val("").focus();
			return false;
		}
		if ($.trim($("#passwd1").val()) == "") { // PW 유효성 검사
			alert("비밀번호를 입력하세요.");
			$("#passwd1").val("").focus();
			return false;
		}
	}

	// 비밀번호 찾기 공지창
	function pwdFind() {
		window.open("pwdFind.do", "비밀번호 찾기", "width=100,height=200");
		//자바 스크립트에서 window객체의 open("공지창 경로와 파일명","공지창 이름","공지창 속성")
		//메서드로 새로운 공지창을 만듬.폭이 400,높이가 400인 새로운 공지창을 만듬.단위는 픽셀
	}
</script>

<body>
	<div id="login_wrap">
		<h2 class="login_title">로그인</h2>
		<form method="post" action="memberLogin_ok.do"
	          onsubmit="return check()">
			<table id="login_table">
				<tr>
					<th>ID</th>
					<td><input name="id" id="id" size="20" class="input_box" /></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" id="pwd" size="20"
						class="input_box" /></td>
				</tr>
			</table>
			<div id="login_menu">
				<input type="submit" value="로그인" class="input_button" /> 
				<input type="button" value="비번찾기" class="input_button" onclick="pwdFind()" />
				<input type="button" value="회원가입" class="input_button" onclick="location='memberJoin.do'" />
			</div>
		</form>
	</div>
</body>
</html>