<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답장하기</title>
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
<div class="messagetitle"><h1>답장하기</h1></div>
	<form name="myform" id="myform">
	<input type="hidden" id="sendid" name="sendid" value="${sendid}">
	<input type="hidden" id="rcvid" name="rcvid" value="${rcvid}">
		
		보내는 이 : ${sendid} <br>
		받는 이 : ${rcvid} <br>
		<br>
		<textarea name="msubject" id="msubject" cols="40" rows="1"
			style="resize: none;" placeholder="제목을 입력하세요."></textarea>
		<br>
		<textarea name="mcontent" id="mcontent" cols="40" rows="10"
			style="resize: none;" placeholder="내용을 입력하세요."></textarea>
		<br> <input type="button" value="답장 보내기" onClick="send()">
	</form> 

</body>
</html>