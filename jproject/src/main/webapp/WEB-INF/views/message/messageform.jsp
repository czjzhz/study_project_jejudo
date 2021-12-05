<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 보내기</title>
<link rel="stylesheet" href="./css/message.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function send() {
		//	$("#myform").click(function(){

		if ($("#msubject").val() == "") {
			alert("제목을 입력하세요");
			$("#msubject").focus();
			return false;
		}

		if ($("#mcontent").val() == "") {
			alert("내용을 입력하세요");
			$("#mcontent").focus();
			return false;
		}
		//	});	

		document.myform.action = "./messagesend.do";
		document.myform.submit();

		
//		self.close();
	}
</script>
</head>
<body>
	<div class="messagetitle"><h1>쪽지 보내기</h1></div>
	<form name="myform" id="myform">
	<input type="hidden" id="sendid" name="sendid" value="${sessionScope.mb.nickname}">
	<input type="hidden" id="rcvid" name="rcvid" value="${nickname}"> 
		
		보내는이 : ${sessionScope.mb.nickname} <br>
		받는 이 : ${nickname} <br>
		<br>
		<textarea name="msubject" id="msubject" cols="40" rows="1"
			style="resize: none;" placeholder="제목을 입력하세요."></textarea>
		<br>
		<textarea name="mcontent" id="mcontent" cols="40" rows="10"
			style="resize: none;" placeholder="내용을 입력하세요."></textarea>
		<br> <input type=button value="쪽지 보내기" onClick="send()">
	</form> 

</body>
</html>