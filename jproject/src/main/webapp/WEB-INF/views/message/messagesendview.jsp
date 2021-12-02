<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../navi.jsp"%>

		<table border=1 align=center width=600>
			<caption>쪽지보기</caption>
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
				<td>${message.mdate}</td>
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
				<td colspan=2 align=center><input type="button" onclick="history.go(-1);" value="뒤로가기"></td>
			</tr>
		</table>
</body>
</html>