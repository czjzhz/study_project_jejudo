<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 로그인</title>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
 function check(){
	 if($.trim($("#id").val())==""){
		 alert("로그인 아이디를 입력하세요!");
		 $("#id").val("").focus();
		 return false;
	 }
	 if($.trim($("#passwd").val())==""){
		 alert("비밀번호를 입력하세요!");
		 $("#passwd").val("").focus();
		 return false;
	 }
 }
</script>
 
</head>
<body>
	<h1>관리자 로그인</h1>
	<form method="post" action="admin_login_action.do" onsubmit="return check()">
		<table border=1 width=200>
			<tr><td>ID</td>
				<td><input type=text size=20 id="id" name="id"
					autofocus="autofocus" placeholder="아이디 입력" value="" />
			</tr>
			<br>
			<tr><td>PW</td>
				<td><input type="password" size=20 id="passwd" name="passwd"
					placeholder="비밀번호 입력" value="" />
			</tr>
			<tr>
				<td colspan=2 align=center><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
<br>
테스트 ID : admin / PW : 1234
</body>
</html>