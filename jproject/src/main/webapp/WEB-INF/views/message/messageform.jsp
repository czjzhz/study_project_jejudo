<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method=post action="messagesend.do">
<table border=1 width=400 align=center>
	<h1>쪽지보내기</h1>
	<tr><th>보내는이</th>
		<td><input type=text name="sendid"></td>
	</tr>
	<tr><th>받는이</th>
		<td><input type=text name="rcvid"></td>
	</tr>
	<tr><th>제목</th>
		<td><input type=text name="msubject"></td>
	</tr>
	<tr><th>내용</th>
		<td><textarea cols=40 rows=5 name="mcontent"></textarea></td>
	</tr>
	<tr><td colspan=2 align=center>
			<input type=submit value="쪽지 보내기">
		</td>
	</tr>
</table>
</form>

</body>
</html>