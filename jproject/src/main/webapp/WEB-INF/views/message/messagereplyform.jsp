<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답장하기</title>
</head>
<body>
<h1>답장하기</h1>
	<form action="<%=request.getContextPath()%>/messagereply.do" method="post">
	<input type="hidden" name="mno" value="${message.mno}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" id="id" name="id" value="${sessionScope.id }">
	<input type="hidden" id="sendid" name="sendid" value="${message.sendid }">
		
		받는 이 : ${sendid} <br>
		<br>
		<textarea name="msubject" id="msubject" cols="40" rows="1"
			style="resize: none;" placeholder="제목을 입력하세요."></textarea>
		<br>
		<textarea name="mcontent" id="mcontent" cols="40" rows="10"
			style="resize: none;" placeholder="내용을 입력하세요."></textarea>
		<br> <input type="submit" value="답장 보내기"  >
	</form> 

</body>
</html>